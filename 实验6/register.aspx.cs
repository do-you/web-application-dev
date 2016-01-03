using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验6
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
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
        protected void password_validate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Contains("$") || args.Value.Contains("\\"))
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        protected void on_submit(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlDataSource1.Insert();
                Response.AddHeader("refresh", "2;url=login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~");
            if (Request.Files["picture"].ContentLength != 0)
            {
                Request.Files["picture"].SaveAs(path + "\\" + Request.Files["picture"].FileName);
                Image1.ImageUrl = "~/" + Request.Files["picture"].FileName;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\web\web实验\实验6\App_Data\user.mdf;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from [user] where uid=@uid", conn);
            cmd.Parameters.Add("@uid", SqlDbType.Char);
            cmd.Parameters[0].Value = username.Text;
            int count = (int)cmd.ExecuteScalar();  //返回结果集中第一行的第一列（常用于检索单个值，例如记录个数）
            conn.Close();
            if (count > 0)
            {
                args.IsValid = false;
            }

        }
    }
}