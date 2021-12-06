using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment7
{
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e) // redirect based on roles
        {
            Login lg = (Login)LoginView1.FindControl("Login1"); // include this code in order to find the login control elements because its inside LoginView 

            if (Roles.IsUserInRole(lg.UserName,"Admin")) // check if user is admin
                Response.Redirect("Admin/index.aspx"); // redirect to admin homepage
            else if (Roles.IsUserInRole(lg.UserName,"Member")) // if user is member
                Response.Redirect("Member/index.aspx"); // redirect to member homepage
        }
    }
}