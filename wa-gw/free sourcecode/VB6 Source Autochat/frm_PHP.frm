VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Begin VB.Form frm_PHP 
   Caption         =   "EXEC WEB"
   ClientHeight    =   4620
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   6810
   Icon            =   "frm_PHP.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   4620
   ScaleWidth      =   6810
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   6120
      Top             =   120
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   495
      Left            =   4560
      TabIndex        =   2
      Top             =   120
      Width           =   735
   End
   Begin VB.TextBox txtURL 
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4455
   End
   Begin SHDocVwCtl.WebBrowser ww 
      Height          =   3855
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   6375
      ExtentX         =   11245
      ExtentY         =   6800
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin VB.Label kk 
      Caption         =   "Label1"
      Height          =   495
      Left            =   5400
      TabIndex        =   3
      Top             =   240
      Width           =   495
   End
End
Attribute VB_Name = "frm_php"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Sub Command1_Click()
ww.Navigate2 txtURL.Text
End Sub

Private Sub Form_Load()
ww.Silent = True
End Sub

Private Sub Timer1_Timer()
kk = Val(kk) + 1
If kk > 20 Then Unload Me
End Sub
