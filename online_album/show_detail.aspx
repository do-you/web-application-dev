<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show_detail.aspx.cs" Inherits="online_album.show_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center">
            <asp:Image ID="Image1" runat="server" Width="80%"/>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server"/>
            <asp:Button ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" />
        </div>
        <asp:HiddenField ID="uid" runat="server" />
        <asp:HiddenField ID="filename" runat="server" />
    </form>
</body>
</html>
