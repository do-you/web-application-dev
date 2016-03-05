using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace online_album
{
    public partial class login_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["method"] != null && Session["method"].ToString() == "register")
                change_active_view(1);
            else
                change_active_view(0);
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Session["uid"] = uid.Text;
                Response.Redirect("~/user_home_page.aspx"); 
            }

        }

        protected void check_id_pas(object source, ServerValidateEventArgs args)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=F:\git\web-application-dev\online_album\App_Data\Database1.mdf;Integrated Security=True");
            conn.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from [user] where uid=@uid and pas=@pas", conn);
            cmd.Parameters.Add("@uid", SqlDbType.Char);
            cmd.Parameters[0].Value = uid.Text;
            cmd.Parameters.Add("@pas", SqlDbType.Char);
            cmd.Parameters[1].Value = pas.Text;
            int count = (int)cmd.ExecuteScalar();  //返回结果集中第一行的第一列（常用于检索单个值，例如记录个数）
            conn.Close();
            if (count == 0)
            {
                args.IsValid = false;
            }
        }
        protected void register_btn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlDataSource1.Insert();
                Response.Write("<script>alert('注册成功，赶快登录吧！')</script>");
                change_active_view(0);
            }
        }

        protected void check_id(object source, ServerValidateEventArgs args)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=F:\git\web-application-dev\online_album\App_Data\Database1.mdf;Integrated Security=True");
            conn.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from [user] where uid=@uid", conn);
            cmd.Parameters.Add("@uid", SqlDbType.Char);
            cmd.Parameters[0].Value = uid.Text;
            int count = (int)cmd.ExecuteScalar();  //返回结果集中第一行的第一列（常用于检索单个值，例如记录个数）
            conn.Close();
            if (count != 0)
            {
                args.IsValid = false;
            }
        }
        protected void change_active_view(int i)
        {
            if (i == 0)
            {
                Button1.BackColor = Color.FromArgb(240, 240, 240);
                Button2.BackColor = Color.White;
            }
            else
            {
                Button1.BackColor = Color.White;
                Button2.BackColor = Color.FromArgb(240, 240, 240);
            }
            MultiView1.ActiveViewIndex = i;
        }
        protected void on_login(object sender, EventArgs e)
        {
            change_active_view(0);
        }

        protected void on_register(object sender, EventArgs e)
        {
            change_active_view(1);
        }
    }
}