using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Assignment7.Admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMemberBookingGridView();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // step 1: prepare connection to DB
            string connectionString = @"Data Source=PEPEGA\SQLEXPRESS01;Initial Catalog=Assignment7;Integrated Security=True";

            // step 2: create SQL Connection
            SqlConnection con = new SqlConnection(connectionString);

            // step 3: open connection
            con.Open();

            // step 4: create SQL Query
            string query = "INSERT INTO Flight (OriginCity, DestinationCity, DepartureDate, DepartureTime, ArrivalDate," +
                "ArrivalTime, SeatAvailable, Price) VALUES (@getOriginCity, @getDestinationCity, @getDepartureDate, " +
                "@getDepartureTime, @getArrivalDate, @getArrivalTime, @getSeatAvailable, @getPrice)";

            // step 5: create SQL command
            SqlCommand cmd = new SqlCommand(query, con);

            // step 6: adddata
            cmd.Parameters.AddWithValue("@getOriginCity", txtOrigin.Text);
            cmd.Parameters.AddWithValue("@getDestinationCity", txtDestination.Text);
            cmd.Parameters.AddWithValue("@getDepartureDate", txtDdate.Text);
            cmd.Parameters.AddWithValue("@getDepartureTime", txtDtime.Text);
            cmd.Parameters.AddWithValue("@getArrivalDate", txtAdate.Text);
            cmd.Parameters.AddWithValue("@getArrivalTime", txtAtime.Text);
            cmd.Parameters.AddWithValue("@getSeatAvailable", txtSeatAvailable.Text);
            cmd.Parameters.AddWithValue("@getPrice", txtPrice.Text);
            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                lblResults.Text = "Oops! Some error occur!";
            }

            // step 7: close connection
            con.Close();
        }

        protected void BindMemberBookingGridView() // Binding the member booking grid view
        {
            string connectionString = @"Data Source=PEPEGA\SQLEXPRESS01;Initial Catalog=Assignment7;Integrated Security=True";
            string query = "SELECT Booking.BookingID, Booking.FlightID, Booking.DateofBooked, Booking.FullName, " +
                "Booking.PhoneNo, Booking.Email, Users.UserName, sum(PassengerBooked.TotalPassengerCategory), " +
                "Flight.Price,Booking.TotalPrice, Booking.PaymentStatus FROM Booking INNER JOIN PassengerBooked ON " +
                "Booking.BookingID = PassengerBooked.BookingID INNER JOIN Flight ON Booking.FlightID = Flight.FlightID " +
                "INNER JOIN Users ON Booking.UserID = Users.UserId GROUP BY Booking.BookingID, Booking.FlightID, " +
                "Booking.DateofBooked, Users.UserName, Flight.Price,Booking.TotalPrice, Booking.PaymentStatus, " +
                "Booking.FullName, Booking.PhoneNo, Booking.Email " +
                "ORDER BY Booking.DateOfBooked DESC";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                // Find the GridView and display the data. The data will be coming from temporary Data Table.
                MemberBookingGridView.DataSource = dt;
                // Binds the data source to the GridView control
                MemberBookingGridView.DataBind();
            }
            else
            {
                MemberBookingGridView.DataSource = null;
                MemberBookingGridView.DataBind();
            }
            con.Close();
        }
        protected void MemberBookingGridView_RowUpdating(object sender, GridViewUpdateEventArgs e) // Update row function
        {
            string connectionString = @"Data Source=PEPEGA\SQLEXPRESS01;Initial Catalog=Assignment7;Integrated Security=True";

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            Label lblBid = MemberBookingGridView.Rows[e.RowIndex].FindControl("lblBookingID") as Label;

            DropDownList PaymentStatus = (DropDownList)MemberBookingGridView.Rows[e.RowIndex].FindControl("PaymentStatus");
            string query = "UPDATE Booking SET PaymentStatus = @PaymentStatus WHERE BookingID = @BookingID";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@BookingID", lblBid.Text);
            cmd.ExecuteNonQuery();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            MemberBookingGridView.EditIndex = -1;
            //Call BindMemberBookingGridView method to display updated data
            BindMemberBookingGridView();
        }

        protected void MemberBookingGridView_RowEditing(object sender, GridViewEditEventArgs e) // function when editing the row
        {
            MemberBookingGridView.EditIndex = e.NewEditIndex;
            BindMemberBookingGridView();
        }

        protected void MemberBookingGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) // function for cancel the edit
        {
            MemberBookingGridView.EditIndex = -1;
            BindMemberBookingGridView();
        }

        protected void MemberBookingGridView_PageIndexChanging(object sender, GridViewPageEventArgs e) // function when changing page index
        {
            MemberBookingGridView.PageIndex = e.NewPageIndex;
            BindMemberBookingGridView();
        }

        protected void MemberBookingGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string connectionString = @"Data Source=PEPEGA\SQLEXPRESS01;Initial Catalog=Assignment7;Integrated Security=True";

            SqlConnection con = new SqlConnection(connectionString);

            con.Open();
            Label lblBid = MemberBookingGridView.Rows[e.RowIndex].FindControl("lblBookingID") as Label;
            string delQuery = "Delete from PassengerBooked where BookingID = @getBookingID; " +
                "Delete from Booking where BookingID = @getBookingID";
            SqlCommand cmd = new SqlCommand(delQuery, con);

            cmd.Parameters.AddWithValue("@getBookingID", lblBid.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            BindMemberBookingGridView();
        }

        protected void CreateRoleBtn(object sender, EventArgs e)
        {
            string newRoleName = RoleName.Text.Trim();

            if (!Roles.RoleExists(newRoleName))
            {
                // Create the role
                Roles.CreateRole(newRoleName);
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                lblResults.Text = "Error! The role has already been created!";
            }
            RoleName.Text = string.Empty;
        }

        protected void AssignAdminRolebtn(object sender, EventArgs e)
        {
            //remove the user member role
            Roles.RemoveUserFromRole(DropDownList1.Text, "Member");
            //assign the user to admin role
            Roles.AddUserToRole(DropDownList1.Text, "Admin");
            lblResults2.Text = "Role is successfully assigned.";
        }
    }
}