#tag WebPage
Begin WebDialog dlgUploadFile
   Compatibility   =   ""
   Cursor          =   0
   Enabled         =   True
   Height          =   227
   HelpTag         =   ""
   HorizontalCenter=   0
   Index           =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   MinHeight       =   0
   MinWidth        =   0
   Resizable       =   True
   Style           =   "None"
   TabOrder        =   0
   Title           =   "Financial Uploader"
   Top             =   0
   Type            =   3
   VerticalCenter  =   0
   Visible         =   True
   Width           =   278
   ZIndex          =   1
   _DeclareLineRendered=   False
   _HorizontalPercent=   0.0
   _IsEmbedded     =   False
   _Locked         =   False
   _NeedsRendering =   True
   _OfficialControl=   False
   _OpenEventFired =   False
   _ShownEventFired=   False
   _VerticalPercent=   0.0
   Begin WebFileUploader FileUploader
      AlternateRowColor=   &cEDF3FE00
      Cursor          =   0
      Enabled         =   True
      FileCount       =   0
      Filter          =   ""
      Height          =   134
      HelpTag         =   "Press the plus to add a file for uploading. When finished, press the upload button and the files will be sent to the Board of Directors and to the Director of finance."
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   20
      Limit           =   -1
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MultiSelect     =   False
      PrimaryRowColor =   &cFFFFFF00
      Scope           =   0
      Style           =   "0"
      TabOrder        =   -1
      Top             =   39
      UploadTimeout   =   0
      VerticalCenter  =   0
      Visible         =   True
      Width           =   238
      ZIndex          =   1
      _DeclareLineRendered=   False
      _HorizontalPercent=   0.0
      _IsEmbedded     =   False
      _Locked         =   False
      _NeedsRendering =   True
      _OfficialControl=   False
      _OpenEventFired =   False
      _VerticalPercent=   0.0
   End
   Begin WebButton btnUpload
      AutoDisable     =   False
      Caption         =   "Upload"
      Cursor          =   0
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      Style           =   "0"
      TabOrder        =   0
      Top             =   185
      VerticalCenter  =   0
      Visible         =   True
      Width           =   100
      ZIndex          =   1
      _DeclareLineRendered=   False
      _HorizontalPercent=   0.0
      _IsEmbedded     =   False
      _Locked         =   False
      _NeedsRendering =   True
      _OfficialControl=   False
      _OpenEventFired =   False
      _VerticalPercent=   0.0
   End
   Begin WebButton btnClose
      AutoDisable     =   False
      Caption         =   "Cancel"
      Cursor          =   0
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   158
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      Style           =   "0"
      TabOrder        =   1
      Top             =   185
      VerticalCenter  =   0
      Visible         =   True
      Width           =   100
      ZIndex          =   1
      _DeclareLineRendered=   False
      _HorizontalPercent=   0.0
      _IsEmbedded     =   False
      _Locked         =   False
      _NeedsRendering =   True
      _OfficialControl=   False
      _OpenEventFired =   False
      _VerticalPercent=   0.0
   End
   Begin WebLabel Label1
      Cursor          =   1
      Enabled         =   True
      HasFocusRing    =   True
      Height          =   22
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      Style           =   "0"
      TabOrder        =   2
      Text            =   "Upload Transcript"
      TextAlign       =   2
      Top             =   5
      VerticalCenter  =   0
      Visible         =   True
      Width           =   238
      ZIndex          =   1
      _DeclareLineRendered=   False
      _HorizontalPercent=   0.0
      _IsEmbedded     =   False
      _Locked         =   False
      _NeedsRendering =   True
      _OfficialControl=   False
      _OpenEventFired =   False
      _VerticalPercent=   0.0
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Method, Flags = &h0
		Function NameExtension(f As WebUploadedFile) As String
		  dim ext as string
		  
		  dim parts() as string = f.Name.Split( "." )
		  if parts.Ubound > 0 and parts( 0 ) <> "" then
		    dim lastPart as string = parts.Pop
		    if lastPart.InStr( " " ) = 0 then
		      ext = lastPart
		    end if
		  end if
		  
		  return ext
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveLink()
		  Dim lsStr, lsSql as String
		  Dim lnLen as Integer
		  Dim oSQL as new cSmartSQL
		  
		  oSql.ClearFields  
		  oSQL.ClearValues 
		  
		  oSQL.StatementType = eStatementType.Type_Update
		  
		  frmAppllcation.gbTrascriptUploaded = True
		  frmAppllcation.MemType.btnUploadTrans.Style = Nil 'stlEmpty
		  
		  oSQL.AddTable "memapplications"
		  
		  oSQL.AddFields "Transcript"
		  oSQL.AddValues msLink
		  
		  oSQL.ClearWhereClause
		  oSQL.AddSimpleWhereClause "memappkwy", Session.gnRecNo
		  
		  Session.sesAspeDB.SQLExecute(oSQL.SQL)
		  if Session.sesAspeDB.CheckDBError("DB1054") then
		    Return 
		  end
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		fldUploadedFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		msLink As String
	#tag EndProperty


