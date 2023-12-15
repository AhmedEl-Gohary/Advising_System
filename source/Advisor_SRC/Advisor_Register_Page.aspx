<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_Register_Page.aspx.cs" Inherits="source.Advisor_SRC.Advisor_Register_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advisor Registration Page</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #e0e8e4, #c4d7d2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #form1 {
            background: linear-gradient(to right, #ffffff, #f5f2f0);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        #welcomeLabel {
            color: #4b272d;
            font-size: 32px;
            font-weight: normal;
            margin-bottom: 20px;
            font-family: 'Great Vibes', cursive;
            display: inline-block;
            position: relative;
            letter-spacing: 2px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease-in-out;
        }

        label {
            color: #4b272d;
            font-size: 18px;
            display: block;
            margin-top: 15px;
        }

        #name,
        #office,
        #email,
        #password {
            width: 100%;
            padding: 15px;
            margin-top: 10px;
            border: none;
            border-radius: 8px;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            font-size: 16px;
            color: #4b272d;
        }

        #msg {
            color: #acabb9;
            margin-top: 10px;
            font-size: 16px;
        }

        #registerButton {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px 0;
            width: 100%;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        #registerButton:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }

        #goToLogin {
            margin-top: 20px;
            color: #4b272d;
            font-size: 16px;
        }

        #LinkButton1 {
            color: #4b272d;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        #LinkButton1:hover {
            color: #836263;
        }

        #registerSuccesslabel {
            color: #4caf50;
            font-size: 16px;
        }
    </style>
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
            <label for="name">Name:</label>
            <asp:TextBox ID="name" runat="server" Width="100%" placeholder="Enter your name" Text=""></asp:TextBox>
            <br />
            <br />
            <label for="office">Office:</label>
            <asp:TextBox ID="office" runat="server" Width="100%" placeholder="Enter your office" Text=""></asp:TextBox>
            <br />
            <br />
            <label for="email">Email:</label>
            <asp:TextBox ID="email" runat="server" Width="100%" placeholder="Enter your email" Text=""></asp:TextBox>
            <br />
            <br />
            <label for="password">Password:</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Enter your password" Text=""></asp:TextBox>
            <br />
            <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="registerButton" OnClick="Register" runat="server" Text="Register" />
            <br />
            <br />
            <asp:Label ID="goToLogin" runat="server" Text="Already have an email?"></asp:Label>
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
