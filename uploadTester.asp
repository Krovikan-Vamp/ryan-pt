<%@ Language=VBScript %>
<%
option explicit 
Response.Expires = -1
Server.ScriptTimeout = 60
%>
<!-- #include file="freeaspupload.asp" -->
<%

Function CheckStr(Data)
Dim Str
	Str =Replace(Data,"#","")
	Str =Replace(Str,"$","")
	Str =Replace(Str,"%","")
	Str =Replace(Str,"&","")
	Str =Replace(Str,"<","")
	Str =Replace(Str,">","")
	Str =Replace(Str,"select","")
	Str =Replace(Str,"insert","")
	Str =Replace(Str,"delete","")
	Str =Replace(Str,"from","")
	Str =Replace(Str,"drop","")
	Str =Replace(Str,"update","")
	Str =Replace(Str,"exec master","")
	Str =Replace(Str,"administrators","")
	Str =Replace(Str,"and","")
	Str =Replace(Str,"net user","")
	Str =Replace(Str,"or","")
	Str =Replace(Str,"'","")
CheckStr=Str
End Function

' ****************************************************
' Change the value of the variable below to the pathname
' of a directory with write permissions, for example "C:\Inetpub\wwwroot"
  Dim uploadsDirVar
  uploadsDirVar = "C:\inetpub\wwwroot\ClanContent" 
' ****************************************************

' Note: this file uploadTester.asp is just an example to demonstrate
' the capabilities of the freeASPUpload.asp class. There are no plans
' to add any new features to uploadTester.asp itself. Feel free to add
' your own code. If you are building a content management system, you
' may also want to consider this script: http://www.webfilebrowser.com/

cUS = Trim(Request.Cookies("userid"))
qUS = Trim(Request.QueryString("userid"))
cMICON = Trim(Request.Cookies("MIconCnt"))
qMICON = Trim(Request.QueryString("MIconCnt"))

If Not cUS = qUS Then
	Response.Write("Error")
	Response.End
End If

If Not cMICON = qMICON Then
	Response.Write(" Error ")
	Response.End
End If

function OutputForm()
%>
    <form name="frmSend" method="POST" enctype="multipart/form-data" action="uploadTester.asp?MIconCnt=<%=qMICON%>&userid=<%=qUS%>" onSubmit="return onSubmitForm();">
	<B>File names:</B><br>
    32x32 BMP File: <input name="attach1" type="file" size=35><br>
    <br>
    <input style="margin-top:4" type=submit value="Upload">
    </form>
<%
end function

function TestEnvironment()
    Dim fso, fileName, testFile, streamTest
    TestEnvironment = ""
    Set fso = Server.CreateObject("Scripting.FileSystemObject")
    fileName = uploadsDirVar & "\test.txt"
    on error resume next
    Set testFile = fso.CreateTextFile(fileName, true)
    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have write permissions.</B><br>The value of your uploadsDirVar is incorrect. Open uploadTester.asp in an editor and change the value of uploadsDirVar to the pathname of a directory with write permissions."
        exit function
    end if
    Err.Clear
    testFile.Close
    fso.DeleteFile(fileName)
    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have delete permissions</B>, although it does have write permissions.<br>Change the permissions for IUSR_<I>computername</I> on this folder."
        exit function
    end if
    Err.Clear
    Set streamTest = Server.CreateObject("ADODB.Stream")
    If Err.Number<>0 then
        TestEnvironment = "<B>The ADODB object <I>Stream</I> is not available in your server.</B><br>Check the Requirements page for information about upgrading your ADODB libraries."
        exit function
    end if
    Set streamTest = Nothing
end function

function SaveFiles
    Dim Upload, fileName, fileSize, ks, i, fileKey

    Set Upload = New FreeASPUpload
    Upload.Save(uploadsDirVar)

	' If something fails inside the script, but the exception is handled
	If Err.Number<>0 then Exit function

    SaveFiles = ""
    ks = Upload.UploadedFiles.keys
    if (UBound(ks) <> -1) then
        SaveFiles = "<B>Files uploaded:</B> "
        for each fileKey in Upload.UploadedFiles.keys
	    if UCase(Right(Upload.UploadedFiles(fileKey).FileName,4)) = ".BMP" AND (Upload.UploadedFiles(fileKey).Length > 3120 AND Upload.UploadedFiles(fileKey).Length < 3130) Then
            	SaveFiles = SaveFiles & Upload.UploadedFiles(fileKey).FileName & " (" & Upload.UploadedFiles(fileKey).Length & "B) "
	    else
		'Response.Write("alert('" & Upload.UploadedFiles(fileKey).FileName & ":" & Upload.UploadedFiles(fileKey).Length & "')")
		SaveFiles = "Must be .bmp and 32x32!"
	    end if
        next
    else
        SaveFiles = "The file name specified in the upload form does not correspond to a valid file in the system."
    end if
	SaveFiles = SaveFiles & "<BR>" & "Please wait a few seconds before icon change takes effect!"
	SaveFiles = SaveFiles & "<meta http-equiv='refresh' content='4;url=javascript:window.close()'>"
	SaveFiles = SaveFiles & "<BR><BR> Upload finished."
end function
%>

<HTML>
<HEAD>
<TITLE>Upload Clan Icon</TITLE>
<style>
BODY {background-color: white;font-family:arial; font-size:12}
</style>
<script>
function onSubmitForm() {
    var formDOMObj = document.frmSend;
    if (formDOMObj.attach1.value == "")
        alert("Please press the browse button and pick a file.")
    else
        return true;
    return false;
}
</script>

</HEAD>

<BODY>

<br><br>
<div style="border-bottom: #A91905 2px solid;font-size:16">Update your clan icon</div>
<%
Dim diagnostics
if Request.ServerVariables("REQUEST_METHOD") <> "POST" then
    diagnostics = TestEnvironment()
    if diagnostics<>"" then
        response.write "<div style=""margin-left:20; margin-top:30; margin-right:30; margin-bottom:30;"">"
        response.write diagnostics
        response.write "<p>After you correct this problem, reload the page."
        response.write "</div>"
    else
        response.write "<div style=""margin-left:150"">"
        OutputForm()
        response.write "</div>"
    end if
else
    response.write "<div style=""margin-left:150"">"
    OutputForm()
    response.write SaveFiles()
    response.write "<br><br></div>"
end if

%>
</BODY>
</HTML>
