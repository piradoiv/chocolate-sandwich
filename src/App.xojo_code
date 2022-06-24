#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Closing()
		  If mSettingsFile.Exists Then mSettingsFile.Remove
		  
		  Var settingsDictionary As Dictionary = Settings.ToDictionary
		  Var json As String = GenerateJSON(settingsDictionary, True)
		  Var writer As TextOutputStream = TextOutputStream.Open(mSettingsFile)
		  writer.Write(json)
		  writer.Close
		End Sub
	#tag EndEvent

	#tag Event
		Sub DocumentCreated()
		  If Not mCreatingNewProject Then Return
		  mCreatingNewProject = False
		  Var w As New ProjectWindow
		  w.Changed = True
		  w.Show
		End Sub
	#tag EndEvent

	#tag Event
		Sub DocumentOpened(item As FolderItem)
		  Var w As New ProjectWindow
		  w.Show
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  AllowAutoQuit = True
		  
		  Var appFolder As FolderItem = SpecialFolder.ApplicationData.Child("es.rcruz.chocolatesandwich")
		  If Not appFolder.Exists Then appFolder.CreateFolder
		  mSettingsFile = appFolder.Child("settings.json")
		  
		  #Pragma BreakOnExceptions False
		  Try
		    Var reader As TextInputStream = TextInputStream.Open(mSettingsFile)
		    Var json As Dictionary = ParseJSON(reader.ReadAll)
		    reader.Close
		    Settings = AppSettings.FromDictionary(json)
		  Catch e As RuntimeException
		    Settings = New AppSettings
		  End Try
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ActionOpenProject()
		  Var d As OpenFileDialog = New OpenFileDialog
		  Var result As FolderItem = d.ShowModal
		  If result = Nil Or Not result.Exists Then Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewDocument()
		  // Calling the overridden superclass method.
		  mCreatingNewProject = True
		  Super.NewDocument()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowProjectListIfNeeded()
		  If WindowCount = 0 Then
		    ProjectListWindow.Show
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCreatingNewProject As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSettingsFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Settings As AppSettings
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Settings"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
