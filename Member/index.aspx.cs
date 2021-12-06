using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment7.Member
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // get current user session
                MembershipUser myMembership = Membership.GetUser();

                // define current user id 
                Session["UserID"] = myMembership.ProviderUserKey.ToString();

                GridView1.DataBind();
            }
        }
    }
}