#tag EndWindowCode

#tag Events FileUploader
	#tag Event
		Sub UploadBegin(FileCount As Integer)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub UploadComplete(Files() As WebUploadedFile)
		  // When the files have been uploaded, this events fires
		  // with the Files() parameter populated with the
		  // user's files.
		  
		  // We will loop through each file and try to parse it as
		  // a picture. If that fails, we skip the item. If it
		  // succeeds, we copy the picture to the uploaded pictures folder.
		  
		  Dim uploadFolder As FolderItem
		  uploadFolder = App.ExecutableFile.Parent.Child("Transcripts")
		  If Not uploadFolder.Exists Then
		    #If DebugBuild Then
		      uploadFolder.CreateAsFolder
		    #Else
		      MsgBox("Upload failed. Upload folder does not exist: " + uploadFolder.NativePath)
		      Return
		    #Endif
		  End If
		  
		  
		  Dim saveTrans As FolderItem
		  Dim lsFileName, lsExt As String
		  Dim lnCnt As Integer = 1
		  Dim ldDate As New Date
		  For Each uFile As WebUploadedFile In files
		    Try
		      lsExt = NameExtension(uFile)
		      
		      lsFileName = frmAppllcation.MemInfo.txtLast.Text.Replace( "/", "-") + frmAppllcation.MemInfo.txtFirst.Text.Replace( "/", "-") + _
		      ldDate.Year.ToText + Right("00" + ldDate.Month.ToText, 2) + Right("00" + ldDate.Day.ToText, 2 )+ _
		      Right("00" + ldDate.Second.ToText ,2) + "-" + lnCnt.ToText + "." + lsExt
		      
		      'Replace(lsFileName, "/", "-")
		      
		      saveTrans = uploadFolder.Child(lsFileName)
		      
		      'RSA!
		      '
		      msLink = "http://aspe.org/xo/MemApplication/Transcripts/" + lsFileName
		      'msLink = "http://aspe.org/xo/MembershipApplicationDemo/Transcripts/" + lsFileName
		      
		      
		      uFile.Save(saveTrans)
		      
		      fldUploadedFiles.Append(saveTrans)
		      
		      lnCnt = lnCnt + 1
		      'saveTrans = msLink.
		      
		    Catch err As IOException
		      MsgBox(" Upload failed: Insufficient permissions to save files to " + uploadFolder.NativePath)
		      Exit For
		    End Try
		    
		  Next
		  
		  MsgBox("Upload Complete")
		  
		  SaveLink
		  
		  Self.Close
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub FileAdded(Filename As String, Bytes as UInt64, MimeType as String)
		  
		  
		  'If Right(Filename, 4) <> ".jpg" And Right(Filename, 4) <> ".png" Then
		  'MsgBox("Please choose only JPG or PNG files.")
		  'Me.RemoveFileAtIndex(Me.FileCount - 1)
		  'End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnUpload
	#tag Event
		Sub Action()
		  FileUploader.Upload()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClose
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HorizontalCenter"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Group="ID"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Minimum Size"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Minimum Size"
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
		Name="Resizable"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabOrder"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Behavior"
		InitialValue="1"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"1 - Sheet"
			"2 - Palette"
			"3 - Modal"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="VerticalCenter"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ZIndex"
		Group="Behavior"
		InitialValue="1"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_DeclareLineRendered"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_HorizontalPercent"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_IsEmbedded"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_Locked"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_NeedsRendering"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_OfficialControl"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_OpenEventFired"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ShownEventFired"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_VerticalPercent"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="msLink"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
