VERSION 5.00
Begin VB.UserControl WizardBar 
   Alignable       =   -1  'True
   BackColor       =   &H80000005&
   ClientHeight    =   2355
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   157
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   320
   Begin IMA2_HelperX.Bevel Bevel2 
      Align           =   2  'Align Bottom
      Height          =   45
      Left            =   0
      TabIndex        =   0
      Top             =   2310
      Width           =   4800
      _ExtentX        =   8467
      _ExtentY        =   79
   End
   Begin VB.Image img 
      Height          =   480
      Left            =   4080
      Picture         =   "WizardBar.ctx":0000
      Top             =   120
      Width           =   480
   End
   Begin VB.Label lblDescription 
      BackStyle       =   0  'Transparent
      Caption         =   "Description"
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   360
      Width           =   4575
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblCaption 
      BackStyle       =   0  'Transparent
      Caption         =   "Caption"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4815
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "WizardBar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Property Get Caption() As String
    Caption = lblCaption.Caption
End Property

Public Property Let Caption(NV As String)
    lblCaption.Caption = NV
    If NV = "" Then
        lblDescription.Move lblCaption.Left, lblCaption.Top
    Else
        lblDescription.Move lblCaption.Left + 16, lblCaption.Top + 16
    End If
    UserControl_Resize
End Property

Public Property Get Description() As String
    Description = lblDescription.Caption
End Property

Public Property Let Description(NV As String)
    lblDescription.Caption = NV
End Property

Public Property Get Picture() As StdPicture
    Set Picture = img.Picture
End Property

Public Property Set Picture(NV As StdPicture)
    Set img.Picture = NV
End Property
    
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    lblCaption.Caption = PropBag.ReadProperty("C", "Caption")
    lblDescription.Caption = PropBag.ReadProperty("D", "Description")
    Set Picture = PropBag.ReadProperty("Picture", Nothing)
End Sub

Private Sub UserControl_Resize()

    On Error Resume Next
    img.Left = UserControl.ScaleWidth - img.Width - 10
    'img.Top = Fix((UserControl.ScaleHeight - img.Width) / 2) - 1
    lblDescription.Width = img.Left - (lblDescription.Left * 2)
    lblDescription.Height = UserControl.ScaleHeight - lblDescription.Top - 3

    lblCaption.Width = img.Left - (lblCaption.Left * 2)

End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("C", lblCaption.Caption, "Caption")
    Call PropBag.WriteProperty("D", lblDescription.Caption, "Description")
    PropBag.WriteProperty "Picture", Picture, Nothing
End Sub

