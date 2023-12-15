<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Register_Page.aspx.cs" Inherits="source.Student_SRC.Student_Register_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <asp:Label ID="Label1" runat="server" Text="Welcome New Advising Student!"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Please fill the required information"></asp:Label>
            <br />
            <br />
            <asp:Label ID="fnameLabel" runat="server" Text="First Name"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label>
            <br />
            <asp:TextBox ID="fname" runat="server" Width="107px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="lname" runat="server" Width="124px"></asp:TextBox>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label5" runat="server" Text="Faculty"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="Label10" runat="server" Text="Major"></asp:Label>
            <br />
            <asp:TextBox ID="faculty" runat="server" Width="103px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="major" runat="server" Width="128px"></asp:TextBox>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label6" runat="server" Text="Current Semester"></asp:Label>
            <br />
            <asp:TextBox ID="semester" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="register" OnClick="Register" runat="server" Text="register" />
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
