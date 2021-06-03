#tag Class
Protected Class WebDB
Inherits MySQLCommunityServer
	#tag Method, Flags = &h0
		Function CheckDBError(lsPrompt as String = "") As Boolean
		  if self.Error then
		    Msgbox("Database Error: " + str(Me.ErrorCode) + EndOfLine + EndOfLine + Me.ErrorMessage + EndOfLine + EndOfLine +lsPrompt + "');")
		    Return True
		  else
		    Return False
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseDB()
		  if Self <> nil then
		    Self.close
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastID(lsTable as String) As Integer
		  Return Self.SQLSelect("select LAST_INSERT_ID() from `" + lsTable + "`" ).IdxField(1).IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenDB() As Boolean
		  'lsServer as String, lsUser as String, lsDataBaseName as String,  lsPassword as String, lnPort as Int16
		  
		  
		  
		  self.DatabaseName = gsDatabaseNameWS   ' "aspesql3" 'lsDataBaseName
		  self.Password = gsPasswordWS     '"7Ut6ctxL"  'lsPassword
		  self.UserName =  gsUserNameWS  '"aspesql3"   'lsUser
		  self.Port = gnDBPortWS     ' 3306   'lnPort
		  self.Host = gsHostWS    '"aspe.org"  'lsServer
		  
		  
		  if self.Connect = false then
		    'self = nil
		    MsgBox(self.ErrorMessage)
		    return false
		  end
		  
		  self.SQLExecute("Set NameS 'utf8'")
		  
		  
		  'gsConnectionStr = "mysql://host='" + gsHost + "', port=3306, user='" + gsUserName + "', password='" + gsPassword + "', dbname='" + gsDatabaseName + "', timeout=5"
		  gsWConnectionStr = "mysql://host='" + gsHostWS + "', port=3306, user='" + gsUserNameWS + "', password='" + gsPasswordWS + "', dbname='" + gsDatabaseNameWS + "', timeout=5"
		  
		  return true
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		dbWeb As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		gnDBConnectError As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		gnDBPortWS As Integer = 3306
	#tag EndProperty

	#tag Property, Flags = &h0
		gsConnectionStr As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gsDatabaseNameWS As String = "d7upgradedb"
	#tag EndProperty

	#tag Property, Flags = &h0
		gsHostWS As String = "127.0.0.1"
	#tag EndProperty

	#tag Property, Flags = &h0
		gsPasswordWS As String = "fr3eCave97"
	#tag EndProperty

	#tag Property, Flags = &h0
		gsUserNameWS As String = "user_d7upgradedb"
	#tag EndProperty

	#tag Property, Flags = &h0
		gsWConnectionStr As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="IsSSLConnection"
			Visible=true
			Group=""
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLAuthorityFolder"
			Visible=true
			Group=""
			InitialValue=""
			Type="FolderItem"
			EditorType="FolderItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="dbWeb"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gnDBConnectError"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gnDBPortWS"
			Visible=false
			Group="Behavior"
			InitialValue="3306"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gsConnectionStr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gsDatabaseNameWS"
			Visible=false
			Group="Behavior"
			InitialValue="d7upgradedb"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gsHostWS"
			Visible=false
			Group="Behavior"
			InitialValue="127.0.0.1"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gsPasswordWS"
			Visible=false
			Group="Behavior"
			InitialValue="2fEzdTCdi"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gsUserNameWS"
			Visible=false
			Group="Behavior"
			InitialValue="d7upgradedb"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gsWConnectionStr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="Port"
			Visible=true
			Group=""
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SecureAuth"
			Visible=true
			Group=""
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLAuthority"
			Visible=true
			Group=""
			InitialValue=""
			Type="FolderItem"
			EditorType="FolderItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLAuthorityDirectory"
			Visible=true
			Group=""
			InitialValue=""
			Type="FolderItem"
			EditorType="FolderItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLCertificate"
			Visible=true
			Group=""
			InitialValue=""
			Type="FolderItem"
			EditorType="FolderItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLCipher"
			Visible=true
			Group=""
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLKey"
			Visible=true
			Group=""
			InitialValue=""
			Type="FolderItem"
			EditorType="FolderItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLMode"
			Visible=true
			Group=""
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
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
			Name="TimeOut"
			Visible=true
			Group=""
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
