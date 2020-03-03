#tag Class
Protected Class CountryCodePopup
Inherits WebPopupMenu
	#tag Event
		Sub Open()
		  dim codes() as String=CountryCodes.Split(chr(13))
		  for i as integer=0 to codes.Ubound
		    dim c() As String=codes(i).Split(chr(9))
		    me.AddRow(c(0))
		    me.RowTag(i)=c(1)
		  next
		  
		  'me.ListIndex=231
		  
		  me.SetPopMenuValue("United States")
		End Sub
	#tag EndEvent


	#tag Constant, Name = CountryCodes, Type = String, Dynamic = False, Default = \"Afghanistan\tAF\rAlbania\tAL\rAlgeria\tDZ\rAmerican Samoa\tAS\rAndorra\tAD\rAngola\tAO\rAnguilla\tAI\rAntigua and Barbuda\tAG\rArgentina\tAR\rArmenia\tAM\rAruba\tAW\rAustralia\tAU\rAustria\tAT\rAzerbaijan\tAZ\rAzores\tA2\rBahamas\tBS\rBahrain\tBH\rBangladesh\tBD\rBarbados\tBB\rBelarus\tBY\rBelgium\tBE\rBelize\tBZ\rBenin\tBJ\rBermuda\tBM\rBhutan\tBT\rBolivia\tBO\rBonaire\x2C St. Eustatius\x2C Saba\tBQ\rBosnia\tBA\rBotswana\tBW\rBrazil\tBR\rBritish Virgin Islands\tVG\rBrunei\tBN\rBulgaria\tBG\rBurkina Faso\tBF\rBurundi\tBI\rCambodia\tKH\rCameroon\tCM\rCanada\tCA\rCanary Islands\tIC\rCape Verde Island\tCV\rCayman Islands\tKY\rCentral African Republic\tCF\rChad\tTD\rChile\tCL\rChina\x2C People\xE2\x80\x99s Republic of\tCN\rColombia\tCO\rComoros\tKM\rCongo\tCG\rCongo\x2C The Democratic Republic of\tCD\rCook Islands\tCK\rCosta Rica\tCR\rCroatia\tHR\rCuracao\tCW\rCyprus\tCY\rCzech Republic\tCZ\rDenmark\tDK\rDjibouti\tDJ\rDominica\tDM\rDominican Republic\tDO\rEast Timor\tTL\rEcuador\tEC\rEgypt\tEG\rEl Salvador\tSV\rEngland\tEN\rEquatorial Guinea\tGQ\rEritrea\tER\rEstonia\tEE\rEthiopia\tET\rEurope\tEP\rFaeroe Islands\tFO\rFiji\tFJ\rFinland\tFI\rFrance\tFR\rFrench Guiana\tGF\rFrench Polynesia\tPF\rGabon\tGA\rGambia\tGM\rGeorgia\tGE\rGermany\tDE\rGhana\tGH\rGibraltar\tGI\rGreece\tGR\rGreenland\tGL\rGrenada\tGD\rGuadeloupe\tGP\rGuam\tGU\rGuatemala\tGT\rGuernsey\tGG\rGuinea\tGN\rGuinea-Bissau\tGW\rGuyana\tGY\rHaiti\tHT\rHolland\tHO\rHonduras\tHN\rHong Kong\tHK\rHungary\tHU\rIceland\tIS\rIndia\tIN\rIndonesia\tID\rIraq\tIQ\rIreland\x2C Republic of\tIE\rIsrael\tIL\rItaly\tIT\rIvory Coast\tCI\rJamaica\tJM\rJapan\tJP\rJersey\tJE\rJordan\tJO\rKazakhstan\tKZ\rKenya\tKE\rKiribati\tKI\rKorea\x2C South\tKR\rKosrae\tKO\rKuwait\tKW\rKyrgyzstan\tKG\rLaos\tLA\rLatvia\tLV\rLebanon\tLB\rLesotho\tLS\rLiberia\tLR\rLibya\tLY\rLiechtenstein\tLI\rLithuania\tLT\rLuxembourg\tLU\rMacau\tMO\rMacedonia (FYROM)\tMK\rMadagascar\tMG\rMadeira\tM3\rMalawi\tMW\rMalaysia\tMY\rMaldives\tMV\rMali\tML\rMalta\tMT\rMarshall Islands\tMH\rMartinique\tMQ\rMauritania\tMR\rMauritius\tMU\rMayotte\tYT\rMexico\tMX\rMicronesia\x2C Federated States of\tFM\rMoldova\tMD\rMonaco\tMC\rMongolia\tMN\rMontenegro\tME\rMontserrat\tMS\rMorocco\tMA\rMozambique\tMZ\rNamibia\tNA\rNepal\tNP\rNetherlands\tNL\rNew Caledonia\tNC\rNew Zealand\tNZ\rNicaragua\tNI\rNiger\tNE\rNigeria\tNG\rNorfolk Island\tNF\rNorthern Ireland\tNB\rNorthern Mariana Islands\tMP\rNorway\tNO\rOman\tOM\rPakistan\tPK\rPalau\tPW\rPanama\tPA\rPapua New Guinea\tPG\rParaguay\tPY\rPeru\tPE\rPhilippines\tPH\rPoland\tPL\rPonape\tPO\rPortugal\tPT\rPuerto Rico\tPR\rQatar\tQA\rReunion\tRE\rRomania\tRO\rRota\tRT\rRussia\tRU\rRwanda\tRW\rSaba\tS1\rSaipan\tSP\rSamoa\tWS\rSan Marino\tSM\rSao Tome and Principe\tST\rSaudi Arabia\tSA\rScotland\tSF\rSenegal\tSN\rSerbia\tRS\rSeychelles\tSC\rSierra Leone\tSL\rSingapore\tSG\rSlovakia\tSK\rSlovenia\tSI\rSolomon Islands\tSB\rSouth Africa\tZA\rSpain\tES\rSri Lanka\tLK\rSt. Barthelemy\tBL\rSt. Christopher\tSW\rSt. Croix\tC3\rSt. Eustatius\tE2\rSt. John\tUV\rSt. Kitts and Nevis\tKN\rSt. Lucia\tLC\rSt. Maarten and St. Martin\tSX\rSt. Thomas\tVL\rSt. Vincent and the Grenadines\tVC\rSuriname\tSR\rSwaziland\tSZ\rSweden\tSE\rSwitzerland\tCH\rTahiti\tTA\rTaiwan\tTW\rTajikistan\tTJ\rTanzania\tTZ\rThailand\tTH\rTinian\tTI\rTogo\tTG\rTonga\tTO\rTortola\tZZ\rTrinidad and Tobago\tTT\rTruk\tTU\rTunisia\tTN\rTurkey\tTR\rTurkmenistan\tTM\rTurks and Caicos Islands\tTC\rTuvalu\tTV\rU.S. Virgin Islands\tVI\rUganda\tUG\rUkraine\tUA\rUnion Island\tUI\rUnited Arab Emirates\tAE\rUnited Kingdom\tGB\rUnited States\tUS\rUruguay\tUY\rUzbekistan\tUZ\rVanuatu\tVU\rVatican City State\tVA\rVenezuela\tVE\rVietnam\tVN\rVirgin Gorda\tVR\rWales\tWL\rWallis and Futuna Islands\tWF\rYap\tYA\rYemen\tYE\rZambia\tZM\rZimbabwe\tZW", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ListCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Cursor"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Automatic"
				"1 - Standard Pointer"
				"2 - Finger Pointer"
				"3 - IBeam"
				"4 - Wait"
				"5 - Help"
				"6 - Arrow All Directions"
				"7 - Arrow North"
				"8 - Arrow South"
				"9 - Arrow East"
				"10 - Arrow West"
				"11 - Arrow Northeast"
				"12 - Arrow Northwest"
				"13 - Arrow Southeast"
				"14 - Arrow Southwest"
				"15 - Splitter East West"
				"16 - Splitter North South"
				"17 - Progress"
				"18 - No Drop"
				"19 - Not Allowed"
				"20 - Vertical IBeam"
				"21 - Crosshair"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontalCenter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabOrder"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalCenter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZIndex"
			Visible=false
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_DeclareLineRendered"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_HorizontalPercent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_IsEmbedded"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Locked"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_NeedsRendering"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OfficialControl"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OpenEventFired"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_VerticalPercent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="80"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="20"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListIndex"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
