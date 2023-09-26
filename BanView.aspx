<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BanView.aspx.vb" Inherits="For_Baris.BanView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="font-family: Tahoma; font-size:12px">
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
        <br />
        <asp:Panel ID="Panel2" runat="server">
        <center>
<br>
<font size=2><b>Report Status</b></font>
<br>
            <asp:GridView ID="GridBans" runat="server" 
    EnableModelValidation="True" AutoGenerateColumns="False" CellPadding="4" 
                EmptyDataText="No warns yet.">
                <Columns>
                    <asp:BoundField DataField="BanCount" HeaderText="#" />
                    <asp:BoundField DataField="UserName" HeaderText="User ID" />
                    <asp:BoundField DataField="CharName" HeaderText="Character" />
                    <asp:BoundField DataField="Warns" HeaderText="Warned" />
                    <asp:BoundField DataField="DateOfBan" HeaderText="Banned date" 
                        HtmlEncode="False" />
                    <asp:BoundField DataField="ExpireDate" HeaderText="Expire date" 
                        HtmlEncode="False" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" />
                </Columns>
  <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
            <asp:Button ID="Button1" runat="server" Text="Logout" Visible="False" />
            </center>
        </asp:Panel>

        <asp:Panel ID="Panel3" runat="server" Visible="False">
        <center>
            <table>
                <tr>
                    <td>Login:</td>
                    <td>
                        <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Char name:</td>
                    <td>
                        <asp:TextBox ID="txtCharName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Warns:</td>
                    <td>
                        <asp:TextBox ID="txtWarns" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Date of ban:</td>
                    <td>
                        <asp:TextBox ID="txtDateOfBan" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Expire date:</td>
                    <td>
                        <asp:TextBox ID="txtExpireDate" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Reason:</td>
                    <td>
                        <asp:TextBox ID="txtReason" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="ButtonAdd" runat="server" Text="Ban" />
                    </td>
                </tr>
            </table>
            </center>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
