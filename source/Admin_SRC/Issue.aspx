<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Issue.aspx.cs" Inherits="source.Admin_SRC.Issue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issue Page</title>
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
            margin-top: 50px; /* Adjusted margin for better positioning */
        }

        label {
            color: #4b272d;
            font-size: 18px;
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        #TextBox1 {
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

        #Button1, #Button2 {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px 0;
            width: 100%;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            margin-top: 20px; /* Adjusted margin for better spacing */
        }

        #Button1:hover, #Button2:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }

        #msg {
            color: #acabb9;
            margin-top: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Go Back" />
        <br />
        <br />
        <label for="TextBox1">Payment_ID:</label>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Payment ID"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Enter" Text="Enter" Width="110px" />
        <br />
        <br />
        <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
        <br />
    </form>
</body>
</html>
