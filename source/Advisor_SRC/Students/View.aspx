<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="source.Advisor_SRC.Students.View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students View</title>
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
            max-width: 800px; /* Adjust the maximum width according to your needs */
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #4b272d;
            font-size: 24px;
        }

        #list {
            width: 100%;
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

        #txtMajor {
            width: 100%;
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

        #GridView1 {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #GridView1 th, #GridView1 td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        #GridView1 th {
            background-color: #4caf50;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Students View</h2>

            <asp:DropDownList ID="list" runat="server" CssClass="list">
                <asp:ListItem Enabled="true" Text="choose a listing option" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Assigned Students" Value="1"></asp:ListItem>
                <asp:ListItem Text="Assigned Students In a Major" Value="2"></asp:ListItem>
            </asp:DropDownList>

            <br />
            <br />

            <asp:TextBox ID="txtMajor" runat="server" Visible="false" CssClass="txtMajor" placeholder="Enter Major"></asp:TextBox>

            <br />

            <asp:Button ID="button" runat="server" CssClass="button" OnClick="OnButtonClick" Text="View Students" />
            <br />
            <br />
            <asp:Label ID="msg" runat="server" Text=" "></asp:Label>

            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            </asp:GridView>
            <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
