using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace online_album
{
    public partial class user_home_page : System.Web.UI.Page
    {
        protected void Page_Init(Object sender, EventArgs e)
        {
            Session["uid"] = "zhou";

            Label5.Text = "欢迎回来，" + Session["uid"].ToString();

            Session["uid"] = "zhou";

            Label5.Text = "欢迎回来，" + Session["uid"].ToString();

            show_photo();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void on_delete(Object sender, EventArgs e)
        {
            Button send = (Button)sender;
            string filename = send.Attributes["filename"];

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=F:\git\web-application-dev\online_album\App_Data\Database1.mdf;Integrated Security=True"); //创建连接对象
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from [photo] where uid=@uid and filename=@filename", con);
            cmd.Parameters.Add("@uid", SqlDbType.NVarChar);
            cmd.Parameters[0].Value = Session["uid"].ToString();
            cmd.Parameters.Add("@filename", SqlDbType.NVarChar);
            cmd.Parameters[1].Value = filename;

            if (0 != cmd.ExecuteNonQuery())
            {
                File.Delete(Server.MapPath("/Images") + "/" + Session["uid"].ToString() + "/" + filename);
            }
            Response.Redirect("user_home_page.aspx");

            con.Close();
        }

        protected void show_photo()
        {
            int i = 0;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=F:\git\web-application-dev\online_album\App_Data\Database1.mdf;Integrated Security=True"); //创建连接对象
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from [photo] where uid=@uid", con);
            cmd.Parameters.Add("@uid", SqlDbType.Char);
            cmd.Parameters[0].Value = Session["uid"].ToString();

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Panel box = new Panel();
                box.CssClass = "box";
                Panel1.Controls.Add(box);

                Image photo = new Image();
                photo.CssClass = "photo";
                photo.ImageUrl = "~/Images/" + Session["uid"].ToString() + "/" + dr["filename"].ToString();
                photo.Attributes["filename"] = dr["filename"].ToString();
                box.Controls.Add(photo);

                box.Controls.Add(new Literal() { Text = "<br />" });

                Label filename = new Label();
                filename.Text = dr["filename"].ToString();
                box.Controls.Add(filename);

                box.Controls.Add(new Literal() { Text = "<br />" });

                Button edit_btn = new Button();
                edit_btn.Text = "更改";
                edit_btn.Attributes["filename"] = dr["filename"].ToString(); ;
                edit_btn.Click += new EventHandler(on_edit);
                box.Controls.Add(edit_btn);

                Button delete_btn = new Button();
                delete_btn.Text = "删除";
                delete_btn.Attributes["filename"] = dr["filename"].ToString(); ;
                delete_btn.Click += new EventHandler(on_delete);
                box.Controls.Add(delete_btn);
            }
            con.Close();
        }
        protected void on_edit(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Redirect("show_detail.aspx?uid=" + Session["uid"].ToString() + "&filename=" + btn.Attributes["filename"]);
        }
        protected void on_upload(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile && (FileUpload1.FileName.EndsWith(".jpg") || FileUpload1.FileName.EndsWith(".jpeg") || FileUpload1.FileName.EndsWith(".bmp") || FileUpload1.FileName.EndsWith(".png") || FileUpload1.FileName.EndsWith(".gif")))
            {
                FileUpload1.SaveAs(Server.MapPath("/Images") + "/" + Session["uid"].ToString() + "/" + FileUpload1.FileName);

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=F:\git\web-application-dev\online_album\App_Data\Database1.mdf;Integrated Security=True"); //创建连接对象
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO [photo] (uid, datetime,filename) VALUES (@uid, @datetime,@filename)", con);
                cmd.Parameters.Add("@uid", SqlDbType.NVarChar);
                cmd.Parameters[0].Value = Session["uid"].ToString();
                cmd.Parameters.Add("@datetime", SqlDbType.DateTime);
                cmd.Parameters[1].Value = DateTime.Now;
                cmd.Parameters.Add("@filename", SqlDbType.NVarChar);
                cmd.Parameters[2].Value = FileUpload1.FileName;
                cmd.ExecuteNonQuery();
                con.Close();

            }
            Response.Redirect("user_home_page.aspx");
        }
    }
}