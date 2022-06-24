#tag Class
Protected Class AppSettings
	#tag Method, Flags = &h0
		Shared Function FromDictionary(value As Dictionary) As AppSettings
		  Var result As New AppSettings
		  
		  Var empty() As Dictionary
		  Var projects() As Auto = value.Lookup("known_projects", empty)
		  
		  For Each project As Dictionary In projects
		    result.KnownProjects.Add(AppProject.FromDictionary(project))
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveProject(project As AppProject)
		  For i As Integer = KnownProjects.LastIndex DownTo 0
		    Var knownProject As AppProject = KnownProjects(i)
		    Var isSameName As Boolean = project.Name = knownProject.Name
		    Var isSamePath As Boolean = project.ProjectPath.NativePath = knownProject.ProjectPath.NativePath
		    If isSameName And isSamePath Then
		      knownProjects.RemoveAt(i)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToDictionary() As Dictionary
		  Var result As New Dictionary
		  
		  If KnownProjects.Count > 0 Then
		    Var projects() As Dictionary
		    For Each project As AppProject In KnownProjects
		      projects.Add(project.ToDictionary)
		    Next
		    result.Value("known_projects") = projects
		  End If
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		KnownProjects() As AppProject
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
		#tag ViewProperty
			Name="KnownProjects()"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
