<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="signUp.aspx.cs" Inherits="Assignment7.signUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sign Up - Puchong Airlines</title>
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }

        table {
            position: relative;
            left: 20px;
        }

        th {
            font-size: 20px;
            text-align: center;
            height: 55px;
        }

        td {
            font-size: 15px;
            text-align: right;
        }

        .auto-style2 {
            height: 21px;
        }

        #content {
            height: 455px;
        }

        .signUpCompleteTable {
            padding-left: 100px;
            padding-top: 20px;
        }

            .signUpCompleteTable table {
            }

            .signUpCompleteTable th {
                font-size: 20px;
                text-align: center;
                height: 70px;
            }

            .signUpCompleteTable td {
                font-size: 15px;
                text-align: center;
                padding: 5px;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <section id="content">
            <article class="col1">
                <div class="pad_1">
                    <h2>Sign Up Rules</h2>
                    <ul>
                        <li>User Name must be unique</li>
                        <li>Password must match</li>
                        <li>All inputs are required to fill up</li>
                        <li>Password must contains at least 6 characters</li>
                        <li>Password is case-sensitive</li>
                    </ul>
                    <br />
                    <b>For any problems, please contact:
                        <br />
                        +012-3456789
                        <br />
                        (Puchong 24-Hours Hotline)
                    </b>
                </div>
            </article>
            <h2 class="col2 pad_left1">Sign Up</h2>
            <br />
            <asp:LoginView ID="LoginView1" runat="server">
                <AnonymousTemplate>
                    <%--sign up form--%>
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" ContinueDestinationPageUrl="~/Member/index.aspx">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <th colspan="2">Sign Up for Your New Account</th>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            </td>
                                            <td class="auto-style1">
                                                <asp:TextBox ID="UserName" runat="server" BorderStyle="Ridge" Height="20px" Width="300px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td class="auto-style1">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" BorderStyle="Ridge" Height="20px" Width="300px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" BorderStyle="Ridge" Height="20px" Width="300px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Email:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Email" runat="server" BorderStyle="Ridge" Height="20px" Width="300px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Email is required." ToolTip="Email is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center" colspan="2" class="auto-style2">
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ForeColor="Red" ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center; color: Red;" colspan="2">
                                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <CustomNavigationTemplate>
                                    <table border="0" style="width: 100%; height: 100%;">
                                        <tr style="text-align: right">
                                            <td style="text-align: right">
                                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Create Account" ValidationGroup="CreateUserWizard1" Font-Size="Medium" Height="30px" Width="150px" BorderStyle="Solid" ForeColor="Black" OnClientClick="SignUpbtn" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                </CustomNavigationTemplate>
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                                <ContentTemplate>
                                    <table class="signUpCompleteTable">
                                        <tr>
                                            <td>Complete</td>
                                        </tr>
                                        <tr>
                                            <td>Your account has been successfully created.</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" Font-Size="Medium" Height="30px" Width="100px" BorderStyle="Solid" ForeColor="Black" PostBackUrl="~/index.aspx" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </AnonymousTemplate>
                <LoggedInTemplate>
                    <h3 class="col2 pad_left1">You already created an account.</h3>
                </LoggedInTemplate>
            </asp:LoginView>
        </section>
    </div>
</asp:Content>