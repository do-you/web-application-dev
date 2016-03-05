using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace online_album
{
    public partial class show_detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                uid.Value = Request.QueryString["uid"];
                filename.Value = Request.QueryString["filename"];
                Image1.ImageUrl = "~/Images/" + uid.Value + "/" + filename.Value;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                File.Delete(Server.MapPath("/Images") + "/" + uid.Value + "/" + filename.Value);
                FileUpload1.SaveAs(Server.MapPath("/Images") + "/" + uid.Value + "/" + FileUpload1.FileName);

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=F:\git\web-application-dev\online_album\App_Data\Database1.mdf;Integrated Security=True"); //创建连接对象
                con.Open();
                SqlCommand cmd = new SqlCommand("update [photo] set filename=@filename2 where uid=@uid and filename=@filename", con);
                cmd.Parameters.Add("@uid", SqlDbType.NVarChar);
                cmd.Parameters[0].Value = Session["uid"].ToString();
                cmd.Parameters.Add("@filename", SqlDbType.NVarChar);
                cmd.Parameters[1].Value = filename.Value;
                cmd.Parameters.Add("@filename2", SqlDbType.NVarChar);
                cmd.Parameters[2].Value = FileUpload1.FileName;
                cmd.ExecuteNonQuery();
                con.Close();
                
                filename.Value = FileUpload1.FileName;
                Image1.ImageUrl = "~/Images/" + uid.Value + "/" + filename.Value;
            }
        }
    }
}