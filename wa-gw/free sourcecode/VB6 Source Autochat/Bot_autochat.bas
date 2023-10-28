Attribute VB_Name = "bot"
'---------------------------------------------------------------------------
' MODUL BOT -- INI GAK PAKE FORM YA..
' INI SEBETULNYA HANYA MODIFIKASI SEDIKIT DARI BOT1 (sebelumnya)
' SEMUA IF IF DIHILANGKAN.. HANYA PAKE DARI TABEL autochat SAJA
'---------------------------------------------------------------------------
' Yang masih bingung.. ini gimana ???? wa.me/6285692961782


'API Function to read information from INI File
Public Declare Function GetPrivateProfileString Lib "kernel32" _
    Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, _
    ByVal lpKeyName As Any, _
    ByVal lpDefault As String, _
    ByVal lpReturnedString As String, _
    ByVal nSize As Long, _
    ByVal lpFileName As String) As Long

'API Function to write information to the INI File
Private Declare Function WritePrivateProfileString Lib "kernel32" _
    Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, _
    ByVal lpKeyName As Any, _
    ByVal lpString As Any, _
    ByVal lpFileName As String) As Long

Public koneksi As New ADODB.Connection
Public rs As New Recordset
Dim Nomor, Pesan, Jawab, Profil, PrevID, BackID As String
Dim DSN, DBUser, DBPass, DirectMySQL_WithoutDSN, MySQL_Server, MySQL_DB, Port As String
Dim exec_php, wa_file, wa_media, ISEND, ISBACK, SKIP, run_exe, respon, neednext, EXCLUDE As String

'Get the INI Setting from the File
Public Function GetINISetting(ByVal sHeading As String, _
    ByVal sKey As String, _
    sINIFileName) As String
    
    Const cparmLen = 50
    Dim sReturn As String * cparmLen
    Dim sDefault As String * cparmLen
    Dim lLength As Long
    lLength = GetPrivateProfileString(sHeading, _
            sKey, _
            sDefault, _
            sReturn, _
            cparmLen, _
            sINIFileName)
            
    GetINISetting = Mid(sReturn, 1, lLength)
End Function

'Save INI Setting in the File
Public Function PutINISetting(ByVal sHeading As String, _
    ByVal sKey As String, _
    ByVal sSetting As String, _
    sINIFileName) As Boolean
    
    Const cparmLen = 50
    Dim sReturn As String * cparmLen
    Dim sDefault As String * cparmLen
    Dim aLength As Long
    aLength = WritePrivateProfileString(sHeading, _
        sKey, _
        sSetting, _
        sINIFileName)
        
    PutINISetting = True
End Function

Public Sub Konek()
    Dim askConn As Integer
    On Error GoTo errHandler
    
    mysql = "" _
                & "DRIVER={MYSQL ODBC 5.1 Driver};" _
                & "SERVER=" & MySQL_Server & ";" _
                & "DATABASE=" & MySQL_DB & ";" _
                & "UID=" & DBUser & ";" _
                & "PWD=" & DBPass & ";PORT=" & Port & ";" _
                & "OPTION=3"
                
    If DirectMySQL_WithoutDSN = "Y" Then
        koneksi.Open mysql
    Else
        koneksi.Open DSN, DBUser, DBPass
    End If
    
    koneksi.CursorLocation = adUseClient
    
    
    Exit Sub
errHandler:
    askConn = MsgBox("Connection cannot be made, " & vbCrLf & Err.Description & vbCrLf & _
                     "Please recheck the parameters of the server name, User ID and password entered." & vbCrLf & _
                     "Are you going to reconnect ?", vbCritical + vbYesNo, "Connection Error")
    If askConn = vbYes Then Main Else End
End Sub


Public Sub Use(sql As String)
    Dim Pesan As String
    On Error GoTo er
        Set rs = Nothing
        rs.Open sql, koneksi, adOpenDynamic, adLockOptimistic
    Exit Sub
    
er:
    MsgBox Err.Description
    Resume Next
End Sub


