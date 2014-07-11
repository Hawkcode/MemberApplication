#tag Class
Protected Class App
Inherits WebApplication
	#tag Property, Flags = &h0
		gdAffiliateMemberPrice As Double = 190
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
		gdDonationResearch As Double = 25
	#tag EndProperty

	#tag Property, Flags = &h0
		gdDonationSteele As Double = 25
	#tag EndProperty

	#tag Property, Flags = &h0
		gdFullMemberPrice As Double = 190
	#tag EndProperty

	#tag Property, Flags = &h0
		gdGovernmental As Double = 190
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
