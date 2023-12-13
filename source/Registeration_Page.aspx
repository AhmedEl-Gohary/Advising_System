<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration_Page.aspx.cs" Inherits="source.Registeration_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="RegisterLabel" runat="server" Text="Register as: "></asp:Label>
            <asp:DropDownList ID="list" runat="server" Width="250px">
            <asp:ListItem Enabled="true" Text="Select Your Role" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Student" Value="1"></asp:ListItem>
            <asp:ListItem Text="Advisor" Value="2"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="RegisterButton" runat="server" OnClick="Register" Text="Register" />
            <br />
            <br />

            <asp:Label ID="goToLogin" runat="server" Text="already have an email?"></asp:Label>
            &nbsp;<asp:LinkButton ID="LinkButton1" OnClick="Login" runat="server">here</asp:LinkButton>
            <br />
        </div>
    </form>
</body>
</html>
