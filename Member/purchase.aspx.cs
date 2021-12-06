using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment7.Member
{
    public partial class purchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void buttonReset_Click(object sender, EventArgs e)
        {
            ClearInputs(Page.Controls);
        }

        protected void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                ClearInputs(ctrl.Controls);
            }
        }

        protected void buttonSubmit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = @"Data Source=PEPEGA\SQLEXPRESS01;Initial Catalog=Assignment7;Integrated Security=True";
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();


                //get current login user ID
                MembershipUser currentMembership = Membership.GetUser();
                var userId = currentMembership.ProviderUserKey.ToString();


                //get current datetime when form submitted
                DateTime now = DateTime.Now;


                //calculate total price
                string queryPrice = "SELECT Price FROM Flight WHERE FlightID=@flight";
                SqlCommand cmdPrice = new SqlCommand(queryPrice, con);
                cmdPrice.Parameters.AddWithValue("@flight", DropDownListFlight.Text);
                SqlDataReader sdr = cmdPrice.ExecuteReader();
                double price = 0.0;
                if (sdr.Read())
                {
                    price = Convert.ToDouble(sdr["Price"].ToString());
                }
                sdr.Close();


                //store number of passenger category (adult, children, infant)
                string[] category = { txtNumAdult.Text, txtNumChild.Text, txtNumInfant.Text };


                //calculate TotalPrice by getting flight price, rate for each passenger category and passenger number of each category
                double totalPrice = 0.0;
                for (int i = 0; i < category.Length; i++)
                {
                    string queryRate = "SELECT Rate FROM PassengerType WHERE CategoryID=@cat";
                    SqlCommand cmdRate = new SqlCommand(queryRate, con);
                    cmdRate.Parameters.AddWithValue("@cat", Convert.ToInt32("30" + (i + 1)));
                    SqlDataReader sdrRate = cmdRate.ExecuteReader();
                    double rate = 0.0;
                    if (sdrRate.Read())
                    {
                        rate = Convert.ToDouble(sdrRate["Rate"].ToString());
                    }
                    int passengerNo = Convert.ToInt32(category[i]);
                    totalPrice = totalPrice + (passengerNo * (price * rate));

                    sdrRate.Close();
                }


                //TotalPrice set to default 0 in sql server
                //insert Booking details
                string query = "INSERT INTO Booking(FlightID, UserID, FullName, PassportNo, PhoneNo, Email, DateofBooked," +
                    "TotalPrice, PaymentStatus) OUTPUT INSERTED.BookingID VALUES (@getFlight, @getUser, @getName, @getPassport," +
                    "@getPhone, @getEmail, @getDate, @getPrice, @getPayment)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@getFlight", DropDownListFlight.Text);
                cmd.Parameters.AddWithValue("@getUser", userId);
                cmd.Parameters.AddWithValue("@getName", txtName.Text);
                cmd.Parameters.AddWithValue("@getPassport", txtID.Text);
                cmd.Parameters.AddWithValue("@getPhone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@getEmail", txtEmail.Text);
                cmd.Parameters.AddWithValue("@getDate", now);
                cmd.Parameters.AddWithValue("@getPrice", totalPrice);
                cmd.Parameters.AddWithValue("@getPayment", "PENDING");

                int bookingId = Convert.ToInt32(cmd.ExecuteScalar());


                //insert PassengerBooked table
                //to keep track on number of passenger based on category (adult, children, infant)
                for (int a = 0; a < category.Length; a++)
                {
                    string queryCat = "INSERT INTO PassengerBooked(BookingID, CategoryID, TotalPassengerCategory) VALUES (@getBooking, @getCategory, @getTotalPass)";
                    SqlCommand cmdCat = new SqlCommand(queryCat, con);

                    cmdCat.Parameters.AddWithValue("@getBooking", bookingId);
                    cmdCat.Parameters.AddWithValue("@getCategory", Convert.ToInt32("30" + (a + 1)));
                    cmdCat.Parameters.AddWithValue("@getTotalPass", category[a]);
                    cmdCat.ExecuteNonQuery();
                }

                con.Close();

                //display alert success message after the form submitted
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Flight Booking Submitted Successfully')", true);

                //clear all inputs after page submitted to allow new booking take place
                ClearInputs(Page.Controls);
            }

        }
    }
}