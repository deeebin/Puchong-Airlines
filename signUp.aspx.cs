using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment7
{
    public partial class signUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            CreateUserWizard cw = (CreateUserWizard)LoginView1.FindControl("CreateUserWizard1");

            if (!Roles.IsUserInRole("Member"))
            {
                Roles.AddUserToRole(cw.UserName, "Member");
            }
        }
    }
}