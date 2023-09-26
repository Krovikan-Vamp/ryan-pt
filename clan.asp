<!-- #include file ="config/header.asp" -->
<!-- #include file ="functions/database.asp" -->
<!-- #include file ="functions/injections.asp" -->
<!-- #include file ="functions/clan.asp" -->

<font face="Verdana"><font size=2>
<% 'Written by Sandurr
Response.Expires = -1

DBSettings()

Dim iSnake
iSnake = 0

Dim userid, passwd, chname
userid = Request.Form("userid")
passwd = Request.Form("passwd")
chname = Request.Form("chname")

Dim Note, Icon, nNote
Note = Request.Form("Note")
Icon = Request.Form("Icon")
nNote = Request.Form("nNote")

If Note <> "" Then
	iSnake = 3
ElseIf Icon <> "" Then
	iSnake = 4
End If

%><div class='box'><p><center><%

Function ReturnMsg(strMessage)
	Response.Write(strMessage & "</p></center></div>")
End Function

Dim InjectionsArray(3)
InjectionsArray(1) = userid
InjectionsArray(2) = passwd
InjectionsArray(3) = chname

Dim ClanName, ClanLeader, ClanSubChief, ClanMembers, ClanIMG, ClanNote

If userid<>"" Or passwd<>"" Then
	If userid<>"" And passwd<>"" Then
		If Injection(3, InjectionsArray) = True Then
			ReturnMsg("Please try again")
		Else
			If Login(userid,passwd) = False Then
				ReturnMsg("Account does not exists or incorrect password")
			Else
				LogDB "ClanLogin","Account " & userid & " with password " & passwd & " logged in"
				If chname<>"" Then
					ClanName = IsClanMember(userid,chname)
					If ClanName = "-1" Then
						ReturnMsg("Select character")
						iSnake = 1
					Else
						ReturnMsg("<b>Clan Information</b>")
						LoadVar()
						If iSnake = 0 Then
							iSnake = 2
						End If
					End If			
				Else
					ReturnMsg("Select character")
					iSnake = 1
				End If
			End If
		End If			
	Else
		ReturnMsg("Please fill in both fields")
	End If
Else
	ReturnMsg("Please fill in the following fields to continue")
End If
%>

<div class="box">
<p><center>
<%
If iSnake = 0 Then
	LoginClan()
ElseIf iSnake = 1 Then 
	SelectClanChar() 
ElseIf iSnake = 2 Then
	If nNote <> "" Then
		LogDB "ClanLogin","Account " & userid & " changed clan note to " & nNote
		UpdateClanNote()
	End If
	YouOutput()
	ClanManage()
	MemberTable()
ElseIf iSnake = 3 Then
	NoteForm()
ElseIf iSnake = 4 Then
	IconForm()
End If
%>
</p></center>
</div>

<meta http-equiv='refresh'>