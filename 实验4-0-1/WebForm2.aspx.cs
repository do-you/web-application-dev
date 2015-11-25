using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验4_0_1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int m = int.Parse(Request["TextBox1"]);
            int n = int.Parse(Request["TextBox2"]);
            int sum;
            string yinzi="",resultstr=""+m+"与"+n+ "之间的完数为:<br />";
            for (int i = m; i <= n; i++)
            {
                sum = 0;
                yinzi = "";
                for (int j = 1; j < i; j++)
                {
                    if (i % j == 0)
                    {
                        yinzi += j.ToString()+" ";
                        sum += j;
                    }
                }
                if (sum == i)
                    resultstr += string.Format("{0},其因子为{1}<br />", i, yinzi);
            }
            Response.Write(resultstr);
        }
    }
}