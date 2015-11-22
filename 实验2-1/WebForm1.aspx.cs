using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验2_1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            double a = 1, b = 2, result = 0, sign = 1;
            for (int i = 0; i < 10; i++)
            {
                result += sign * (b / a);
                double c = b;
                b += a;
                a = c;
                sign *= -1;
            }
            Response.Write(Math.Round(result, 2));
        }
    }
}