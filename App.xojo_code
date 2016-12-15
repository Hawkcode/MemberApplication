#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open(args() as String)
		  self.Security.FrameEmbedding = WebAppSecurityOptions.FrameOptions.Allow
		  App.AutoQuit = True
		  App.Timeout = 1
		  App.SessionTimeout = 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(Error As RuntimeException) As Boolean
		  dim ls as String
		  
		  ls = "Runtime Exception: " + "Err 08261235: Email = " + frmAppllcation.CreditCard.txtCCEmail.Text + " " + Error.Type + EndOfLine + _
		  "                           Reason: " + error.Reason + EndOfLine + _
		  "                     Error Number: " + error.ErrorNumber.ToText + EndOfLine + _
		  "                          Message: " + error.Message + EndOfLine + _
		  "                            Stack: " + Join(error.Stack())
		  WriteLog(ls)
		  
		  Return False
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub WriteLog(lsText as String)
		  dim f as folderitem
		  
		  f= GetFolderItem("log.txt") 'GetFolderItem("").parent.child("log.txt")
		  
		  dim tos as TextOutputStream
		  Dim ld as New Date
		  
		  if f.exists then
		    tos = TextOutputStream.Append(f)
		  else
		    tos = TextOutputStream.create(f)
		  end
		  
		  tos.WriteLine ld.ShortDate + " " + ld.LongTime  + " - " + lsText
		  tos.close
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		gdAffiliateCoupon As Double = -90
	#tag EndProperty

	#tag Property, Flags = &h0
		gdAffiliateMemberPrice As Double = 190
	#tag EndProperty

	#tag Property, Flags = &h0
		gdAssociateCoupon As Double = -70
	#tag EndProperty

	#tag Property, Flags = &h0
		gdAssociateMemberPrice As Double = 170
	#tag EndProperty

	#tag Property, Flags = &h0
		gdDataBookBoth As Double = 50
	#tag EndProperty

	#tag Property, Flags = &h0
		gdDonationEducation As Integer = 25
	#tag EndProperty

	#tag Property, Flags = &h0
		gdDonationPE As Double = 25
	#tag EndProperty

	#tag Property, Flags = &h0
		gdDonationResearch As Double = 25
	#tag EndProperty

	#tag Property, Flags = &h0
		gdDonationSteele As Double = 25
	#tag EndProperty

	#tag Property, Flags = &h0
		gdFullCoupon As Double = -90
	#tag EndProperty

	#tag Property, Flags = &h0
		gdFullMemberPrice As Double = 190
	#tag EndProperty

	#tag Property, Flags = &h0
		gdGovernCoupon As Double = -90
	#tag EndProperty

	#tag Property, Flags = &h0
		gdGovernmental As Double = 190
	#tag EndProperty

	#tag Property, Flags = &h0
		gdSpecialCoupon As Double = -90
	#tag EndProperty

	#tag Property, Flags = &h0
		gdSpecialMemberPrice As Double = 190
	#tag EndProperty

	#tag Property, Flags = &h0
		gdStudentMemberPrice As Double = 30
	#tag EndProperty

	#tag Property, Flags = &h0
		mbAffiliateGov As Boolean = False
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="gdAffiliateMemberPrice"
			Group="Behavior"
			InitialValue="190"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdAssociateMemberPrice"
			Group="Behavior"
			InitialValue="170"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDataBookBoth"
			Group="Behavior"
			InitialValue="50"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDonationEducation"
			Group="Behavior"
			InitialValue="25"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDonationPE"
			Group="Behavior"
			InitialValue="25"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDonationResearch"
			Group="Behavior"
			InitialValue="25"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDonationSteele"
			Group="Behavior"
			InitialValue="25"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdFullMemberPrice"
			Group="Behavior"
			InitialValue="190"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdGovernmental"
			Group="Behavior"
			InitialValue="190"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdSpecialMemberPrice"
			Group="Behavior"
			InitialValue="190"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdStudentMemberPrice"
			Group="Behavior"
			InitialValue="30"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mbAffiliateGov"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
