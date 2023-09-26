<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BanUnban.aspx.vb" Inherits="For_Baris.BanUnban" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="font-family: Tahoma; font-size:12px;">
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" style="text-align: center">
        <center>
        <table>
            <tr>
            <td>
            Login:
            </td>
            <td>
            <asp:TextBox ID="TextLogin" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextLogin" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td>
             Password:
            </td>
            <td>
            <asp:TextBox ID="TextPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
             </tr>
        </table>
            </center>
            
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" />
            <br />
            <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
        </asp:Panel>
    <br /><br />
        <asp:Panel ID="Panel2" runat="server" Enabled="False" 
            style="text-align: center" Visible="False">
            <center>
            <table>
            <tr>
            <td>
            ID:
            </td>
            <td>
                        <asp:TextBox ID="TextIDB" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextIDB" ErrorMessage="*" ValidationGroup="Ban"></asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td>Notice:</td>
            <td>
            
                <asp:TextBox ID="TextNotice" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextNotice" ErrorMessage="*" ValidationGroup="Ban"></asp:RequiredFieldValidator>
            
            </td>
            </tr>
            </table>
            </center>

            <asp:Button ID="ButtonBan" runat="server" Text="Ban" ValidationGroup="Ban" />
            &nbsp;<asp:Button ID="ButtonUnban" runat="server" Text="Unban" 
                ValidationGroup="Ban" />
            <br />
            <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Logout" />
        </asp:Panel>
    </div>
    </form>
</body>
</html>
