<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="purchase.aspx.cs" Inherits="Assignment7.Member.purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Member Purchase - Puchong Airlines</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--include jQuery library from CDN-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!--include jQuery UI from CDN-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
            height: 1650px;
        }

        h2 {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 40%;
        }

        .button1 {
            margin-top: 65px;
        }

        #BookingForm {
        }

            #BookingForm a {
                margin-top: 10px
            }

            #BookingForm .bg {
                position: relative;
                float: right;
                border-radius: 3px;
                border-left: 1px solid #c6c6c6;
                border-top: 1px solid #c6c6c6;
                margin-bottom: 15px;
            }

            #BookingForm .pt {
                position: relative;
                background: #f8f8f8;
                border-radius: 3px;
                border-left: 1px solid #c6c6c6;
                border-top: 1px solid #c6c6c6;
                margin-bottom: 15px;
                display: inline;
                margin-right: 8px;
                margin-left: 5px;
            }

            #BookingForm .rb {
                float: right;
                width: 50%;
                margin-right: 30%;
                margin-bottom: 10px;
            }

            #BookingForm .dd {
                padding: 2px 15px;
                height: 25px;
                width: 440px;
            }

            #BookingForm .input {
                color: black;
                padding: 2px 15px;
                height: 25px;
                width: 410px;
            }

            #BookingForm .input3 {
                padding: 2px 10px;
                height: 22px;
                width: 81px;
            }

        .errorMessage {
            color: red;
            position: absolute;
            display: block;
            margin-left: 110px;
            margin-top: 14px;
        }

        .wrapper {
            margin-bottom: 8px;
        }

        #feedback {
            font-size: 1.4em;
            text-align: left;
            float: left;
            margin-left: 80px;
            width: 400px;
        }

        #selectable .ui-selecting {
            background: yellow;
        }

        #selectable .ui-selected {
            background: #F39814;
            color: white;
        }

        #selectable {
            max-width: 400px;
            margin: auto;
        }

            #selectable td {
                margin: 3px;
                padding: 0.4em;
                font-size: 1.4em;
                height: 18px;
            }

        #seatTitle {
            margin-top: 0;
            text-align: center;
        }

        .seat table {
            border-radius: 5px;
            empty-cells: hide;
            border: solid;
            border-spacing: 2px;
        }

            .seat table td {
                padding: 10px;
                border-radius: 5px;
                text-align: center;
                border: solid;
                border-collapse: collapse;
            }

        .err {
            position: absolute;
            margin-left: -170px;
            margin-top: -20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bbg">
        <div style="text-align: center">
            <section id="content">
                <h2 style="font-size: 34px;">Purchase Flight Ticket(s)</h2>
                <h2>Available Flights </h2>
            </section>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="FlightID" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" HorizontalAlign="Center">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PuchongAirlinesConnectionString1 %>" SelectCommand="SELECT * FROM [Flight] ORDER BY FlightID DESC"></asp:SqlDataSource>
        <div class="Center">
            <section class="content">
                <article class="col2">
                    <h2>Book Flight Ticket</h2>
                    <div id="BookingForm">
                        <div class="wrapper">
                            <!--name input-->
                            <div class="wrapper">
                                <asp:Label ID="nameLabel" runat="server" Text="Full Name: "></asp:Label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="bg input" Placeholder="e.g. Jayden Lee" BorderStyle="Groove" BorderWidth="1px"></asp:TextBox>
                                <!--required validator to check the name input is empty-->
                                <asp:RequiredFieldValidator ID="err_name" runat="server" CssClass="errorMessage" ControlToValidate="txtName" ErrorMessage="Please enter your name" ForeColor="Red" Text=""></asp:RequiredFieldValidator>
                                <!--regular expression validator to check if name input format is valid-->
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" CssClass="errorMessage" ControlToValidate="txtName" ValidationExpression="^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$" runat="server" ErrorMessage="Please enter appropriate full name"></asp:RegularExpressionValidator>
                            </div>

                            <!--id number-->
                            <div class="wrapper">
                                <asp:Label ID="labelID" runat="server" Text="Passport No.: " />
                                <asp:TextBox ID="txtID" runat="server" CssClass="bg input" Placeholder="e.g. A12345678" ToolTip="Please enter your passport number without spaces or symbols" BorderStyle="Groove" BorderWidth="1px"></asp:TextBox>
                                <!--required validator to check if passport number input is empty-->
                                <asp:RequiredFieldValidator ID="err_id" runat="server" CssClass="errorMessage" ControlToValidate="txtID" ErrorMessage="Please enter your passport no." ForeColor="Red" Text=""></asp:RequiredFieldValidator>
                                <!--regular expression to check if passport number format is valid-->
                                <asp:RegularExpressionValidator CssClass="errorMessage" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtID" ValidationExpression="[A-Z]{1}[0-9]{8}" ErrorMessage="Please enter the correct passport number format"></asp:RegularExpressionValidator>
                            </div>

                            <!--phone input-->
                            <div class="wrapper">
                                <asp:Label ID="labelPhone" runat="server" Text="Phone Number: "></asp:Label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="bg input" Placeholder="e.g. +6012-3456789" BorderStyle="Groove" BorderWidth="1px"></asp:TextBox>
                                <!--required validator to check if phone input is empty-->
                                <asp:RequiredFieldValidator ID="err_phone" runat="server" CssClass="errorMessage" ControlToValidate="txtPhone" ErrorMessage="Please enter your phone number" ForeColor="Red" Text=""></asp:RequiredFieldValidator>
                                <!--regular expression validator to check if phone format is correct-->
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="errorMessage" ControlToValidate="txtPhone" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" runat="server" ErrorMessage="Please enter the correct Malaysia phone number format"></asp:RegularExpressionValidator>
                            </div>

                            <!--email-->
                            <div class="wrapper">
                                <asp:Label ID="labelEmail" runat="server" Text="E-mail: "></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="bg input" Placeholder="e.g. myname@example.com" BorderStyle="Groove" BorderWidth="1"></asp:TextBox>
                                <!--required validator to make sure email input is not empty-->
                                <asp:RequiredFieldValidator ID="err_email" runat="server" CssClass="errorMessage" ControlToValidate="txtEmail" ErrorMessage="Please enter your email" ForeColor="Red" Text=""></asp:RequiredFieldValidator>
                                <!--regular expression to check the email format of input before submit-->
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="errorMessage" runat="server" ControlToValidate="txtEmail" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ErrorMessage="Please enter the correct email format"></asp:RegularExpressionValidator>
                            </div>

                            <!--flight-->
                            <div class="wrapper">
                                <asp:Label ID="labelDropdownFlight" runat="server" Text="Flight ID: "></asp:Label>
                                <asp:DropDownList ID="DropDownListFlight" runat="server" CssClass="dd bg" DataSourceID="SqlDataSource1" DataTextField="FlightID" DataValueField="FlightID">
                                    <asp:ListItem>Select Flight</asp:ListItem>
                                </asp:DropDownList>
                                <!--data for flight is display to allow user to select database flight ID directly-->
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PuchongAirlinesConnectionString1 %>" SelectCommand="SELECT [FlightID] FROM [Flight]"></asp:SqlDataSource>
                                <!--required validator to check if non-default dropdown is selected-->
                                <asp:RequiredFieldValidator ID="err_dropdownFlight" runat="server" ErrorMessage="Please select flight ID" ControlToValidate="DropDownListFlight" CssClass="errorMessage" InitialValue="Select Flight" Text=""></asp:RequiredFieldValidator>
                            </div>

                            <!--number of passenger-->
                            <h3>Passenger(s)</h3>
                            <div class="wrapper" style="padding: 10px 0 10px 0">
                                <asp:Label ID="labelAdult" runat="server" Text="Adult(s):"></asp:Label>
                                <asp:TextBox ID="txtNumAdult" type="number" runat="server" CssClass="input3 pt" value="0" ToolTip="Please enter your adult number without spaces or symbols" BorderWidth="1px"></asp:TextBox>
                                <!--Range validator to check the adult input value to be at range of 0 to 20-->
                                <asp:RangeValidator ID="RangeValidatorAdult" CssClass="err" ControlToValidate="txtNumAdult" runat="server" ForeColor="Red" ErrorMessage="The adult range(0 to 20)" MinimumValue="0" MaximumValue="20" Type="Integer"></asp:RangeValidator>

                                <asp:Label ID="labelChild" runat="server" Text="Children(s):"></asp:Label>
                                <asp:TextBox ID="txtNumChild" type="number" runat="server" CssClass="input3 pt" value="0" ToolTip="Please enter your child number without spaces or symbols" BorderWidth="1px"></asp:TextBox>
                                <!--Range validator to check the child input value to be at range of 0 to 20-->
                                <asp:RangeValidator ID="RangeValidatorChild" CssClass="err" ControlToValidate="txtNumChild" runat="server" ForeColor="Red" ErrorMessage="The child range(0 to 20)" MinimumValue="0" MaximumValue="20" Type="Integer"></asp:RangeValidator>

                                <asp:Label ID="labelInfant" runat="server" Text="Infant(s):"></asp:Label>
                                <asp:TextBox ID="txtNumInfant" type="number" runat="server" CssClass="input3 pt" value="0" ToolTip="Please enter your infant number without spaces or symbols" BorderWidth="1px"></asp:TextBox>
                                <!--Range validator to check the infant input value to be at range of 0 to 20-->
                                <asp:RangeValidator ID="RangeValidatorInfant" CssClass="err" ControlToValidate="txtNumInfant" runat="server" ForeColor="Red" ErrorMessage="The infant range(0 to 20)" MinimumValue="0" MaximumValue="20" Type="Integer"></asp:RangeValidator>

                                <br />
                                <!--custom validator to check if total number of passenger (adult, child, infant) is not 0-->
                                <asp:CustomValidator runat="server" Display="Dynamic" ID="customValidator1" ForeColor="Red" ClientValidationFunction="validPassenger" ErrorMessage="Please enter one or more passenger(s)"></asp:CustomValidator>
                            </div>

                            <h3 id="seatTitle">Select Your Preferred Seat</h3>
                            <!--Seat table to allow user to select seat by using jquery selectable using serialize-->
                            <div class="seat">
                                <table id="selectable">
                                    <tbody>
                                        <tr>
                                            <td>A1</td>
                                            <td>B1</td>
                                            <td></td>
                                            <td>C1</td>
                                            <td>D1</td>
                                            <td></td>
                                            <td>E1</td>
                                            <td>F1</td>
                                        </tr>
                                        <tr>
                                            <td>A2</td>
                                            <td>B2</td>
                                            <td></td>
                                            <td>C2</td>
                                            <td>D2</td>
                                            <td></td>
                                            <td>E2</td>
                                            <td>F2</td>
                                        </tr>
                                        <tr>
                                            <td>A3</td>
                                            <td>B3</td>
                                            <td></td>
                                            <td>C3</td>
                                            <td>D3</td>
                                            <td></td>
                                            <td>E3</td>
                                            <td>F3</td>
                                        </tr>
                                        <tr>
                                            <td>A4</td>
                                            <td>B4</td>
                                            <td></td>
                                            <td>C4</td>
                                            <td>D4</td>
                                            <td></td>
                                            <td>E4</td>
                                            <td>F4</td>
                                        </tr>
                                        <tr>
                                            <td>A5</td>
                                            <td>B5</td>
                                            <td></td>
                                            <td>C5</td>
                                            <td>D5</td>
                                            <td></td>
                                            <td>E5</td>
                                            <td>F5</td>
                                        </tr>
                                        <tr>
                                            <td>A6</td>
                                            <td>B6</td>
                                            <td></td>
                                            <td>C6</td>
                                            <td>D6</td>
                                            <td></td>
                                            <td>E6</td>
                                            <td>F6</td>
                                        </tr>
                                        <tr>
                                            <td>A7</td>
                                            <td>B7</td>
                                            <td></td>
                                            <td>C7</td>
                                            <td>D7</td>
                                            <td></td>
                                            <td>E7</td>
                                            <td>F7</td>
                                        </tr>
                                        <tr>
                                            <td>A8</td>
                                            <td>B8</td>
                                            <td></td>
                                            <td>C8</td>
                                            <td>D8</td>
                                            <td></td>
                                            <td>E8</td>
                                            <td>F8</td>
                                        </tr>
                                        <tr>
                                            <td>A9</td>
                                            <td>B9</td>
                                            <td></td>
                                            <td>C9</td>
                                            <td>D9</td>
                                            <td></td>
                                            <td>E9</td>
                                            <td>F9</td>
                                        </tr>
                                        <tr>
                                            <td>A10</td>
                                            <td>B10</td>
                                            <td></td>
                                            <td>C10</td>
                                            <td>D10</td>
                                            <td></td>
                                            <td>E10</td>
                                            <td>F10</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="feedback">
                                <span>Your preferred seat: </span>
                                <asp:Label ID="selectResult" runat="server" Text="-"></asp:Label>
                                <br />
                                <span>Total seat: </span>
                                <asp:Label ID="totalTicket" runat="server" Text="0"></asp:Label>
                            </div>
                            <br />
                            <br />

                            <!--custom validator to compare number of passenger entered and total seat selected-->
                            <asp:CustomValidator runat="server" Display="Dynamic" ID="customValidator2" ForeColor="Red" ClientValidationFunction="compareSeat" ErrorMessage="Invalid selected ticket number with total passenger" Style="margin-left: 80px; font-size: 17px;"></asp:CustomValidator>

                            <!--submit and reset button-->
                            <div class="wrapper">
                                <asp:Button ID="buttonSubmit" runat="server" Text="Submit" CssClass="button1" OnClick="buttonSubmit_Click" />
                                <asp:Button ID="buttonReset" runat="server" Text="Reset" CssClass="button1" CausesValidation="false" OnClick="buttonReset_Click" />
                            </div>
                        </div>
                    </div>
                </article>
            </section>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            // jQuery UI Selectable (using Serialize)
            $("#selectable").selectable({
                //can only trigger on table td columns
                filter: "td",
                stop: function () {
                    //set label text to empty
                    var result = $('#<%=selectResult.ClientID%>').empty();
                    var total = $('#<%=totalTicket.ClientID%>').empty();
                    var selected = 0;
                    //serialize each selected seat
                    $(".ui-selected", this).each(function () {
                        //display seat name to label ID selectResult
                        result.append($(this).text() + " ");
                        //get the total selected seat number
                        if ($(this).text() != "") {
                            selected++;
                        }
                    });
                    //append and display to label ID totalTicket
                    total.append(selected);
                }
            });

            //sortable jquery
            $("#sortable2").sortable({
                items: "li:not(.ui-state-disabled)"
            });
            $("#sortable1").sortable({
                connectWith: "ul"
            });
            $("#sortable1, #sortable2").disableSelection();
        });

        //perform customise function to validate if total number of passenger is 0, if 0, prompt error to user to enter passenger number
        //if args.IsValid=false, the customvalidator will display error message to user
        function validPassenger(sender, args) {

            var total = getTotalPassenger();

            if (total <= 0) {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }

        //calculate total number of passenger for adult, child and infant
        function getTotalPassenger() {
            var a = document.getElementById('<%=txtNumAdult.ClientID%>').value;
            var c = document.getElementById('<%=txtNumChild.ClientID%>').value;
            var i = document.getElementById('<%=txtNumInfant.ClientID%>').value;

            var total = parseInt(a) + parseInt(c) + parseInt(i);

            return total;
        }

        //this custom function will be added into custom validator to display error message if total number of passenger entered is different from the total seat selected
        function compareSeat(sender, args) {
            var total = getTotalPassenger();
            var ticket = document.getElementById('<%=totalTicket.ClientID%>').innerText;
            if (total != ticket) {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
    </script>
</asp:Content>