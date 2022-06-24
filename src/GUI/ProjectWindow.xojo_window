#tag DesktopWindow
Begin DesktopWindow ProjectWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   True
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   600
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1488895999
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   0
   Visible         =   True
   Width           =   800
   Begin ProjectWindowToolbar ProjectToolbar
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Visible         =   True
   End
   Begin DesktopListBox StructureListBox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   602
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -1
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   251
      _ScrollWidth    =   -1
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Function CancelClosing(appQuitting As Boolean) As Boolean
		  If Not Changed Then Return False
		  
		  Var confirm As New MessageDialog
		  confirm.CancelButton.Visible = True
		  confirm.Message = "You have unsaved changes"
		  confirm.Explanation = "Are you really sure to discard your changes?"
		  Var result As MessageDialogButton = confirm.ShowModal
		  
		  Return result.IsCancel
		End Function
	#tag EndEvent

	#tag Event
		Sub Closing()
		  App.ShowProjectListIfNeeded
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Self.Close
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNewProjectItem(index as Integer) As Boolean Handles FileNewProjectItem.Action
			App.NewDocument
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpenItem() As Boolean Handles FileOpenItem.Action
			App.ActionOpenProject
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSave() As Boolean Handles FileSave.Action
			Changed = False
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveAs() As Boolean Handles FileSaveAs.Action
			Changed = False
			Return True
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events ProjectToolbar
	#tag Event
		Sub Pressed(item As DesktopToolbarItem)
		  Select Case item.Name
		  Case ProjectToolbar.AddPageToolItem.Name
		    System.DebugLog(ProjectToolbar.AddPageToolItem.Name)
		  Case ProjectToolbar.AddDirectoryToolItem.Name
		    System.DebugLog(ProjectToolbar.AddDirectoryToolItem.Name)
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
