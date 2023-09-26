<!-- #include file ="config/header.asp" -->
<!-- #include file ="config/common.asp" -->
<!-- #include file ="functions/database.asp" -->

<% 'Written by Sandurr
Common()

DBSettings()
OpenConnection("LogDB")
Dim LQUERY
LQUERY = "SELECT * FROM Visits"
RS.Open LQUERY, objConn, 3, 1

Response.Write("<div class=box><p>")

Dim i
While i < RS.RecordCount
	Response.Write(RS("IP").Value & ": " & RS("Text").Value & "<BR>")
	
	i = i + 1

	If i < RS.RecordCount Then
		RS.MoveNext
	End If
Wend

Response.Write("</p></div>")

CloseConnection()
%>

<!-- #include file ="config/footer.asp" -->