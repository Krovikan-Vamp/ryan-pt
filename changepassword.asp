<!-- #include file ="config/common.asp" -->
<!-- #include file ="functions/database.asp" -->
<!-- #include file ="functions/injections.asp" -->
<!-- #include file ="config/header.asp" -->

<font face="Verdana"><font size=2>
<% 'Written by Sandurr

Dim userid, opasswd, npasswd
userid = Request.Form("userid")
opasswd = Request.Form("opasswd")
npasswd = Request.Form("npasswd")

%><div class='box'><p><center><%

Function ReturnMsg(strMessage)
	Response.Write(strMessage & "</p></center></div>")
End Function

If Len(userid) > 16 Or Len(opasswd) > 16 Or Len(npasswd) > 16 Then
	ReturnMsg("Your fields are bigger than 16 words")
	Response.End
End If

Dim InjectionsArray(3)
InjectionsArray(1) = userid
InjectionsArray(2) = opasswd
InjectionsArray(3) = npasswd

If userid<>"" Or opasswd<>"" Or npasswd<>"" Then
	If userid<>"" And opasswd<>"" And npasswd<>"" Then
		If Injection(3, InjectionsArray) = True Then
			ReturnMsg("Please try again")
		Else
			DBSettings()
			dbIP = GetAccountIP(userid)

			If Login(userid,opasswd) = False Then
					ReturnMsg("Account does not exists or incorrect old password")
					LogDB "ChangePassword","Attempt changing password to " & npasswd & " for account " & userid
				Else
					If ChangePassword(userid,npasswd) = True Then
						ReturnMsg("Successfully changed password (Redirecting)")
					Else
						ReturnMsg("Please try again")
					End If
				End If

			End If			
	Else
		ReturnMsg("Please fill in all fields")
	End If
Else
	ReturnMsg("Please fill in the following fields to change your password")
End If
%>
<script language="javascript">
function textboxMultilineMaxNumber(txt,maxLen){
try{
if(txt.value.length > (maxLen-1))return false;
}catch(e){
}
}
</script>
<div class="box">
<p><form action="changepassword.asp" method="post"><br><center>Login:<BR><input type="text" class="txtbox" value="" name="userid" onkeypress="return textboxMultilineMaxNumber(this, 16)"><BR>
<br>Old password:<BR><input type="password" class="txtbox" value="" name="opasswd" onkeypress="return textboxMultilineMaxNumber(this, 16)"><BR>
<br>New password:<BR><input type="password" class="txtbox" value="" name="npasswd" onkeypress="return textboxMultilineMaxNumber(this, 16)"><BR><BR></font></center>
<input type="Submit" value="Change password" class="btn"></form></p>
</div>