using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace online_album
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=F:\git\web-application-dev\online_album\App_Data\Database1.mdf;Integrated Security=True"); //创建连接对象
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from [photo]", con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Panel box = new Panel();
                box.CssClass = "box";
                Panel1.Controls.Add(box);

                Image photo = new Image();
                photo.CssClass = "photo";
                photo.ImageUrl = "~/Images/" + dr["uid"].ToString() + "/" + dr["filename"].ToString(); ;
                box.Controls.Add(photo);

                box.Controls.Add(new Literal() { Text = "<br />" });

                Label uid = new Label();
                uid.Text = dr["uid"].ToString();
                box.Controls.Add(uid);

                box.Controls.Add(new Literal() { Text = "<br />" });

                Label datetime = new Label();
                datetime.Text = dr["datetime"].ToString();
                box.Controls.Add(datetime);
            }

        }

        protected void on_login(object sender, EventArgs e)
        {
            Session["method"] = "login";
            Response.Redirect("~/login_register.aspx");
        }

        protected void on_register(object sender, EventArgs e)
        {
            Session["method"] = "register";
            Response.Redirect("~/login_register.aspx");
        }
    }
}