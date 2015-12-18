<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buypage1.aspx.cs" Inherits="实验6.buypage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem NavigateUrl="~/buypage1.aspx" Text="买肉" Value="买肉"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/buypage2.aspx" Text="买球" Value="新建项"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/cart.aspx" Text="购物车" Value="购物车"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <h1 style="color: #FF0000">欢迎来到球类购物区</h1>
            <table>
                <tr>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="猪肉" />&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Text="单价:20"></asp:Label>&nbsp;&nbsp;
                        <label>购买数量:</label>
                        <asp:TextBox ID="TextBox1" runat="server" Width="35px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="0-99间的整数" MaximumValue="99" MinimumValue="0" Type="Integer" ControlToValidate="TextBox1"></asp:RangeValidator>
                        <br />
                        <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="你还没选中你要购买的商品" OnServerValidate="CustomValidator3_ServerValidate" ControlToValidate="TextBox1"></asp:CustomValidator>
                        <br />
                        <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="你还没选中你要购买的数量" OnServerValidate="CustomValidator4_ServerValidate"></asp:CustomValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="CheckBox2" runat="server" Text="牛肉" />&nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Text="单价:40"></asp:Label>&nbsp;&nbsp;
                        <label>购买数量:</label>
                        <asp:TextBox ID="TextBox2" runat="server" Width="35px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="0-99间的整数" MaximumValue="99" MinimumValue="0" Type="Integer" ControlToValidate="TextBox2"></asp:RangeValidator>
                        <br />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="你还没选中你要购买的商品" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="TextBox2"></asp:CustomValidator>
                        <br />
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="你还没选中你要购买的数量" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Button ID="Button1" runat="server" Text="确认" OnClick="buy1_confirm" />
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
