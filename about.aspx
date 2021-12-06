<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Assignment7.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About us - Puchong Airlines</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <section id="content">
            <article class="col1">
                <div class="pad_1">
                    <h2>Company Profile</h2>
                    <div class="wrapper">
                        <ul>
                            <li>Founded: July 2, 1969 </li>
                            <li>Stock listed: March 10, 1991</li>
                            <li>Registered capital: RM 110,853,900</li>
                            <li>CEO: Mr. John</li>
                            <li>EMPLOYEES (As of 31 JUL, 2020)
                                <ul>
                                    <li>Total number of employees: 8,549</li>
                                    <li>Employees in Malaysia: 7,056</li>
                                    <li>Employees stationed overseas:  1,493</li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                    <h2>Puchong Airlines History</h2>
                    <p>
                        The history of Puchong Airlines traces back to 50 years. It has grown from small domestic
                    carrier to a global airline, with various routes around the world. Puchong Airline proposed enhancing its
                    route network by connecting all of its existing destinations throughout the region and expanding
                    further into Vietnam, Indonesia, Southern China (Kunming, Xiamen, Shenzhen) and India.
                    </p>
                    <div class="wrapper pad_bot2"><a href="#" class="button2">Read More</a></div>

                    <h2>Awards and Recognition</h2>
                    <p>
                        The 2020 World Airline Awards at the Farnborough Airshow ranked the airline as the world's best low-cost airline.
                        Puchong Airline has been named as the world's best low-cost carrier for 11 years in a row including the latest award for the year 2019.
                    </p>
                    <div class="wrapper pad_bot2"><a href="#" class="button2">Read More</a></div>
                </div>
            </article>
            <article class="col2 pad_left1">
                <div class="wrapper">
                    <table id="abtTable">
                        <caption>
                            <h3>Senior Manager Information</h3>
                        </caption>
                        <tr>
                            <td rowspan="3" colspan="1">
                                <figure>
                                    <img src="/images/person1.jpg" style="width: 76px; height: 96px; border-radius: 50%"><br>
                                    <figcaption>CEO - Mr. John</figcaption>
                                </figure>
                            </td>
                            <td rowspan="1" colspan="1">Responsibilities</td>
                            <td rowspan="1">Follow the decisions of the board of directors, lead the president and other managers, formulate and promote the major decisions.
                                    <br>
                                Follow the decisions and instructions of the board of directors, and preside over the execution and development of the company businesses.
                                    <br>
                                Manage the supervision of corporate development office, passenger sales, passenger marketing, cargo sales, and cargo services
                            </td>
                        </tr>
                        <tr>
                            <td>Education</td>
                            <td>Master in Business , INTI University</td>
                        </tr>
                        <tr>
                            <td>Experiences</td>
                            <td>Chairman, Malaysia Air Cargo Terminal Ltd.
                                    <br>
                                Vice President of Marketing, Puchong Airlines
                                    <br>
                                Director of ASEAN Region and General Manager of ASEAN Branch Office, Puchong Airlines
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="3">
                                <figure>
                                    <img src="images/person2.jpg" style="width: 76px; height: 96px; border-radius: 50%"><br>
                                    <figcaption>C.F.O - Mr. Nolan</figcaption>
                                </figure>
                            </td>
                            <td>Responsibilities</td>
                            <td>Manage the business of various divisions including finance, administration, information management, legal, insurance,
                                    and human resources division.
                            </td>
                        </tr>
                        <tr>
                            <td>Education</td>
                            <td>Master of Laws, Sunway University</td>
                        </tr>
                        <tr>
                            <td>Experiences</td>
                            <td>Chairman, KLIA Service Co., Ltd.
                                    <br>
                                Vice President of Administration, Puchong Airlines
                                    <br>
                                Director, Human Resources Division, Puchong Airlines
                                    <br>
                                Director, System Operation Control Division, Puchong Airlines
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="3">
                                <figure>
                                    <img src="images/person3.jpg" alt="" style="width: 76px; height: 96px; border-radius: 50%"><br>
                                    <figcaption>C.T.O - Mrs. Sarah</figcaption>
                                </figure>
                            </td>
                            <td>Responsibilities</td>
                            <td>Manage the planning, execution and supervision of the flight operations and system operations division.
                                    <br>
                                Assist the president to supervise occupational safety.
                            </td>
                        </tr>
                        <tr>
                            <td>Education</td>
                            <td>Master in Transportation Management, Malaysia National University</td>
                        </tr>
                        <tr>
                            <td>Experiences</td>
                            <td>Director, Deputy Director, Chief Pilot, and Deputy Chief Pilot, Flight Department, Puchong Airlines
                                    <br>
                                Check Pilot, Pilot Teacher, and Pilot In Command, Puchong Airlines
                            </td>
                        </tr>
                    </table>
                </div>
            </article>
        </section>
    </div>
</asp:Content>