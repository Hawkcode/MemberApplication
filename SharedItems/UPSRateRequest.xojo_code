#tag Class
Protected Class UPSRateRequest
	#tag Method, Flags = &h0
		Sub constructor()
		  mySocket=new HTTPSecureSocket
		  mySocket.Yield=true
		  mySocket.ConnectionType=SSLSocket.TLSv12
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function gen_package_JSON() As JSONItem
		  dim j as new JSONItem
		  dim d As new JSONItem
		  dim u as new JSONItem
		  dim w as new JSONItem
		  dim pt as new JSONItem
		  
		  pt.Value("Code")=packageTypeCode
		  pt.Value("Description")="Rate"
		  j.Value("PackagingType")=pt
		  
		  u.Value("Code")="IN"
		  u.Value("Description")="inches"
		  d.value("UnitOfMeasurement")=u
		  
		  d.Value("Length")=PackageLengthIn
		  d.Value("Width")=PackageWidthIn
		  d.Value("Height")=PackageHeightIn
		  
		  j.Value("Dimensions")=d
		  
		  w=new JSONItem
		  u=new JSONItem
		  u.Value("Code")="Lbs"
		  u.Value("Description")="pounds"
		  w.value("UnitOfMeasurement")=u
		  w.Value("Weight")=PackageWeightLbs
		  
		  j.Value("PackageWeight")=w
		  Return j
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function gen_shipFrom_JSON() As JSONItem
		  dim s As new JSONItem
		  dim j as new JSONItem
		  dim a As new JSONItem
		  dim al As new JSONItem
		  
		  a.Value("PostalCode")=fromPostalCode
		  
		  a.Value("CountryCode")=fromCountryCode
		  
		  for i as integer=0 to fromAddress.Ubound
		    if fromAddress(i)<>"" then al.Append fromAddress(i)
		  next
		  if al.Count>0 then a.Value("AddressLine")=al
		  
		  j.Value("Address")=a
		  
		  Return j
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function gen_shipTo_JSON() As JSONItem
		  dim s As new JSONItem
		  dim j as new JSONItem
		  dim a As new JSONItem
		  dim al As new JSONItem
		  
		  a.Value("PostalCode")=toPostalCode
		  
		  a.Value("CountryCode")=toCountryCode
		  
		  for i as integer=0 to toAddress.Ubound
		    if toAddress(i)<>"" then al.Append toAddress(i)
		  next
		  if al.Count>0 then a.Value("AddressLine")=al
		  
		  j.Value("Address")=a
		  
		  Return j
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParseResponse(responseText as String)
		  Dim j As new JSONItem(responseText)
		  
		  
		  if j.HasName("Fault") then    //error occurred
		    dim f as JSONItem=j.Child("Fault").Child("detail").Child("Errors").Child("ErrorDetail").Child("PrimaryErrorCode")
		    
		    Success=False
		    ChargeTotal=""
		    ChargeCurrencyCode=""
		    AlertMessage=f.Value("Description")
		    
		  else
		    
		    dim rr as JSONItem=j.Value("RateResponse")
		    dim rs As JSONItem=rr.Value("RatedShipment")
		    dim ra As JSONItem=rs.Value("RatedShipmentAlert")
		    
		    if rs.HasName("RatedShipmentAlert") then
		      dim alert as string
		      if ra.IsArray then
		        for i as integer=0 to ra.Count-1
		          alert=alert+ra.Child(i).Value("Description")+chr(10)
		        next
		      else
		        alert=ra.Value("Description")
		      end if
		      
		      dim tc As JSONItem=rs.Value("TotalCharges")
		      
		      Success=true
		      ChargeTotal=tc.Value("MonetaryValue")
		      ChargeCurrencyCode=tc.Value("CurrencyCode")
		      AlertMessage=alert
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunQuery()
		  dim j as new JSONItem //main JSON object
		  dim sec as new JSONItem //UPSSecurity
		  dim ut as new JSONItem //username token
		  dim st as new JSONItem //service access token
		  st.Value("AccessLicenseNumber")=AccessLicenseNumber
		  sec.Value("ServiceAccessToken")=st
		  j.Value("UPSSecurity")=sec
		  
		  dim rr as new JSONItem //rate request
		  dim r As new JSONItem 
		  dim sh as new JSONItem
		  r.Value("RequestOption")="Rate"
		  rr.Value("Request")=r
		  
		  
		  dim sv as new JSONItem //Service
		  sv.Value("Code")=serviceCode
		  sv.Value("Description")="Rate"
		  sh.Value("Service")=sv
		  
		  sh.Value("Package")=gen_package_JSON
		  sh.Value("Shipper")=gen_shipFrom_JSON
		  sh.Value("ShipTo")=gen_shipTo_JSON
		  
		  rr.Value("Shipment")=sh
		  
		  j.Value("RateRequest")=rr
		  
		  
		  mySocket.SetRequestContent(j.ToString, "application/x-www-form-urlencoded")
		  Response=mySocket.Post(URL,30)
		  ParseResponse(Response)
		  
		  'j.Compact=false
		  'break
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Shipping Codes
		
		Package types:
		
		01 = Bag
		02 = Box
		03 = Carton/Piece
		04 = Crate
		05 = Drum
		06 = Pallet/Skid
		07 = Roll
		08 = Tube
		
		Shipping Services
		--International--
		11 = UPS Standard
		07 = UPS Worldwide Express
		08 = UPS Worldwide Expedited
		54 = UPS Worldwide Express Plus
		65 = UPS Worldwide Saver
		--Domestic--
		02 = UPS 2nd Day Air
		59 = UPS 2nd Day Air A.M.
		12 = UPS 3 Day Select
		03 = UPS Ground
		01 = UPS Next Day Air
		14 = UPS Next Day Air Early
		13 = UPS Next Day Air Saver
		
		
		
	#tag EndNote

	#tag Note, Name = Usage
		
		The value for the URL constant
		
		For testing/debugging, use :
		https://wwwcie.ups.com/rest/Rate
		
		For production, use:
		https://onlinetools.ups.com/rest/Rate
		
		
		Be sure to set your API key in the AccessLicenseNumber Constant
		
		
		To run a query:
		
		Create a new instance of the class
		
		set the desired values. 
		
		Minimum required values are:
		   to/fromCountryCode   to/fromPostalCode
		   PackageWidthIn  PackageHeightIn PackageLengthIn  PackageWeightLbs
		   PackageTypeCode  and serviceCode (see Shipping Codes Note)
		
		Once values are set, call UPSRateRequest.RunQuery
		ChargeTotal, ChargeCurrencyCode and AlertMessage will be populated and Success property will be set to true or false
		
		Example:
		
		dim q as new UPSRateRequest
		
		q.toCountryCode=FR
		q.toPostalCode=75001
		q.fromCountryCode=US
		q.fromPostalCode=85007
		q.PackageHeightIn=2
		q.PackageLengthIn=11
		q.PackageWidthIn=8
		q.PackageWeightLbs=4
		q.PackageTypeCode=02
		q.ShippingMethodCode=08
		
		q.RunQuery
		
		if q.Success then Return q.ChargeTotal
		
	#tag EndNote


	#tag Property, Flags = &h0
		AlertMessage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ChargeCurrencyCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ChargeTotal As String
	#tag EndProperty

	#tag Property, Flags = &h0
		fromAddress(2) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		fromCity As String
	#tag EndProperty

	#tag Property, Flags = &h0
		fromCountryCode As String = "US"
	#tag EndProperty

	#tag Property, Flags = &h0
		fromPostalCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		fromStateProvinceCode As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mySocket As HTTPSecureSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		PackageHeightIn As string
	#tag EndProperty

	#tag Property, Flags = &h0
		PackageLengthIn As String
	#tag EndProperty

	#tag Property, Flags = &h0
		PackageTypeCode As String = "02"
	#tag EndProperty

	#tag Property, Flags = &h0
		PackageWeightLbs As String
	#tag EndProperty

	#tag Property, Flags = &h0
		PackageWidthIn As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Response As String
	#tag EndProperty

	#tag Property, Flags = &h0
		serviceCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ShippingMethodCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Success As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		toAddress(2) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		toCity As String
	#tag EndProperty

	#tag Property, Flags = &h0
		toCountryCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		toPostalCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		toStateProvinceCode As String
	#tag EndProperty


	#tag Constant, Name = AccessLicenseNumber, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"FD4473173EF25FBC"
	#tag EndConstant

	#tag Constant, Name = URL, Type = Text, Dynamic = False, Default = \"https://onlinetools.ups.com/rest/Rate", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="fromCountryCode"
			Visible=false
			Group="Behavior"
			InitialValue="US"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="fromPostalCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="toCountryCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="toPostalCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PackageWeightLbs"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PackageWidthIn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PackageLengthIn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PackageHeightIn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShippingMethodCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="serviceCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PackageTypeCode"
			Visible=false
			Group="Behavior"
			InitialValue="01"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="fromCity"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="fromStateProvinceCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="toCity"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="toStateProvinceCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChargeTotal"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChargeCurrencyCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Success"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlertMessage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Response"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
