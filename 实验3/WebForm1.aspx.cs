using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void province_SelectedIndexChanged(object sender, EventArgs e)
        {
            ArrayList[] citys = new ArrayList[3] { new ArrayList(), new ArrayList(), new ArrayList() };
            citys[0].Add("广西");
            citys[0].Add("江门");
            citys[0].Add("广州");

            citys[1].Add("武汉");
            citys[1].Add("黄石");
            citys[1].Add("黄冈");

            citys[2].Add("长沙");
            citys[2].Add("株洲");
            citys[2].Add("衡阳");

            city.DataSource = citys[province.SelectedIndex];
            city.DataBind();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                if (picture.HasFile)
                {
                    string path = Server.MapPath("~");
                    picture.SaveAs(path + "\\" + picture.FileName);
                }

                string result = "用户名:"+ username.Text;
                result += "\\n密码:"+ password.Text;
                result += "\\n性别:"+ sex.SelectedValue;
                result += "\\n籍贯:"+ province.SelectedValue + city.SelectedValue;
                result += "\\nEmail:"+ email.Text;
                result += "\\n手机号码:"+ phone.Text;
=                result += "\\n专业擅长:";
                foreach (ListItem a in major.Items)
                {
                    if (a.Selected)
                        result += a.Value + ",";
                }
                result = result.Substring(0, result.Length - 1);
                result += "\\n兴趣:";
                foreach (ListItem a in hobby.Items)
                {
                    if (a.Selected)
                        result += a.Value + ",";
                }
                result = result.Substring(0, result.Length - 1);
                result += "\\n出生年月:"+ birthday.Text;
                result += "\\n备注信息:"+ beizhu.Text;

                Response.Write("<script>alert('" + result + "')</script>");
            }
        }

        protected void password_validate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Contains("$") || args.Value.Contains("\\"))
                args.IsValid = false;
            else
                args.IsValid = true;
        }
    }
}