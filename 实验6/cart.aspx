<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="实验6.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            <h2>你的购物车:</h2>
            <asp:TextBox ID="TextBox1" runat="server" Height="100px" TextMode="MultiLine" Width="400px" Font-Names="新宋体"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server" Text="总价钱是:"></asp:Label>&nbsp;<asp:TextBox ID="total" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
