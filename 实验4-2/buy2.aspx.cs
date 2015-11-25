using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验4_2
{
    public partial class buy2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buy2_confirm(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (CheckBox1.Checked && TextBox1.Text != null)
                {
                    if (Session["足球"] == null)
                        Session["足球"] = int.Parse(TextBox1.Text);
                    else
                    {
                        int tem = (int)Session["足球"];
                        Session["足球"] = tem + int.Parse(TextBox1.Text);
                    }
                }
                if (CheckBox2.Checked && TextBox2.Text != null)
                {
                    if (Session["篮球"] == null)
                        Session["篮球"] = int.Parse(TextBox2.Text);
                    else
                    {
                        int tem = (int)Session["篮球"];
                        Session["篮球"] = tem + int.Parse(TextBox2.Text);
                    }
                }
            }
        }
    }
}