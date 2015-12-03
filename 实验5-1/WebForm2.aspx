<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="实验5_1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM student WHERE (SNO = @sno)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT SNO, NAME, SEX, AGE FROM student" UpdateCommand="UPDATE student SET  NAME = @name, SEX = @sex, AGE = @age WHERE (SNO = @sno)">
                <DeleteParameters>
                    <asp:QueryStringParameter Name="sno" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:QueryStringParameter Name="name" />
                    <asp:QueryStringParameter Name="sex" />
                    <asp:QueryStringParameter Name="age" />
                    <asp:QueryStringParameter Name="sno" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="SNO">
                <Columns>
                    <asp:BoundField DataField="SNO" HeaderText="SNO"
                        ReadOnly="True" SortExpression="SNO" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME"
                        SortExpression="NAME" />
                    <asp:BoundField DataField="SEX" HeaderText="SEX"
                        SortExpression="SEX" />
                    <asp:BoundField DataField="AGE" HeaderText="AGE"
                        SortExpression="AGE" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
