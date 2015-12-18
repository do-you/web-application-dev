<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="实验6.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <h1 style="color: #FF0000;">欢迎光临购物小站</h1>
            <table>
                <tr>
                    <td style="text-align: right">用户名</td>
                    <td>
                        <asp:TextBox ID="uid" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right">密码</td>
                    <td>
                        <asp:TextBox ID="pas" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="用户名或密码错误" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="登陆" OnClick="Button1_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="注册" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
