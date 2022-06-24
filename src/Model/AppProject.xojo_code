#tag Class
Protected Class AppProject
	#tag Method, Flags = &h0
		Sub Constructor(name As String, path As String)
		  Self.Name = name
		  Self.ProjectPath = New FolderItem(path, FolderItem.PathModes.Native)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromDictionary(value As Dictionary) As AppProject
		  Var name As String = value.Lookup("name", "")
		  Var path As String = value.Lookup("project_path", "")
		  Var result As New AppProject(name, path)
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToDictionary() As Dictionary
		  Var result As New Dictionary
		  
		  result.Value("name") = Name
		  result.Value("project_path") = ProjectPath.NativePath
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectPath As FolderItem
	#tag EndProperty


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
	#tag EndViewBehavior
End Class
#tag EndClass
