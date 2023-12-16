﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Plan.aspx.cs" Inherits="source.Student_SRC.Grad_Plan.Plan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        #Go_Back {
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

        #Go_Back:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }

        #form1 {
            background: linear-gradient(to right, #ffffff, #f5f2f0);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 63%;
            text-align: center;
        }

        #GridView1 {
            width: 70%;
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

        #Label1 {
            color: #4b272d;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 20px;
        }

</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Go_Back" runat="server" Text="Go Back" OnClick="Go_Back_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
        </div>
    </form>
</body>
</html>
