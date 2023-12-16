<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="source.Advisor_SRC.Requests.View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advisor Requests</title>
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

        h2 {
            color: #4b272d;
            font-size: 24px;
        }

        #dropDownList {
            width: 250px;
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            font-size: 16px;
            color: #4b272d;
        }

        #button {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px 0;
            width: 100%;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        #button:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }

        #msg {
            color: #acabb9;
            margin-top: 10px;
            font-size: 16px;
        }

        #GridViewRequests {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #GridViewRequests th, #GridViewRequests td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        #GridViewRequests th {
            background-color: #4caf50;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Advisor Requests</h2>

            <asp:DropDownList ID="dropDownList" runat="server" CssClass="dropDownList">
                <asp:ListItem Text="choose a listing option" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="All Requests" Value="All"></asp:ListItem>
                <asp:ListItem Text="Pending Requests" Value="Pending"></asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="button" runat="server" CssClass="button" OnClick="OnButtonCLick" Text="View Requests" />

            <br />
            <br />

            <asp:Label ID="msg" runat="server" ForeColor="Red" Text=""></asp:Label>

            <br />
            <br />

            <asp:GridView ID="GridViewRequests" runat="server" AutoGenerateColumns="true">
            </asp:GridView>
            <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
