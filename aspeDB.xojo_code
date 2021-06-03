#tag Class
Protected Class aspeDB
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
		Function OpenASPEDB() As Boolean
		  'lsServer as String, lsUser as String, lsDataBaseName as String,  lsPassword as String, lnPort as Int16
		  
		  
		  
		  
		  self.DatabaseName = gsDatabaseName   ' "aspesql3" 'lsDataBaseName
		  self.Password = gsPassword     '"7Ut6ctxL"  'lsPassword
		  self.UserName =  gsUserName  '"aspesql3"   'lsUser
		  self.Port = gnDBPort     ' 3306   'lnPort
		  self.Host = gsHost    '"aspe.org"  'lsServer
		  
		  
		  if self.Connect = false then
		    'self = nil
		    MsgBox(self.ErrorMessage)
		    return false
		  end
		  
		  self.SQLExecute("Set NameS 'utf8'")
		  
		  'gsConnectionStr = "mysql://host='" + gsHost + "', port=3306, user='" + gsUserName + "', password='" + gsPassword + "', dbname='" + gsDatabaseName + "', timeout=5"
		  'gsWConnectionStr = "mysql://host='" + gsHost + "', port=3306, user='" + gsUserName + "', password='" + gsPassword + "', dbname='" + gsDatabaseName + "', timeout=5"
		  
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
		gnDBPort As Integer = 3306
	#tag EndProperty

	#tag Property, Flags = &h0
		gsConnectionStr As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gsDatabaseName As String = "trakdata"
	#tag EndProperty

	#tag Property, Flags = &h0
		gsHost As String = "127.0.0.1"
	#tag EndProperty

	#tag Property, Flags = &h0
		gsPassword As String = "fr3eCave97"
	#tag EndProperty

	#tag Property, Flags = &h0
		gsUserName As String = "aspe_user"
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
			Name="gnDBPort"
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
			Name="gsDatabaseName"
			Visible=false
			Group="Behavior"
			InitialValue="trakdata"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gsHost"
			Visible=false
			Group="Behavior"
			InitialValue="25.204.113.227"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gsPassword"
			Visible=false
			Group="Behavior"
			InitialValue="AsPe8614"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gsUserName"
			Visible=false
			Group="Behavior"
			InitialValue="aspe"
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
