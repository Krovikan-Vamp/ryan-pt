<!-- #include file ="config/common.asp" -->
<!-- #include file ="config/header.asp" -->
<!-- #include file ="functions/database.asp" -->
<!-- #include file ="functions/injections.asp" -->
<% 'Written by Sandurr

Dim userid, passwd
userid = Request.Form("userid")
passwd = Request.Form("passwd")

%><div class='box'><p><%

Function ReturnMsg(strMessage)
	Response.Write(strMessage & "</p></div>")
End Function

If Len(userid) > 16 Or Len(passwd) > 16 Then
	ReturnMsg("Your fields are bigger than 16 words")
	Response.End
End If

Dim InjectionsArray(2)
InjectionsArray(1) = userid
InjectionsArray(2) = passwd

If userid<>"" Or passwd<>"" Then
	If userid<>"" And passwd<>"" Then
		If IsNumeric(Left(userid,1)) = False Then
			If Injection(2, InjectionsArray) = True Then
				ReturnMsg("<font face=Verdana><font size=2>Please try again</font>")
			Else
				DBSettings()
				If AccExists(userid) = True Then
					ReturnMsg("<font face=Verdana><font size=2>Account already exists</font>")
				Else
					If AccCreate(userid,passwd) = True Then
						LogDB "Register","Account " & userid & " with password " & passwd & " created"
						ReturnMsg("<font face=Verdana><font size=2>Account successfully created!</font>")
					Else
						ReturnMsg("<font face=Verdana><font size=2>Please try again</font>")
					End If
				End If
			End If
		Else
			ReturnMsg("<font face=Verdana><font size=2>Your userid must start with a letter</font>")
		End If			
	Else
		ReturnMsg("<font face=Verdana><font size=2>Please fill in both fields</font>")
	End If
Else
	ReturnMsg("<b><center><font face=Verdana><font size=2>Make the account name different than your character name and use a good password</b><BR>Please fill in the following fields to register</font></center>")
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
<p><font face="Verdana"><font size=2><center><form action="register.asp" method="post">Account Name:<BR><input type="text" class="txtbox" value="" name="userid" onkeypress="return textboxMultilineMaxNumber(this,16)"><BR>
<br>Password:<BR><input type="password" class="txtbox" value="" name="passwd" onkeypress="return textboxMultilineMaxNumber(this,16)"><BR><BR>
<input type="Submit" value="Register" class="btn"></form></p>
</div></center></font>