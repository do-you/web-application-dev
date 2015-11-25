using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验2_3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string[] array = TextBox1.Text.Split(',');
            for (int i = 1; i < array.Length; i++)
            {
                for (int j = array.Length - 1; j >= i; j--)
                {
                    int a = int.Parse(array[j - 1]);
                    int b = int.Parse(array[j]);
                    if (a > b)
                    {
                        string c = array[j - 1];
                        array[j - 1] = array[j];
                        array[j] = c;
                    }
                }
                TextBox2.Text += array[i - 1] + ",";
            }
            TextBox2.Text += array[array.Length - 1];
        }
    }
}