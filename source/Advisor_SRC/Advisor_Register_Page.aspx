<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_Register_Page.aspx.cs" Inherits="source.Advisor_SRC.Advisor_Register_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
                <div>
            <asp:Label ID="welcomeLabel" runat="server" Text="Welcome New Advisor!"></asp:Label>
            <br />
            <br />
            <asp:Label ID="fillInLabel" runat="server" Text="Please fill the required information"></asp:Label>
            <br />
            <br />
            <asp:Label ID="nameLabel" runat="server" Text="Name"></asp:Label>
            <br />
            <asp:TextBox ID="name" runat="server" Width="124px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="officeLabel" runat="server" Text="Office"></asp:Label>
            <br />
            <asp:TextBox ID="office" runat="server" Width="124px"></asp:TextBox>
            <br />
            <br />            
            <asp:Label ID="emailLabel" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="passwordLabel" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="registerButton" OnClick="Register" runat="server" Text="Register" />
            <br />
            <br />
            <asp:Label ID="goToLogin" runat="server" Text="already have an email?"></asp:Label>
&nbsp;<asp:LinkButton ID="LinkButton1" OnClick="Login" runat="server">here</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="registerSuccesslabel" runat="server" Text=" "></asp:Label>
&nbsp;
            <br />
        </div>
    </form>
</body>
</html>
