using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验4_1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string result = "用户名:" + Request["username"];
            result += "<br/>密码:" + Request["password"];
            result += "<br/>性别:" + Request["sex"];
            result += "<br/>籍贯:" + Request["province"] + Request["city"];
            result += "<br/>Email:" + Request["email"];
            result += "<br/>手机号码:" + Request["phone"];
            result += "<br/>专业擅长:" + Request["major"];
            result += "<br/>兴趣:" + Request["hobby"];
            result += "<br/>出生年月:" + Request["birthday"];
            result += "<br/>备注信息:" + Request["beizhu"];

            string path = Server.MapPath("~");
            if(Request.Files["picture"].ContentLength!=0)
            {
                Request.Files["picture"].SaveAs(path + "\\" + Request.Files["picture"].FileName);
            }
            Response.Write(result);
        }
    }
}