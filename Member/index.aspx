<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Assignment7.Member.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Member Homepage - Puchong Airlines</title>
    <style>
        .Center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 600px;
        }

        .bbg {
            background: #efefef;
            margin: 0 auto;
            width: 1000px;
            height: 700px;
        }
    </style>
</asp:Content>
<%--Task 4.1 (c)--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bbg">
        <section id="content">
            <div style="text-align: center">
                <h2 style="font-size: 34px;">Booking History</h2>
            </div>
            <asp:Label ID="lblResults" runat="server" Style="padding-left: 15px" Text=""></asp:Label>
            <div style="text-align: center">
                <%--Member Booking History GirdView--%>
                <asp:GridView ID="GridView1" runat="server" Style="border: 1px solid black" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource1" Width="970px" ForeColor="Black" AllowPaging="True" HorizontalAlign="Center" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ShowHeaderWhenEmpty="True" DataKeyNames="BookingID">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="Booking ID" SortExpression="BookingID" ReadOnly="True" InsertVisible="False" />
                        <asp:BoundField DataField="DateofBooked" HeaderText="Booked Date" SortExpression="DateofBooked" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
                        <asp:BoundField DataField="FlightID" HeaderText="Flight ID" SortExpression="FlightID" ReadOnly="True" />
                        <asp:BoundField DataField="OriginCity" HeaderText="Origin" SortExpression="OriginCity" ReadOnly="True" />
                        <asp:BoundField DataField="DestinationCity" HeaderText="Destination" SortExpression="DestinationCity" ReadOnly="True" />
                        <asp:BoundField DataField="DepartureDate" HeaderText="Departure Date" SortExpression="DepartureDate" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
                        <asp:BoundField DataField="DepartureTime" HeaderText="Departure Time" SortExpression="DepartureTime" DataFormatString="{0:hh\:mm}" ReadOnly="True" />
                        <asp:BoundField DataField="ArrivalDate" HeaderText="Arrival Date" SortExpression="ArrivalDate" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
                        <asp:BoundField DataField="ArrivalTime" HeaderText="Arrival Time" SortExpression="ArrivalTime" DataFormatString="{0:hh\:mm}" ReadOnly="True" />
                        <asp:BoundField DataField="Column1" HeaderText="Total Seat(s)" SortExpression="Column1" ReadOnly="True" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" SortExpression="TotalPrice" DataFormatString="{0:C}" ReadOnly="True" />
                        <asp:BoundField DataField="PaymentStatus" HeaderText="Payment Status" SortExpression="PaymentStatus" ReadOnly="True" />
                    </Columns>
                    <EmptyDataTemplate>
                        No records found.
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PuchongAirlinesConnectionString1 %>" SelectCommand="SELECT Booking.BookingID, Booking.DateofBooked, Booking.FlightID, Flight.OriginCity, Flight.DestinationCity,
Flight.DepartureDate, Flight.DepartureTime, Flight.ArrivalDate, Flight.ArrivalTime, sum(PassengerBooked.TotalPassengerCategory), Booking.TotalPrice, Booking.PaymentStatus FROM Booking INNER JOIN PassengerBooked ON Booking.BookingID = PassengerBooked.BookingID  INNER JOIN Flight ON Booking.FlightID = Flight.FlightID WHERE (Booking.UserId = @getUserID) GROUP BY Booking.DateofBooked, Booking.BookingID, Booking.FlightID, Booking.FlightID, Flight.OriginCity, Flight.DestinationCity, Flight.DepartureDate, Flight.DepartureTime, Flight.ArrivalDate, Flight.ArrivalTime,Booking.TotalPrice, Booking.PaymentStatus ORDER BY Booking.DateOfBooked DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="getUserID" SessionField="UserID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </section>
    </div>
</asp:Content>