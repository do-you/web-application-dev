<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buy2.aspx.cs" Inherits="实验4_2.buy2" %>

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
                    <asp:MenuItem NavigateUrl="~/buy1.aspx" Text="买肉" Value="买肉"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/buy2.aspx" Text="买球" Value="新建项"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/cart.aspx" Text="购物车" Value="购物车"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="足球" />&nbsp&nbsp
        <asp:Label ID="Label1" runat="server" Text="单价:20"></asp:Label>&nbsp&nbsp
        <asp:TextBox ID="TextBox1" runat="server" Width="25px"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="0-99间的整数" MaximumValue="99" MinimumValue="0" Type="Integer" ControlToValidate="TextBox1"></asp:RangeValidator>
            <br />
            <br />
            <asp:CheckBox ID="CheckBox2" runat="server" Text="篮球" />&nbsp&nbsp
        <asp:Label ID="Label2" runat="server" Text="单价:25"></asp:Label>&nbsp&nbsp
        <asp:TextBox ID="TextBox2" runat="server" Width="25px"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="0-99间的整数" MaximumValue="99" MinimumValue="0" Type="Integer" ControlToValidate="TextBox2"></asp:RangeValidator>
            <br />
            <asp:Button ID="Button1" runat="server" Text="确认" OnClick="buy2_confirm" />
        </div>
    </form>
</body>
</html>
