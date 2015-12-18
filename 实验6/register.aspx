<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="实验6.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="username" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="不能为空" ControlToValidate="username"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="6~18个字符，包括字母、数字、下划线，以字母开头，字母或数字结尾" ControlToValidate="username" ValidationExpression="^[a-zA-Z]\w{4,16}([a-zA-Z]|\d)$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="password"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="字符不能包含'$'和'\'" ControlToValidate="password" OnServerValidate="password_validate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="确认密码"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="password2" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ControlToValidate="password2"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致" ControlToCompare="password" ControlToValidate="password2"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="性别"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="sex" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="true">男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="籍贯"></asp:Label>
                    </td>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="province" runat="server" OnSelectedIndexChanged="province_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>广东省</asp:ListItem>
                                    <asp:ListItem>湖北省</asp:ListItem>
                                    <asp:ListItem>湖南省</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="city" runat="server">
                                    <asp:ListItem>广西</asp:ListItem>
                                    <asp:ListItem>江门</asp:ListItem>
                                    <asp:ListItem>广州</asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="email" runat="server" TextMode="SingleLine"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="邮箱格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="手机号"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="phone" runat="server" TextMode="SingleLine"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="手机号必须是11位数字，且必须是所有联通的的号码" ValidationExpression="(130|135)\d{8}" ControlToValidate="phone"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="专业擅长"></asp:Label>
                    </td>
                    <td>
                        <asp:ListBox ID="major" runat="server" SelectionMode="Multiple">
                            <asp:ListItem>Window编程</asp:ListItem>
                            <asp:ListItem>单片机编程</asp:ListItem>
                            <asp:ListItem>ASP.NET编程</asp:ListItem>
                            <asp:ListItem>J2EE编程</asp:ListItem>
                            <asp:ListItem>Java编程</asp:ListItem>
                        </asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="业余爱好"></asp:Label>
                    </td>
                    <td>
                       <%-- <asp:CheckBoxList ID="hobby" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>足球</asp:ListItem>
                            <asp:ListItem>篮球</asp:ListItem>
                            <asp:ListItem>排球</asp:ListItem>
                            <asp:ListItem>唱歌</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:CheckBoxList>--%>
                        <input name="hobby" id="hobby_0" type="checkbox" value="足球" />
                        <label for="hobby_0">足球</label>
                        <input name="hobby" id="hobby_1" type="checkbox" value="篮球" />
                        <label for="hobby_1">篮球</label>
                        <input name="hobby" id="hobby_2" type="checkbox" value="排球" />
                        <label for="hobby_2">排球</label>
                        <input name="hobby" id="hobby_3" type="checkbox" value="唱歌" />
                        <label for="hobby_3">唱歌</label>
                        <input name="hobby" id="hobby_4" type="checkbox" value="其他" />
                        <label for="hobby_4">其他</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="个人照片"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="picture" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="出生年月"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="birthday" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="备注信息"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="beizhu" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="on_submit" />
                        <input id="Reset1" type="reset" value="reset" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary runat="server" ShowMessageBox="True" DisplayMode="List" ShowSummary="False"></asp:ValidationSummary>
        </div>
    </form>
</body>
</html>
