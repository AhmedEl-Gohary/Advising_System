<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="source.Student_SRC.Main.Contacts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Info</title>
        <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #e7e1dc, #d1c4bb);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #form1 {
            background: linear-gradient(to right, #ffffff, #f5f2f0);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 63%;
            text-align: center;
        }

        #Go_Back {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px 0;
            width: 25%;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        #Go_Back:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }


        #Label1 {
            color: #4b272d;
            font-size: 24px;
            margin-bottom: 20px;
        }

        #Phone {
            width: 50%;
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

        #Add {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px 0;
            width: 20%;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        #Add:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }

        #msg {
            color: #acabb9;
            margin-top: 10px;
            font-size: 16px;
        }

        #GridView1 {
            width: 40%;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: auto;
            position:center;
        }

        #GridView1 th, #GridView1 td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        #GridView1 th {
            background-color: #4caf50;
            color: white;
        }

        #GridView1 tr:nth-child(even) {
            background-color: #f5f5f5;
        }

        #GridView1 tr:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Go_Back" runat="server" Text="Go Back" OnClick ="Go_Back_Click"/>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Add New Phone Number"></asp:Label>
            <br />
        </div>
        <asp:TextBox ID="Phone" runat="server" placeholder="Enter your Mobile Number" EnableTheming="True"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Add" runat="server" Text="Add" OnClick ="Add_Click"/>
        <br />
        <br />
        <br />
        <asp:Label ID="msg" runat="server" Text=" "></asp:Label>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
    </form>
</body>
</html>
