using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验4_2
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, int> price = new Dictionary<string, int>();
            price.Add("猪肉", 20);
            price.Add("牛肉", 40);
            price.Add("足球", 20);
            price.Add("篮球", 25);

            int totalprice = 0;
            TextBox1.Text = string.Format("{0,-12}{1,-12}{2,-12}\n", "商品名称", "商品单价", "数量");
            foreach (string key in Session.Keys)
            {
                if (Session[key] != null)
                {
                    totalprice += price[key] * (int)Session[key];
                    TextBox1.Text += string.Format("{0,-17}{1,-12}{2,-12}\n", key, price[key], Session[key]);
                }
            }
            total.Text = totalprice.ToString();
        }
    }
}