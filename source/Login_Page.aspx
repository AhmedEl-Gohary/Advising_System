<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Page.aspx.cs" Inherits="source.Login_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
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

        #welcomeLabel:hover {
            transform: scale(1.1);
        }
  label {
            color: #4b272d;
            font-size: 18px;
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        #userName, #password, #list {
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

        #eyeIcon {
            font-size: 20px;
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            cursor: pointer;
        }

        #msg {
            color: #acabb9;
            margin-top: 10px;
            font-size: 16px;
        }

        #login {
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

        #login:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }

        #goToRegister {
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
            <asp:Label ID="welcomeLabel" runat="server" Text="Welcome!"></asp:Label>
            <br />
            <label for="userName">UserName:</label>
            <asp:TextBox ID="userName" runat="server" placeholder="Enter your username"></asp:TextBox>
            <br />
            <label for="password">Password:</label>
            <div style="position: relative;">
                <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                <span id="eyeIcon" class="eye-icon" onclick="togglePassword()">🔒</span>
            </div>
            <br />
            <br />
            <asp:DropDownList ID="list" runat="server" Width="100%">
                <asp:ListItem Enabled="true" Text="Select Your Role" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Student" Value="1"></asp:ListItem>
                <asp:ListItem Text="Advisor" Value="2"></asp:ListItem>
                <asp:ListItem Text="Admin" Value="3"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="login" runat="server" OnClick="Login" Text="Login" />
            <br />
            <asp:Label ID="goToRegister" runat="server" Text="Don't have an account yet?"></asp:Label>
            <asp:LinkButton ID="LinkButton1" OnClick="Register" runat="server">Register here</asp:LinkButton>
            <br />
        </div>
    </form>

    <script>
        function togglePassword() {
            var passwordInput = document.getElementById('password');
            var eyeIcon = document.getElementById('eyeIcon');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.textContent = '👁️';
            } else {
                passwordInput.type = 'password';
                eyeIcon.textContent = '🔒';
            }
        }
    </script>
</body>
</html>
