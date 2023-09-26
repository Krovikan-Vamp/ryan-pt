<!-- #include file ="config/header.asp" -->
<!-- #include file ="config/common.asp" -->
<!-- #include file ="functions/ranks.asp" -->

<% 'Written by Sandurr
Common()
%>

<div class="box">
<p><form action="hl.asp" method="post">Character Type:<BR><SELECT ID=ChType Name=ChType>
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
Level Range (Min - Max):<BR>
<input type=text class="txtinput" name=Min MaxLength=3>
<input type=text class="txtinput" name=Max MaxLength=3><BR>
MaxResults (max = 250):<BR>
<input type=text class="txtinput" name=MRes MaxLength=3><BR>
<input type=Submit class="btn" Value="Show">
</form>

<%
Dim ChType, Min, Max, MRes
ChType = Request.Form("ChType")
Min = Request.Form("Min")
Max = Request.Form("Max")
MRes = Request.Form("MRes")

If IsNumeric(Min) = False Or IsNumeric(Max) = False Then
	Min = 0
	Max = 0
End If

If IsNumeric(MRes) = False Then
	MRes = 0
End If
%>

<B>Top Players</B><BR><%RankTable CInt(MRes),Min,Max,ChType %></p>
</div>

<!-- #include file ="config/footer.asp" -->