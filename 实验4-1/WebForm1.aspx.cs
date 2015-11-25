using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验4_1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void province_SelectedIndexChanged(object sender, EventArgs e)
        {
            ArrayList[] citys = new ArrayList[3] { new ArrayList(), new ArrayList(), new ArrayList() };
            citys[0].Add("广西");
            citys[0].Add("江门");
            citys[0].Add("广州");

            citys[1].Add("武汉");
            citys[1].Add("黄石");
            citys[1].Add("黄冈");

            citys[2].Add("长沙");
            citys[2].Add("株洲");
            citys[2].Add("衡阳");

            city.DataSource = citys[province.SelectedIndex];
            city.DataBind();


        }
        protected void password_validate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Contains("$") || args.Value.Contains("\\"))
                args.IsValid = false;
            else
                args.IsValid = true;
        }

    }
}