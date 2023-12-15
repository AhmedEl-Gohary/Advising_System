<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration_Page.aspx.cs" Inherits="source.Registeration_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
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

        #RegisterLabel {
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

        #msg {
            color: #acabb9;
            margin-top: 10px;
            font-size: 16px;
        }

        #list {
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

        #RegisterButton {
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

        #RegisterButton:hover {
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="RegisterLabel" runat="server" Text="Register as: "></asp:Label>
            <br />
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
