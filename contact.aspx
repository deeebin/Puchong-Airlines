<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Assignment7.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact us - Puchong Airlines</title>
    <style>
        input[type=text]:enabled {
            background: #a3a3a3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <section id="content">
            <article class="col1">
                <div class="pad_1">
                    <h2>Contact us</h2>
                    <h4>Region: Asia Pacific<br>
                        Telephone: +60 3649 1324<br>
                        Email:ascs@puchongairlines.com<br>
                        <br>
                        Region: Americas<br>
                        Telephone: +1 649 233 5778
                        <br>
                        Email:amcs@puchongairlines.com<br>
                        <br>
                        Region: Europe
                        <br>
                        Telephone: +355 132 436 792<br>
                        Email:eucs@puchongairlines.com<br>
                        <br>
                        Region: Middle East/Africa
                        <br>
                        Telephone: +289 230 0110<br>
                        Email:meacs@puchongairlines.com<br>
                    </h4>
                    <h2>Contact us</h2>
                    <p>
                        Our call centre operates 24/7 all around the world. If you want to make a reservation, simply inform us of the  destination and date
                        of the trip and provide us with your full name, nationality and phone number and we will give you the complete reservation information.
                    </p>
                </div>
            </article>
            <article class="col2 pad_left1">
                <h2>Contact Form</h2>
                <div id="ContactForm">
                    <div class="wrapper">
                        <div class="bg">
                            <input type="text" class="input" /></div>
                        Your Full Name:<br />
                    </div>
                    <div class="wrapper">
                        <div class="bg">
                            <input type="text" class="input" /></div>
                        Your E-mail:<br />
                    </div>
                    <div class="wrapper">
                        <div class="bg">
                            <textarea name="textarea" cols="1" rows="1"></textarea>
                        </div>
                        Your Message:<br />
                    </div>
                    <a href="#" class="button1">submit</a>
                </div>
            </article>
        </section>
    </div>
</asp:Content>