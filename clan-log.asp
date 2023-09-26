<!-- #include file ="config/header.asp" -->
<!-- #include file ="config/common.asp" -->
<!-- #include file ="functions/database.asp" -->

<% 'Written by Sandurr
Common()

DBSettings()
OpenConnection("ClanDB")
Dim LQUERY
LQUERY = "SELECT ClanZang,ClanName,MiconCnt FROM CL"
RS.Open LQUERY, objConn, 3, 1

Response.Write("<div class=box><p>")

Dim i
While i < RS.RecordCount
	Response.Write(RS("ClanZang").Value & ": " & RS("ClanName").Value & ": " & RS("MiconCnt") & "<BR>")
	
	i = i + 1

	If i < RS.RecordCount Then
		RS.MoveNext
	End If
Wend

Response.Write("</p></div>")

CloseConnection()
%>
<!-- #include file ="config/footer.asp" -->