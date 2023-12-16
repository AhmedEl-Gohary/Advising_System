<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="source.Admin_SRC.Delete" %>

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
            margin-top: 20px;
        }
        input[type="text"], input[type="date"] {
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

input[type="radio"] {
    margin-top: 10px;
    margin-right: 5px;
}

        #Button1 {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            margin-bottom: 20px;
        }

        #Button1:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }

        #itemType {
            width: 100%;
            padding: 15px;
            margin-top: 10px;
            border: none;
            border-radius: 8px;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            color: #4b272d;
        }

        #dynamicFields {
            margin-top: 10px;
        }

        #submitButton {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px;
            width: 100%;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }

        #submitButton:hover {
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
        <div>        
            <asp:Button ID="Button1" runat="server" Text="Go Back" OnClick="back" />
            <br />
            <br />
            <asp:DropDownList ID="itemType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="itemType_SelectedIndexChanged">
                <asp:ListItem Text="Select Item to Delete" Value="balabizo" />
                <asp:ListItem Text="Course along with its related slots" Value="Course" />
                <asp:ListItem Text="Slots of an unoffered course in the current semester." Value="Slots in Certain Semester" />
            </asp:DropDownList>

            <div id="dynamicFields" runat="server">
                <br />
            </div>
            <asp:Button ID="submitButton" runat="server" Text="Submit" OnClientClick="return submitForm();" OnClick="submitButton_Click" />

            <br />
            <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
