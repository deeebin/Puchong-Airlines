<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Assignment7.Admin.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Homepage - Puchong Airlines</title>
    <style>
        /*remove up and down arrow for input number*/
        input[type=number]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            display: none;
        }

        .Center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 700px;
        }

        .bbg {
            background: #efefef;
            margin: 0 auto;
            width: 1000px;
            height: 1850px;
        }

        h2 {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 40%;
        }

        .addFlight {
        }

            .addFlight span {
                width: 150px;
                font-size: 18px;
                margin: 3px;
            }

            .addFlight input {
                width: 450px;
                font-size: 18px;
                margin: 3px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bbg">
        <section id="content">
            <div style="text-align: center">
                <h2 style="font-size: 36px;">Admin Homepage</h2>
            </div>
            <%--flight gridview--%>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="FlightID" DataSourceID="SqlDataSource2" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" HorizontalAlign="Center" RowStyle-BorderStyle="Ridge">
                <Columns>
                    <asp:BoundField DataField="FlightID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="FlightID" />
                    <asp:BoundField DataField="OriginCity" HeaderText="Origin" SortExpression="OriginCity" ReadOnly="True" />
                    <asp:BoundField DataField="DestinationCity" HeaderText="Destination" SortExpression="DestinationCity" ReadOnly="True" />
                    <asp:BoundField DataField="DepartureDate" HeaderText="Departure Date" SortExpression="DepartureDate" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
                    <asp:BoundField DataField="DepartureTime" HeaderText="Departure Time" SortExpression="DepartureTime" DataFormatString="{0:hh\:mm}" ReadOnly="True" />
                    <asp:BoundField DataField="ArrivalDate" HeaderText="Arrival Date" SortExpression="ArrivalDate" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
                    <asp:BoundField DataField="ArrivalTime" HeaderText="Arrival Time" SortExpression="ArrivalTime" DataFormatString="{0:hh\:mm}" ReadOnly="True" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C}" ReadOnly="True" />
                    <asp:BoundField DataField="SeatAvailable" HeaderText="Available Seat" SortExpression="SeatAvailable" ReadOnly="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PuchongAirlinesConnectionString1 %>" SelectCommand="SELECT * FROM [Flight] ORDER BY FlightID DESC"></asp:SqlDataSource>
            <div style="margin-left: 15%">
                <h3 style="font-size: 25px;">Add Flight</h3>
                <div class="addFlight">
                    <asp:Label ID="Label1" runat="server" Width="150px" Text="Origin City: "></asp:Label>
                    <asp:TextBox ID="txtOrigin" runat="server" BorderStyle="Ridge"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Width="150px" Text="Destination City: "></asp:Label>
                    <asp:TextBox ID="txtDestination" runat="server" BorderStyle="Ridge"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Departure Date: " Width="150px"></asp:Label>
                    <asp:TextBox ID="txtDdate" runat="server" BorderStyle="Ridge" TextMode="Date"></asp:TextBox>
                    <%--date TextMode for departure date--%>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Departure Time:" Width="150px"></asp:Label>
                    <asp:TextBox ID="txtDtime" runat="server" BorderStyle="Ridge" TextMode="Time"></asp:TextBox>
                    <%--time TextMode for departure time--%>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Arrival Date: " Width="150px"></asp:Label>
                    <asp:TextBox ID="txtAdate" runat="server" BorderStyle="Ridge" TextMode="Date"></asp:TextBox>
                    <%--date TextMode for arrival date--%>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Arrival Time: " Width="150px"></asp:Label>
                    <asp:TextBox ID="txtAtime" runat="server" BorderStyle="Ridge" TextMode="Time"></asp:TextBox>
                    <%--time TextMode for arrival time--%>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="Seat Available: " Width="150px"></asp:Label>
                    <asp:TextBox ID="txtSeatAvailable" runat="server" BorderStyle="Ridge" TextMode="Number"></asp:TextBox>
                    <%--number TextMode for seat available--%>
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="Price: RM" Width="150px"></asp:Label>
                    <asp:TextBox ID="txtPrice" runat="server" BorderStyle="Ridge" TextMode="Number"></asp:TextBox>
                    <%--date TextMode for price--%>
                    <br />
                    <br />
                </div>
                <div style="width: 615px">
                    <asp:Button ID="btnSubmit" runat="server" Text="Add" Style="border-style: Ridge; float: right; font-size: 18px; background-color: black; color: white; width: 80px;" OnClick="btnSubmit_Click" />
                </div>
                <br />
                <br />
                <asp:Label ID="lblResults" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
            <h3 style="margin-left: 26px; font-size: 25px; text-align: center; padding-top: 40px;">Member's Flight Ticket(s) Booking</h3>
            <%--Task 4.1 (d）--%> <%--Admin can update member booking payment status or delete member booking details --%>
            <asp:GridView ID="MemberBookingGridView" runat="server" Style="border: 1px solid black" AllowPaging="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" Width="950px" ShowHeaderWhenEmpty="True" OnRowEditing="MemberBookingGridView_RowEditing" OnRowUpdating="MemberBookingGridView_RowUpdating" OnPageIndexChanging="MemberBookingGridView_PageIndexChanging" OnRowCancelingEdit="MemberBookingGridView_RowCancelingEdit" OnRowDeleting="MemberBookingGridView_RowDeleting" HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Left" CellSpacing="2">
                <AlternatingRowStyle HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField HeaderText="Booking ID" SortExpression="BookingID">
                        <EditItemTemplate>
                            <asp:Label ID="lblBookingID" runat="server" Text='<%# Eval("BookingID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBookingID" runat="server" Text='<%# Bind("BookingID") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="100%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" ReadOnly="True" ControlStyle-Width="100%">
                        <ControlStyle Width="100%"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="FlightID" HeaderText="Flight ID" SortExpression="FlightID" ReadOnly="True" ControlStyle-Width="100%">
                        <ControlStyle Width="100%"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="DateofBooked" HeaderText="Booked Date" SortExpression="DateofBooked" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}" ApplyFormatInEditMode="True" ControlStyle-Width="100%">
                        <ControlStyle Width="100%"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" ReadOnly="True" ApplyFormatInEditMode="True" ControlStyle-Width="100%">
                        <ControlStyle Width="100%"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PhoneNo" HeaderText="Phone No" SortExpression="PhoneNo" ReadOnly="True" ApplyFormatInEditMode="True" ControlStyle-Width="100%">
                        <ControlStyle Width="100%"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="True" ApplyFormatInEditMode="True" ControlStyle-Width="100%">
                        <ControlStyle Width="100%"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Column1" HeaderText="Total Seat" SortExpression="Column1" ReadOnly="True" ApplyFormatInEditMode="True" ControlStyle-Width="100%" ItemStyle-HorizontalAlign="Center">
                        <ControlStyle Width="100%"></ControlStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" SortExpression="TotalPrice" DataFormatString="{0:C}" ReadOnly="True" ApplyFormatInEditMode="True" ControlStyle-Width="100%" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ControlStyle Width="100%"></ControlStyle>
                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Payment Status" SortExpression="PaymentStatus" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:DropDownList ID="PaymentStatus" runat="server" CssClass="cen3" SelectedValue='<%# Bind("PaymentStatus") %>'>
                                <asp:ListItem>PENDING</asp:ListItem>
                                <asp:ListItem>CANCELLED</asp:ListItem>
                                <asp:ListItem>PAID</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPaymentStatus" runat="server" Text='<%# Bind("PaymentStatus") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="100%" />
                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:TemplateField>
                    <%--Edit Button to update payment status--%>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" HeaderText="Action" ControlStyle-BorderStyle="Ridge" />
                    <%--Delete Button to delete booking details--%>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-BorderStyle="Ridge">
                        <ItemStyle Wrap="False" />
                    </asp:CommandField>
                </Columns>
                <EmptyDataTemplate>
                    No records found.
                </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle HorizontalAlign="Center" BackColor="White" BorderColor="Black" BorderStyle="Ridge" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </section>
        <%--Create roles & assign admin role--%>
        <div style="padding: 20px; border: solid; margin: 80px; background: whitesmoke;">
            <div class="Center">
                <section class="content">
                    <h3 style="margin: 0px; font-size: 25px; text-align: center;">Create & Assign Role</h3>
                    <table>
                        <tr>
                            <td style="padding-right: 120px; padding-left: 25px; text-align: center;">
                                <h2 style="width: 100%">Create a New Role</h2>
                                <asp:TextBox ID="RoleName" runat="server" BorderStyle="Ridge" Height="20px" Width="200px" Style="border: 1px solid black;"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="" ForeColor="Red"></asp:Label>
                                <div style="padding-top: 10px; padding-left: 105px;">
                                    <asp:Button ID="Button1" runat="server" Text="Create Role" OnClick="CreateRoleBtn" Style="background-color: black; color: white;" Font-Size="Medium" BorderStyle="Ridge" ForeColor="Black" />
                                </div>
                            </td>
                            <td style="text-align: center;">
                                <h2 style="width: 100%">Assign User For Admin Role</h2>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="UserName" BorderStyle="Ridge" Height="25px" Width="200px" Style="border: 1px solid black"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PuchongAirlinesConnectionString1 %>" SelectCommand="SELECT [UserName] FROM [Users]"></asp:SqlDataSource>
                                <br />
                                <asp:Label ID="lblResults2" runat="server" Text="" ForeColor="Red"></asp:Label>
                                <div style="padding-top: 10px; padding-left: 140px;">
                                    <asp:Button ID="Button2" runat="server" Text="Assign" OnClick="AssignAdminRolebtn" Font-Size="Medium" Style="background-color: black; color: white;" BorderStyle="Ridge" ForeColor="Black" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </section>
            </div>
        </div>
    </div>
</asp:Content>