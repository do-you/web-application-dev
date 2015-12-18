using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验6
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                Response.Redirect("~/buypage1.aspx");
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\web\web实验\实验6\App_Data\user.mdf;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
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
    }
}