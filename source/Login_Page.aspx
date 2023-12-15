<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Page.aspx.cs" Inherits="source.Login_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0; 
        }

        #form1 {
            background-color: #fff; 
            padding: 20px;
            border-radius: 10px; 
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); 
        }

        #welcomeLabel {
            color: #333; 
            font-size: 24px;
            font-weight: bold;
            text-align: center;
        }

        label {
            color: #333;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }

        #userName, #password {
            width: 250px;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px; 
        }

        #list {
            width: 250px;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd; 
            border-radius: 5px; 
        }

        #msg {
            color: red;
            margin-top: 10px;
            font-size: 14px;
        }

        #login {
            background-color: #4CAF50; 
            color: white; 
            border: none; 
            padding: 15px 30px; 
            font-size: 18px;
            cursor: pointer; 
            border-radius: 10px; 
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            transition: box-shadow 0.3s ease;
        }

        #login:hover {
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.3); 
        }

        #goToRegister {
            margin-top: 20px;
            color: #333;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="welcomeLabel" runat="server" Text="Welcome to Our Website!"></asp:Label>
            <br />
            <br />
            <label for="userName">UserName:</label>
            <br />
            <asp:TextBox ID="userName" runat="server"></asp:TextBox>
            <br />
            <label for="password">Password:</label>
            <br />
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
            <span id="eyeIcon" class="eye-icon" onclick="togglePassword()">🔒</span>
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
            <br />
            <br />
            <asp:DropDownList ID="list" runat="server" Width="250px">
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
            <br />
            <asp:Label ID="goToRegister" runat="server" Text="Don't have an account yet?"></asp:Label>
            <asp:LinkButton ID="LinkButton1" OnClick="Register" runat="server">Register here</asp:LinkButton>
            <br />
        </div>
    </form>
</body>
</html>
