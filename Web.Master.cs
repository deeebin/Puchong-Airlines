using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment7
{
    public partial class Web : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemDataBound(object sender, MenuEventArgs e) // on the sitemap menu databound
        {
            if (Context.User.Identity.IsAuthenticated && (e.Item.Text == "Login" || e.Item.Text == "Sign Up")) // check if the user is logged in and the menu item text is "Login" or "Sign Up"
            {
                    e.Item.Parent.ChildItems.Remove(e.Item); // remove the menu item "Login" and "Sign Up"
            }
        }
    }
}