Sub Main()
On Error Resume Next
    'Baca File Ini
    DSN = "DSN=" & GetINISetting("DB", "dsn", App.Path & "\wagw.ini")
    DBUser = GetINISetting("DB", "user", App.Path & "\wagw.ini")
    DBPass = GetINISetting("DB", "password", App.Path & "\wagw.ini")
    DirectMySQL_WithoutDSN = GetINISetting("DB", "MySQL_WithoutDSN", App.Path & "\wagw.ini")
    MySQL_Server = GetINISetting("DB", "MySQL_Server", App.Path & "\wagw.ini")
    MySQL_DB = GetINISetting("DB", "MySQL_DB", App.Path & "\wagw.ini")
    Port = GetINISetting("DB", "Port", App.Path & "\wagw.ini")
    
    Konek
    Bot
 End Sub
 
 
 Sub Bot()
 '--[ BOT MULAI DI SINI ]----------------------------------------------------------------
    cmd = Command
    'cmd = "1234~~halo~~1"
    'CMD = "6285692961782~~0~~0"
    'cmd = "+62 856-9296-17829~~1~~0"
    'MsgBox cmd
 
    If cmd = "" Then End
    
    pecah = Split(cmd, "~~")
    Nomor = pecah(0)
    Pesan = UCase(pecah(1))
    If UBound(pecah) = 2 Then Profil = pecah(2)
    SKIP = "N"

 '---  EXIT JIKA ADA DI LIST EXCLUDE
    Use "select count(1) cnt from autochat_exclude where profil = '" & Profil & "' and wa_no = '" & Nomor & "'"
    If Not rs.EOF Then
       EXCLUDE = rs.Fields(0)
      ' MsgBox EXCLUDE
       If EXCLUDE = 1 Then
            rs.Close
            End
       End If
    End If
    rs.Close
    
 '---  SELECT DARI TABEL autochat_user
    exec_php = ""
    PrevID = "-1"
    respon = "N"
    vNOW = Format(Now(), "yyyy-mm-dd hh:mm:ss")
    Use "select previd, backid from autochat_user where profil = '" & Profil & "' and wa_no = '" & Nomor & "' and exp_time > '" & vNOW & "'"
    If Not rs.EOF Then
       PrevID = rs.Fields(0)
       BackID = rs.Fields(1)
    End If
     
    rs.Close
    If IsNull(PrevID) Then PrevID = "-1"
    If IsNull(BackID) Then BackID = PrevID
    
 '--- CEK DEFAULT BACK & END
    ISBACK = ""
    Use "select * from autochat where profil = '" & Profil & "' and  tipe = 3"
    If Not rs.EOF Then
        ISBACK = rs.Fields!keyword
    End If
    rs.Close
    
    ISEND = ""
    Use "select * from autochat where profil = '" & Profil & "' and  tipe = 4"
    If Not rs.EOF Then
        ISEND = rs.Fields!keyword
    End If
    rs.Close
   
    If Pesan = ISEND Then
        koneksi.Execute "delete from autochat_user where profil = " & Profil & " and  wa_no = '" & Nomor & "'"
        End
    End If
    
    If Pesan = ISBACK Then
        SKIP = "Y"
        Jawab = "?"
         Use "select * from autochat where  rowid = '" & BackID & "' "
        ' MsgBox "select * from autochat where  rowid = '" & BackID & "' "
         If Not rs.EOF Then
             Jawab = rs.Fields!answer
             id = rs!rowid
             wa_media = rs!wa_media
             wa_file = rs!wa_file
             exec_php = rs!exec_php
             BackID = rs!PrevID
         End If
         rs.Close
         If IsNull(Jawab) Then Jawab = "?"
    End If
    'MsgBox BackID
  
   If SKIP = "N" Then
        '--- cari pake Logic "="
         Jawab = "?"
          Use "select * from autochat where profil = '" & Profil & "' and  previd = '" & PrevID & "' and logic <> '%'  and UPPER(keyword) = '" & Pesan & "'"
          If Not rs.EOF Then
              Jawab = rs.Fields!answer
              id = rs!rowid
              wa_media = rs!wa_media
              wa_file = rs!wa_file
              BackID = rs!PrevID
              exec_php = "" & rs!exec_php
              run_exe = "" & rs!run_exe
              respon = "" & rs!respon
              neednext = "" & rs!neednext
          End If
          rs.Close
          If IsNull(Jawab) Then Jawab = "?"
          If IsNull(neednext) Then neednext = "0"
          
        '--- cari pake Logic "LIKE"
          If Jawab = "?" Then
            'MsgBox "select * from autochat where profil = '" & Profil & "' and  previd = '" & PrevID & "' and logic = '%' and UPPER(keyword) like '%" & Pesan & "%'"
             Use "select * from autochat where profil = '" & Profil & "' and  previd = '" & PrevID & "' and logic = '%' and  '" & Pesan & "' like concat('%', UPPER(keyword), '%') "
             If Not rs.EOF Then
                 Jawab = rs.Fields!answer
                 id = rs!rowid
                 wa_media = rs!wa_media
                 wa_file = rs!wa_file
                 BackID = rs!PrevID
                 exec_php = "" & rs!exec_php
                 run_exe = "" & rs!run_exe
                 respon = "" & rs!respon
                 neednext = "" & rs!neednext
             End If
             rs.Close
             If IsNull(neednext) Then neednext = "0"
           End If
    End If
  
    If IsNull(Jawab) Then Jawab = "?"
    If IsNull(run_exe) Then run_exe = ""
    If IsNull(respon) Then respon = "N"
    
    If Jawab = "?" Then
        If PrevID = "-1" Then
            Use "select * from autochat where profil = '" & Profil & "' and  tipe = 1"
        Else
            Use "select * from autochat where profil = '" & Profil & "' and  tipe = 2"
        End If
        If Not rs.EOF Then
           Jawab = rs.Fields!answer
           id = 0
        End If
    End If
 
  
  
 '--------- EXEC BOT EXE / PHP
 If run_exe <> "" Then Shell run_exe & " " & Nomor & "~~" & Pesan & "~~" & Profil
 If respon = "0" Then
     If exec_php <> "" Then ExecWeb exec_php & "?wa_no=" & Nomor & "&wa_text=" & Pesan & "&profil=" & Profil & "&xxx=" & Rnd()
 Else
     If exec_php <> "" Then Jawab = ExecWeb2(exec_php & "?wa_no=" & Nomor & "&wa_text=" & Pesan & "&profil=" & Profil & "&xxx=" & Rnd())
 End If
 
 
 
 '--- Lalu Kirim hasilnya ke Outbox / Multi
 If Not (Jawab = "" Or Jawab = "?" Or IsNull(Jawab)) Then
     If Profil = "" Then
        Use "select * from outbox where wa_no='???' "
        rs.AddNew
        rs!wa_mode = 0
        rs!wa_no = Nomor
        rs!wa_text = Jawab
        rs!wa_media = wa_media
        rs!wa_file = wa_file
        rs.Update
        rs.Close
    Else
        Use "select * from multi where wa_no='???' "
        rs.AddNew
        rs!Profil = Profil
        rs!Tipe = "O"
        rs!wa_mode = 0
        rs!wa_no = Nomor
        rs!wa_text = Jawab
        rs!wa_media = wa_media
        rs!wa_file = wa_file
        rs.Update
        rs.Close
    End If
 End If
 
