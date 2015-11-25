using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验4_2
{
    public partial class buy1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buy1_confirm(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (CheckBox1.Checked && TextBox1.Text != null)
                {
                    if (Session["猪肉"] == null)
                        Session["猪肉"] = int.Parse(TextBox1.Text);
                    else
                    {
                        int tem = (int)Session["猪肉"];
                        Session["猪肉"] = tem + int.Parse(TextBox1.Text);
                    }
                }
                if (CheckBox2.Checked && TextBox2.Text != null)
                {
                    if (Session["牛肉"] == null)
                        Session["牛肉"] = int.Parse(TextBox2.Text);
                    else
                    {
                        int tem = (int)Session["牛肉"];
                        Session["牛肉"] = tem + int.Parse(TextBox2.Text);
                    }
                }
            }
        }
    }
}