<!-- #include file ="config/header.asp" -->
<!-- #include file ="functions/sodclan.asp" -->

<% 'Written by Sandurr
%>

<%
Dim MRes
MRes = Request.Form("MRes")

If IsNumeric(MRes) = False Then
	MRes = 0
End If
%>

<p><B>Clan SoD High Scores (Survive or Die)</B><br><%SoDTableClan CInt(MRes) %></p>
</div>