<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_register.aspx.cs" Inherits="online_album.login_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .tab {
            border-style: none;
            padding: 0px;
            margin: 0px;
            width: 100%;
        }

        table {
            width: 100%;
            background-color: rgb(240,240,240);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 0 auto; width: 250px;">
            <ol style="list-style: none; margin: 0; padding: 0;">
                <li style="float: left; width: 50%">
                    <asp:Button ID="Button1" runat="server" Text="登录" CssClass="tab" CausesValidation="False" OnClick="on_login" />
                </li>
                <li style="float: left; width: 50%">
                    <asp:Button ID="Button2" runat="server" Text="注册" CssClass="tab" CausesValidation="False" OnClick="on_register" />
                </li>
            </ol>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="login" runat="server">
                    <table>
                        <tr>
                            <td style="text-align: right">用户名
                            </td>
                            <td>
                                <asp:TextBox ID="uid" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">密码</td>
                            <td>
                                <asp:TextBox ID="pas" runat="server" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="用户名或密码错误" ForeColor="Red" OnServerValidate="check_id_pas" ValidationGroup="check_login"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="login_btn" runat="server" Text="登陆" OnClick="login_btn_Click" ValidationGroup="check_login" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="register" runat="server">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" InsertCommand="INSERT INTO [user] (uid, pas) VALUES (@uid, @pas)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="uid" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox2" Name="pas" PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <table>
                        <tr>
                            <td style="text-align: right">用户名
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">密码</td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="用户名已存在" ForeColor="Red" OnServerValidate="check_id" ValidationGroup="check_register"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="register_btn" runat="server" Text="注册" OnClick="register_btn_Click" ValidationGroup="check_register" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
