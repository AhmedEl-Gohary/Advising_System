<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="source.Admin_SRC.View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Page</title>
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
            width: 80%; /* Adjusted width for better visibility */
            text-align: center;
            margin-top: 50px;
            overflow: hidden; /* Added overflow to handle content overflow */
        }

        #Button2 {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px 0;
            width: 81px; /* Set the width to be smaller than the Go back button */
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        #Button2:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }
          #Button1 {
      background: linear-gradient(to right, #4caf50, #45a049);
      color: white;
      border: none;
      padding: 15px 0;
      width: 441px; /* Set the width to be smaller than the Go back button */
      font-size: 18px;
      cursor: pointer;
      border-radius: 8px;
      transition: background-color 0.3s ease;
      margin-top: 20px;
  }

  #Button1:hover {
      background: linear-gradient(to right, #45a049, #4caf50);
  }

        #list {
            width: 441px; /* Set the width to match the Go back button */
            padding: 15px;
            margin-top: 10px;
            border: 1px solid #ccc;
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

        #GridView1 {
            margin-top: 20px;
            width: 100%;
            max-width: 100%; /* Added max-width to prevent overflow */
            border-collapse: collapse;
            border-spacing: 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 8px;
            overflow: auto; /* Added overflow to handle content overflow */
            border: 1px solid #ccc;
        }

        #GridView1 th, #GridView1 td {
            padding: 15px;
            border-bottom: 1px solid #ccc;
        }

        #GridView1 th {
            background-color: #f5f2f0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button2" runat="server" Text="Go back" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:DropDownList ID="list" runat="server" Width="441px">
            <asp:ListItem Enabled="true" Text="Select Item you want to list" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Advisors" Value="1"></asp:ListItem>
            <asp:ListItem Text="Students with their corresponding advisors" Value="2"></asp:ListItem>
            <asp:ListItem Text="Pending requests" Value="3"></asp:ListItem>
            <asp:ListItem Text="Details of instructors along with their assigned courses" Value="4"></asp:ListItem>
            <asp:ListItem Text="Semesters along with their offered courses" Value="5"></asp:ListItem>
            <asp:ListItem Text="Payments along with their corresponding students" Value="6"></asp:ListItem>
            <asp:ListItem Text="Active students" Value="7"></asp:ListItem>
            <asp:ListItem Text="Graduation plans along with their initiated advisors" Value="8"></asp:ListItem>
            <asp:ListItem Text="Students transcript" Value="9"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="list" OnClick="Button1_Click" Width="441px" />
        <br />
        <br />
        <asp:Label ID="msg" runat="server" Text=" "></asp:Label>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
