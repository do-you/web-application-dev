<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_home_page.aspx.cs" Inherits="online_album.user_home_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <style type="text/css">
        .check {
            position: absolute;
            left: 0px;
            top: 0px;
        }

        .box {
            float: left;
            padding-right: 50px;
            padding-bottom: 30px;
            text-align: center;
            Width: 130px;
        }
        .photo {
            Height: 80px;
            Width: 130px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
        </div>
        <div style="text-align: right">
            <asp:FileUpload ID="FileUpload1" runat="server" EnableViewState="False" ViewStateMode="Disabled" />
            <asp:Button ID="Button3" runat="server" Text="上传" OnClick="on_upload" EnableViewState="False" ViewStateMode="Disabled" />
        </div>
        <div>
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
        </div>
    </form>
</body>
</html>