If BackID = "" Or IsNull(BackID) Then BackID = 0
If PrevID < 0 Then PrevID = 0
id0 = id
If Val(neednext) = 0 Or neednext = "" Then id = 0
 
Jawab = Replace(Jawab, "'", "`")

koneksi.Execute "delete from autochat_user where profil = " & Profil & " and  wa_no = '" & Nomor & "'"
If Pesan = ISBACK Then
    koneksi.Execute "insert autochat_user (wa_no, previd, backid, profil, exp_time, lastreply ) values ('" & Nomor & "', " & id0 & ", " & BackID & ", " & Profil & ", DATE_ADD(NOW(), INTERVAL 10 MINUTE), '" & Jawab & "'  )"
Else
    koneksi.Execute "insert autochat_user (wa_no, previd, backid, profil, exp_time, lastreply ) values ('" & Nomor & "', " & id & ", " & BackID & ", " & Profil & ", DATE_ADD(NOW(), INTERVAL 10 MINUTE), '" & Jawab & "'  )"
End If
'MsgBox Jawab
End
End Sub


Function ExecWeb(url As String)
Dim frm As New frm_php
'frm.Show
frm.txtURL.Text = url
frm.Command1_Click
End Function

Function ExecWeb2(url As String)
Set HTML = CreateObject("Microsoft.XMLHTTP")
    With HTML
        .Open "GET", url, False
        .Send
        ExecWeb2 = .responseText
    End With
    Set HTML = Nothing
End Function



