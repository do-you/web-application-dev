using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验2_2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            String[] num = TextBox1.Text.Split(',');
            int max = int.MinValue, min = int.MaxValue;
            foreach (String b in num)
            {
                int a = int.Parse(b);
                if (a > max)
                    max = a;
                if (a < min)
                    min = a;
            }
            TextBox2.Text = max.ToString();
            TextBox3.Text = min.ToString();
        }
    }
}