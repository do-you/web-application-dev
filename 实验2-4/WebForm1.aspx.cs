using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验2_4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox2.Text = "";
            int num = int.Parse(TextBox1.Text);

            int[][] array = new int[num][];
            for (int i = 0; i < num; i++)
            {
                array[i] = new int[i + 1];
                array[i][0] = 1;
                TextBox2.Text += (new String(' ', 37 - i * 2) + 1);
                for (int j = 1; j <= i - 1; j++)
                {
                    array[i][j] = array[i - 1][j] + array[i - 1][j - 1];
                    TextBox2.Text += (String.Format("{0,4}", array[i][j]));
                }
                if (i != 0)
                {
                    array[i][i] = 1;
                    TextBox2.Text += (String.Format("{0,4}", 1));
                }
                TextBox2.Text += "\n";
            }
        }
    }
}