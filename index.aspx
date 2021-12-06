<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Assignment7.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home - Puchong Airlines</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <section id="content">
            <article class="col1">
                <div class="pad_1">
                    <h2>Flight Planner</h2>
                    <div id="form_1">
                        <div class="wrapper pad_bot1">
                            <div class="radio ">
                                <input type="radio" name="triptype">One Way
                            </div>
                            <div class="radio">
                                <input type="radio" name="triptype">Round Trip
                            </div>
                        </div>
                        <div class="wrapper">
                            From:
                            <div class="bg">
                                <input type="text" class="input" value="City, Airport" onfocus="if(this.value =='City, Airport' ) this.value=''"
                                    onblur="if(this.value=='') this.value='City, Airport'">
                            </div>
                        </div>
                        <div class="wrapper">
                            To:
                            <div class="bg">
                                <input type="text" class="input" value="City, Airport" onfocus="if(this.value =='City, Airport' ) this.value=''"
                                    onblur="if(this.value=='') this.value='City, Airport'">
                            </div>
                        </div>
                        <div class="wrapper">
                            Departure:
                            <div class="wrapper">
                                <div class="bg">
                                    <input type="date" class="input"></div>
                                <div class="bg">
                                    <input type="time" class="input"></div>
                            </div>
                        </div>
                        <div class="wrapper">
                            Return:
                            <div class="wrapper">
                                <div class="bg">
                                    <input type="date" class="input"></div>
                                <div class="bg">
                                    <input type="time" class="input"></div>
                            </div>
                        </div>
                        <div class="wrapper">
                            <p>Guest(s):</p>
                            <div class="bg left">
                                <input type="number" class="input input2" min="1" max="20"></div>
                            <a href="#" class="button2">find</a>
                        </div>
                    </div>
                    <h2>News and Offers</h2>
                    <p class="under"><a href="#" class="link1">How to use your travel credits</a><br>
                        19 August 2020</p>
                    <p class="under"><a href="#" class="link1">How PAL Adjusts Post-Quarantine Services</a><br>
                        5 August 2020</p>
                    <p><a href="#" class="link1">Lucky Winners of Puchong Airlines Customer Satisfaction Survey (2020-07)</a><br>
                        3 August 2020</p>
                </div>
            </article>
            <article class="col2 pad_left1">
                <h2>Welcome back to Puchong Airlines!</h2>
                <div class="wrapper">
                    <h3 class="pad_bot2">Flying safe with Puchong Airlines</h3>
                    <p class="pad_bot2">
                        Travelling in the near future will be a little different than we know it and we aim to make your travels as worry-free as possible.
                        From contactless check-in to maintaining the highest level of hygiene in our cabin and how we handle our inflight food, find out all about it by clicking on the button below.
                    </p>
                    <!--source: https://www.airasia.com/aa/covid-19/en/gb/inthistogether.html-->
                </div>
                <div class="wrapper pad_bot2"><a href="http://cccovid19.mot.gov.my/" target="_blank" class="button1">Read More</a></div>
                <div class="wrapper">
                    <h3 class="pad_bot2">Here to give you flexibility</h3>
                    <p class="pad_bot2">
                        Our hearts are with those who’ve been affected by COVID-19. In times like these, we want you to know that we are doing everything to ensure your safety,
                        and to provide maximum flexibility for our guests.
                        <br />
                        We are offering two options to change your flights:
                    </p>
                    <!--source: https://www.airasia.com/aa/covid-19/en/gb/inthistogether.html-->
                    <ol>
                        <li>Convert your flights to credits and book a new one</li>
                        <li>Get Unlimited Date Change with no flight-change fee until 31 December 2020</li>
                    </ol>
                </div>
                <div class="wrapper pad_bot2">
                    <a href="#" class="button1">Find out more</a>
                </div>
                <div class="wrapper">
                    <article class="cols">
                        <h2>Book anytime using our mobile app
                        </h2>
                        <p>
                            Your all favorite destinations are now at your fingertips!
                            PA's awesome mobile app lets you to search and book instantly for the flights all around the world. The PA's
                            mobile app makes it easier for you to manage your booking and pre-book baggage, seats, meals and travel insurance. You can
                            also check-in while on the go!
                        </p>
                    </article>
                    <div class="box1">
                        <div class="pad_1">
                            <div class="wrapper">
                                <p class="pad_bot2">At Puchong Airlines, we promise that you will experience a safe, hassle free, and thoroughly enjoyable flight at a great value. </p>
                                <p><span class="right">Mr. Pepe Ga - Ceo of Puchong Airlines</span>&nbsp;<br>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </section>
    </div>
</asp:Content>