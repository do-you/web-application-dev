<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="实验4_0_1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="输入两个数m和n"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="m="></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="n="></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="TextBox1" ControlToValidate="TextBox2" Operator="LessThanEqual"></asp:CompareValidator>
            <br />
            <asp:Button ID="Button1" runat="server" Text="求完数" PostBackUrl="~/WebForm2.aspx" />
        </div>
    </form>
</body>
</html>
