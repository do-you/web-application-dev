<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="实验5_1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="parm" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SNO], [NAME], [SEX], [AGE] FROM [student] WHERE ([SNO] = @SNO)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="parm" Name="SNO" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>

        </div>
    </form>
</body>
</html>
