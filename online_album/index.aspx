<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="online_album.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .box {
            position: relative;
            float: left;
            padding-right: 50px;
            padding-bottom: 30px;
            text-align: center;
        }

        .photo {
            Height: 80px;
            Width: 130px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: right">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="on_login">登录</asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="on_register">注册</asp:LinkButton>
        </div>
        <div>
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
        </div>
    </form>
</body>
</html>
