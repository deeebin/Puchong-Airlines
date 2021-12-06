<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="Assignment7.adminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Login - Puchong Airlines</title>
    <style>
        table {
            position: relative;
            left: 120px;
            padding-top: 25px;
        }

        th {
            font-size: 30px;
            text-align: center;
            height: 70px;
        }

        td {
            font-size: 15px;
            text-align: right;
            height: 45px;
        }

        .col1 {
            width: 1000px;
        }

        #content {
            height: 455px;
        }
        .auto-style1 {
            height: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <section id="content">
            <article class="col1">
                <asp:LoginView ID="LoginView1" runat="server">
                    <AnonymousTemplate> <%--if the user is not login (Anonymouse/Vistor)--%>
                        <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn">
                            <LayoutTemplate>
                                <table style="border-collapse: collapse;">
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <th style="text-align: center" colspan="2">Admin Login</th>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server" Width="200px" Height="30px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" ForeColor="Red" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center" class="auto-style1">
                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                    </td>
                                                    <td class="auto-style1">
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="200px" Height="30px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" ForeColor="Red" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left" colspan="2">
                                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; color: Red; height: 0px; font-size:12px" colspan="2">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;" colspan="2">
                                                        <asp:Button ID="LoginButton" runat="server" Width="150px" Height="30px" CommandName="Login" Text="Log In" ValidationGroup="Login1" BackColor="#666666" BorderColor="Black" ForeColor="White" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                            </LayoutTemplate>
                        </asp:Login>
                    </AnonymousTemplate>
                    <RoleGroups>
                        <asp:RoleGroup Roles="Admin"> <%--the below content is available to view for the user that logged in role as "Admin"--%>
                            <ContentTemplate> <%--display for user role "Admin" that he/she is logged in --%>
                                <div style="text-align: center">
                                    <h2 style="padding-top: 100px;">You are already logged in.</h2>
                                    <asp:Button runat="server" Text="Back to Home" Font-Size="Medium" Height="30px" Width="120px" BorderStyle="Solid" ForeColor="Black" PostBackUrl="~/index.aspx" />
                                </div>
                            </ContentTemplate>
                        </asp:RoleGroup>
                        <asp:RoleGroup Roles="Member"> <%--the below content is available to view for the user that logged in role as "Member"--%>
                            <ContentTemplate> <%--display "Admin" login control for user role "Member" because he/she is logged in as "Member"--%>
                        <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn">
                            <LayoutTemplate>
                                <table style="border-collapse: collapse;">
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <th style="text-align: center" colspan="2">Admin Login</th>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server" Width="200px" Height="30px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" ForeColor="Red" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="200px" Height="30px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" ForeColor="Red" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left" colspan="2">
                                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; color: Red; height: 0px" colspan="2">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;" colspan="2">
                                                        <asp:Button ID="LoginButton" runat="server" Width="150px" Height="30px" CommandName="Login" Text="Log In" ValidationGroup="Login1" BackColor="#666666" BorderColor="Black" ForeColor="White" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                            </LayoutTemplate>
                        </asp:Login>
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
            </article>
        </section>
    </div>
</asp:Content>