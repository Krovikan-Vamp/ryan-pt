<!-- #include file ="config/header.asp" -->
<!-- #include file ="functions/sodpersonal.asp" -->
<font face="Verdana"><font size=2>
<% 'Written by Sandurr
%>

<div class="box">
<p><form action="sodpersonal.asp" method="post">Character Type:<BR><SELECT ID=ChType Name=ChType>
	<OPTION></OPTION>
	<OPTION>Fighter</OPTION>
	<OPTION>Mechanician</OPTION>
	<OPTION>Archer</OPTION>
	<OPTION>Pikeman</OPTION>
	<OPTION>Atalanta</OPTION>
	<OPTION>Knight</OPTION>
	<OPTION>Magician</OPTION>
	<OPTION>Priestess</OPTION>
</SELECT><BR>
Max Results (max = 250):<BR>
<input type=text class="txtinput" name=MRes MaxLength=3><BR>
<input type=Submit class="btn" Value="Show">
</form>

<%
Dim ChType, MRes
ChType = Request.Form("ChType")
MRes = Request.Form("MRes")

If IsNumeric(MRes) = False Then
	MRes = 0
End If
%>

<B>Personal SoD High Scores (Survive or Die)</B><BR><%SoDTablePersonal CInt(MRes),ChType %></p>
</div>