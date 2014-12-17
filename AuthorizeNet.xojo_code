#tag Module
Protected Module AuthorizeNet
	#tag Method, Flags = &h0
		Function ProcessCC(dt as Dictionary, lbTesting as Boolean = True) As Dictionary
		  dim S as new HTTPSecureSocket
		  Dim d As New Dictionary
		  Dim Keys(), k, v as Variant
		  
		  
		  '
		  d.Value("x_email") = dt.Lookup("x_email", "")
		  d.Value("x_card_num") = dt.Lookup("x_card_num", "")
		  d.Value("x_exp_date") = dt.Lookup("x_exp_date", "")
		  d.Value("x_card_code") = dt.Lookup("x_card_code", "")
		  d.Value("x_description") = dt.Lookup("x_description", "")
		  d.Value("x_amount") = dt.Lookup("x_amount", "")
		  d.Value("x_first_name") = dt.Lookup("x_first_name", "")
		  d.Value("x_last_name") = dt.Lookup("x_last_name", "")
		  d.Value("x_address") = dt.Lookup("x_address", "")
		  d.Value("x_city") = dt.Lookup("x_city", "")
		  d.Value("x_state") = dt.Lookup("x_state", "")
		  d.Value("x_zip") = dt.Lookup("x_zip", "")
		  d.Value("x_phone") = dt.Lookup("x_phone", "")
		  d.Value("x_country") = dt.Lookup("x_country", "")
		  
		  
		  
		  
		  d.Value("x_login") = msAuthNetLoginId
		  d.Value("x_tran_key") = msAuthNetTranKey
		  d.Value("x_version") = "3.1"
		  d.Value("x_delim_char") = "|"
		  d.Value("x_delim_data") = "TRUE"
		  d.Value("x_url") = "FALSE"
		  d.Value("x_type") = "AUTH_CAPTURE"
		  d.Value("x_method") = "CC"
		  d.Value("x_relay_response") = "FALSE"
		  d.Value("x_merchant_email")  = "admin@aspe.org"
		  
		  'd.Value("x_Receipt_Link_URL") = "http://www.yoursite.com/cgi-bin/yourreceiptapp.cgi"
		  
		  S.ConnectionType = SSLSocket.TLSv1
		  S.SetFormData(d)
		  
		  // This service simply returns the post data as the result
		  Dim result As String
		  if lbTesting then
		    'd.Value("x_test_request") = "TRUE"
		    //developer.authorize.net/tools/paramdump/index.php
		    result = S.Post("https://test.authorize.net/gateway/transact.dll", 30) // Synchronous
		  else
		    result = S.Post("https://secure.authorize.net/gateway/transact.dll", 30) // Synchronous
		  end
		  
		  result = DefineEncoding(result, Encodings.UTF8)
		  
		  Dim DataResult() as String
		  Dim dicResultCode as New Dictionary
		  
		  DataResult = result.Split("|")
		  
		  Select Case DataResult(0)
		    '1 = Approved
		    '2 = Declined
		    '3 = Error
		    
		  Case "1"
		    dicResultCode.Value("ResponseCode") = "Approved"
		  Case "2"
		    dicResultCode.Value("ResponseCode") = "Declined"
		  Case "3"
		    dicResultCode.Value("ResponseCode") = "Error"
		  End
		  
		  Select Case DataResult(2)
		  Case "6"
		    dicResultCode.Value("ResponseReasonCode") = "The credit card number is invalid."
		  case "7"
		    dicResultCode.Value("ResponseReasonCode") = "The credit card expiration date is invalid."
		  Case "8"
		    dicResultCode.Value("ResponseReasonCode") = "The credit card has expired."
		  else
		    dicResultCode.Value("ResponseReasonCode") = ""
		  end
		  
		  dicResultCode.Value("ResponseReasonText") = DataResult(3)
		  
		  Select Case DataResult(5)
		  Case "A"
		    dicResultCode.Value("AVSResponse") = "Address (Street) matches, ZIP does not"
		  Case "B"
		    dicResultCode.Value("AVSResponse") = "Address information not provided for AVS check"
		  Case "E"
		    dicResultCode.Value("AVSResponse")  = "AVS error"
		  Case "G"
		    dicResultCode.Value("AVSResponse")  = "Non-U.S. Card Issuing Bank"
		  Case "N"
		    dicResultCode.Value("AVSResponse")  = "No Match on Address (Street) or ZIP"
		    
		    'P = AVS not applicable for this transaction
		    'R = Retry—System unavailable or timed out
		    'S = Service not supported by issuer
		    'U = Address information is unavailable
		    
		  Case "W"
		    dicResultCode.Value("AVSResponse")  = "Nine digit ZIP matches, Address (Street) does not"
		  Case "X"
		    dicResultCode.Value("AVSResponse")  = "Address (Street) and nine digit ZIP match"
		  Case "Y"
		    dicResultCode.Value("AVSResponse")  = "Address (Street) and five digit ZIP match"
		  Case "Z"
		    dicResultCode.Value("AVSResponse")  = "Five digit ZIP matches, Address (Street) does not"
		  end
		  
		  dicResultCode.Value("TransActionID")  = DataResult(6)
		  
		  Return dicResultCode
		  'MsgBox(result)
		End Function
	#tag EndMethod


	#tag Note, Name = Untitled
		
		Table 16
		Payment Gateway Response Fields
		Order
		Field Name
		Description
		1
		Response Code
		Value: The overall status of the transaction
		Format:
		■
		1 = Approved
		■
		2 = Declined
		■
		3 = Error
		■
		4 = Held for Review
		2
		Response Subcode
		Value: A code used by the payment gateway for internal transaction tracking
		3
		Response Reason Code
		Value: A code that represents more details about the result of the transaction
		Format: Numeric
		Notes: See the Response Code Details section of this document for a listing of response reason codes.
		4
		Response Reason Text
		Value: A brief description of the result, which corresponds with the response reason code
		Format: Text
		Notes: You can generally use this text to display a transaction result or error to the customer. However, review theResponse Code Details section of this document to identify any specific texts you do not want to pass to the customer.
		5
		Authorization Code
		Value: The authorization or approval code
		Format: 6 characters
		6
		AVS Response
		Value: The Address Verification Service (AVS) response code
		Format:
		■
		A = Address (Street) matches, ZIP does not
		■
		B = Address information not provided for AVS check
		■
		E = AVS error
		■
		G = Non-U.S. Card Issuing Bank
		■
		N = No Match on Address (Street) or ZIP
		■
		P = AVS not applicable for this transaction
		■
		R = Retry—System unavailable or timed out
		■
		S = Service not supported by issuer
		■
		U = Address information is unavailable
		■
		W = Nine digit ZIP matches, Address (Street) does not
		■
		X = Address (Street) and nine digit ZIP match
		■
		Y = Address (Street) and five digit ZIP match
		■
		Z = Five digit ZIP matches, Address (Street) does not
		Notes: Indicates the result of the AVS filter.
		For more information about AVS, see the Merchant Integration Guide at http://www.authorize.net/support/merchant/.
		7
		Transaction ID
		Value: The payment gateway-assigned identification number for the transaction
		Format: When x_test_request is set to a positive response, or when Test Mode is enabled on the payment gateway, this value will be “0.”
		Notes: This value must be used for any follow on transactions such as a CREDIT, PRIOR_AUTH_CAPTURE or VOID.
		8
		Invoice Number
		Value: The merchant-assigned invoice number for the transaction
		Format: Up to 20 characters (no symbols)
		9
		Description
		Value: The transaction description
		Format: Up to 255 characters (no symbols)
		10
		Amount
		Value: The amount of the transaction
		Format: Up to 15 digits
		11
		Method
		Value: The payment method
		CC or ECHECK
		12
		Transaction Type
		Value: The type of credit card transaction
		Format: AUTH_CAPTURE, AUTH_ONLY, CAPTURE_ONLY, CREDIT, PRIOR_AUTH_CAPTUREVOID
		13
		Customer ID
		Value: The merchant-assigned customer ID
		Format: Up to 20 characters (no symbols)
		14
		First Name
		Value: The first name associated with the customer’s billing address
		Format: Up to 50 characters (no symbols)
		15
		Last Name
		Value: The last name associated with the customer’s billing address
		Format: Up to 50 characters (no symbols)
		16
		Company
		Value: The company associated with the customer’s billing address
		Format: Up to 50 characters (no symbols)
		17
		Address
		Value: The customer’s billing address
		Format: Up to 60 characters (no symbols)
		18
		City
		Value: The city of the customer’s billing address
		Format: Up to 40 characters (no symbols)
		19
		State
		Value: The state of the customer’s billing address
		Format: Up to 40 characters (no symbols) or a valid
		two-character state code
		20
		ZIP Code
		Value: The ZIP code of the customer’s billing address
		Format: Up to 20 characters (no symbols)
		21
		Country
		Value: The country of the customer’s billing address
		Format: Up to 60 characters (no symbols)
		22
		Phone
		Value: The phone number associated with the customer’s billing address
		Format: Up to 25 digits (no letters). For example, (123)123-1234
		23
		Fax
		Value: The fax number associated with the customer’s billing address
		Format: Up to 25 digits (no letters). For example, (123)123-1234
		24
		Email Address
		Value: The customer’s valid email address
		Format: Up to 255 characters
		25
		Ship To First Name
		Value: The first name associated with the customer’s shipping address
		Format: Up to 50 characters (no symbols)
		26
		Ship To Last Name
		Value: The last name associated with the customer’s shipping address
		Format: Up to 50 characters (no symbols)
		27
		Ship To Company
		Value: The company associated with the customer’s shipping address
		Format: Up to 50 characters (no symbols)
		28
		Ship To Address
		Value: The customer’s shipping address
		Format: Up to 60 characters (no symbols)
		29
		Ship To City
		Value: The city of the customer’s shipping address
		Format: Up to 40 characters (no symbols)
		30
		Ship To State
		Value: The state of the customer’s shipping address
		Format: Up to 40 characters (no symbols) or a valid two-character state code
		31
		Ship To ZIP Code
		Value: The ZIP code of the customer’s shipping address
		Format: Up to 20 characters (no symbols)
		32
		Ship To Country
		Value: The country of the customer’s shipping address
		Format: Up to 60 characters (no symbols)
		33
		Tax
		Value: The tax amount charged
		Format: Numeric
		Notes: Delimited tax information is not included in the transaction response.
		34
		Duty
		Value: The duty amount charged
		Format: Numeric
		Notes: Delimited duty information is not included in the transaction response.
		35
		Freight
		Value: The freight amount charged
		Format: Numeric
		Notes: Delimited freight information is not included in the transaction response.
		36
		Tax Exempt
		Value: The tax exempt status
		Format: TRUE, FALSE, T, F, YES, NO, Y, N, 1, 0
		37
		Purchase Order Number
		Value: The merchant assigned purchase order number
		Format: Up to 25 characters (no symbols)
		38
		MD5 Hash
		Value: The payment gateway-generated MD5 hash value that can be used to authenticate the transaction response.
		Notes: Optional. Transaction responses are returned using SSL/TLS, so this field is useful mainly as a redundant security check.
		39
		Card Code Response
		Value: The card code verification (CCV) response code
		Format:
		■
		M = Match
		■
		N = No Match
		■
		P = Not Processed
		■
		S = Should have been present
		■
		U = Issuer unable to process request
		Notes: Indicates the result of the CCV filter.
		For more information about CCV, see the Merchant Integration Guide at http://www.authorize.net/support/merchant/.
		40
		Cardholder Authentication Verification Response
		Value: The cardholder authentication verification response code
		Format: Blank or not present = CAVV not validated
		■
		0 = CAVV not validated because erroneous data was submitted
		■
		1 = CAVV failed validation
		■
		2 = CAVV passed validation
		■
		3 = CAVV validation could not be performed; issuer attempt incomplete
		■
		4 = CAVV validation could not be performed; issuer system error
		■
		5 = Reserved for future use
		■
		6 = Reserved for future use
		■
		7 = CAVV attempt – failed validation – issuer available (U.S.-issued card/non-U.S acquirer)
		■
		8 = CAVV attempt – passed validation – issuer available (U.S.-issued card/non-U.S. acquirer)
		■
		9 = CAVV attempt – failed validation – issuer unavailable (U.S.-issued card/non-U.S. acquirer)
		■
		A = CAVV attempt – passed validation – issuer unavailable (U.S.-issued card/non-U.S. acquirer)
		■
		B = CAVV passed validation, information only, no liability shift
		51
		Account Number
		Value: Last 4 digits of the card provided
		Format: Alphanumeric (XXXX6835)
		Notes: This field is returned with all transactions.
		52
		Card Type
		Value: Visa, MasterCard, American Express, Discover, Diners Club, JCB
		Format: Text
		53
		Split Tender ID
		Value: The value that links the current authorization request to the original authorization request. This value is returned in the reply message from the original authorization request
		Format: Alphanumeric
		Notes: This is only returned in the reply message for the first transaction that receives a partial authorization.
		54
		Requested Amount
		Value: Amount requested in the original authorization
		Format: Numeric
		Notes: This is present if the current transaction is for a prepaid card or if a splitTenderId was sent in.
		55
		Balance On Card
		Value: Balance on the debit card or prepaid card
		Format: Numeric
		Notes: Can be a positive or negative number. This has a value only if the current transaction is for a prepaid card
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private msAuthNetLoginId As String = "asp174263439"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private msAuthNetTranKey As String = "2JAE6h7wt3L26kPw"
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
