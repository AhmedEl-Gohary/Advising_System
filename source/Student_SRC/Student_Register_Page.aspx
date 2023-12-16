<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Register_Page.aspx.cs" Inherits="source.Student_SRC.Student_Register_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration Page</title>
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

        #Label1 {
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
            font-size: 14px;
            display: block;
            margin-top: 15px;
            margin-left: 4px;
            text-align: left;

        }

        #fname,
        #lname,
        #faculty,
        #major,
        #semester,
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

        #register {
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

        #register:hover {
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

        #eyeIcon {
            font-size: 20px;
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>
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
            <label for="fname">First Name</label>
            <asp:TextBox ID="fname" runat="server" Width="100%" placeholder="Enter your first name"></asp:TextBox>
            <br />
            <label for="lname">Last Name</label>
            <asp:TextBox ID="lname" runat="server" Width="100%" placeholder="Enter your last name"></asp:TextBox>
            <br />
            <label for="faculty">Faculty</label>
            <asp:TextBox ID="faculty" runat="server" Width="100%" placeholder="Enter your faculty"></asp:TextBox>
            <br />
            <label for="major">Major</label>
            <asp:TextBox ID="major" runat="server" Width="100%" placeholder="Enter your major"></asp:TextBox>
            <br />
            <label for="semester">Current Semester</label>
            <asp:TextBox ID="semester" runat="server" placeholder="Enter your current semester"></asp:TextBox>
            <br />
            <label for="email">Email</label>
            <asp:TextBox ID="email" runat="server" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
            <br />
            <label for="password">Password</label>
            <div style="position: relative;">
                <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                <span id="eyeIcon" class="eye-icon" onclick="togglePassword()">🔒</span>
            </div>
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
            <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="register" OnClick="Register" runat="server" Text="Register" />
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
