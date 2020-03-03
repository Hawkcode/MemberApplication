#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open(args() as String)
		  self.Security.FrameEmbedding = WebAppSecurityOptions.FrameOptions.Allow
		  
		  if not registerMBSPlugin("Richard Albrecht", "MBS Complete", 202011, "KR0R3JxLXSQGzARierrGgBYGcSTaCvfWR1kIPsZNOxEnk3gBXfEbp4zIkz1xMIo=") then
		    MsgBox "MBS Plugin serial not valid?"
		  end if
		  
		  
		  
		  
		  'App.AutoQuit = True
		  'App.Timeout = 1
		  'App.SessionTimeout = 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(Error As RuntimeException) As Boolean
		  dim ls as String
		  
		  ls = "Runtime Exception: " + "Err 08261235: Email = " +  Error.Type + EndOfLine + _
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
		gdAssociateMemberPrice As Double = 190
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
			Name="gdAffiliateCoupon"
			Visible=false
			Group="Behavior"
			InitialValue="-90"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdAffiliateMemberPrice"
			Visible=false
			Group="Behavior"
			InitialValue="190"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdAssociateCoupon"
			Visible=false
			Group="Behavior"
			InitialValue="-70"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdAssociateMemberPrice"
			Visible=false
			Group="Behavior"
			InitialValue="170"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDataBookBoth"
			Visible=false
			Group="Behavior"
			InitialValue="50"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDonationEducation"
			Visible=false
			Group="Behavior"
			InitialValue="25"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDonationPE"
			Visible=false
			Group="Behavior"
			InitialValue="25"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDonationResearch"
			Visible=false
			Group="Behavior"
			InitialValue="25"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdDonationSteele"
			Visible=false
			Group="Behavior"
			InitialValue="25"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdFullCoupon"
			Visible=false
			Group="Behavior"
			InitialValue="-90"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdFullMemberPrice"
			Visible=false
			Group="Behavior"
			InitialValue="190"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdGovernCoupon"
			Visible=false
			Group="Behavior"
			InitialValue="-90"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdGovernmental"
			Visible=false
			Group="Behavior"
			InitialValue="190"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdSpecialCoupon"
			Visible=false
			Group="Behavior"
			InitialValue="-90"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdSpecialMemberPrice"
			Visible=false
			Group="Behavior"
			InitialValue="190"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gdStudentMemberPrice"
			Visible=false
			Group="Behavior"
			InitialValue="30"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mbAffiliateGov"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
