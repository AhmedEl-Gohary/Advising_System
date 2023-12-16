<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send.aspx.cs" Inherits="source.Student_SRC.Requests.Send" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send Requests</title>
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
        width: 50%;
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

    #Select{
        color: #4b272d;
        font-size: 18px;
        font-weight: bold;
        display: block;
        margin-top: 15px;
    }

    #Label1, #Comment_Label{
        color: #4b272d;
        font-size: 20px;
        display: block;
        margin-top: 15px;
    }

    input[type="text"] {
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

    #DropDownList1 {
        width: 50%;
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


    #Send_Button {
        background: linear-gradient(to right, #4caf50, #45a049);
        color: white;
        border: none;
        padding: 15px 0;
        width: 20%;
        font-size: 18px;
        cursor: pointer;
        border-radius: 8px;
        transition: background-color 0.3s ease;
        margin-top: 20px;
    }

    #Send_Button:hover {
        background: linear-gradient(to right, #45a049, #4caf50);
    }

    #msg {
        color: #acabb9;
        margin-top: 10px;
        font-size: 16px;
    }

    #Requests {
        width: 50%;
        border-collapse: collapse;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: auto;
        position:center;
    }

    #Requests th, #Requests td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: center;
    }

    #Requests th {
        background-color: #4caf50;
        color: white;
    }

    #Requests tr:nth-child(even) {
        background-color: #f5f5f5;
    }

    #Requests tr:hover {
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
            <asp:Label ID="Select" runat="server" Text="Select Request Type"></asp:Label>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="-1">Choose</asp:ListItem>
            <asp:ListItem Value="1">Add Credit Hours</asp:ListItem>
            <asp:ListItem Value="2">Add Course</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Course ID" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Comment_Label" runat="server" Text="Comment" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="Comment_Text" runat="server" placeholder="Add your comment" Height="88px" Width="465px" Visible="False"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Send_Button" runat="server" Text="Send" OnClick ="Send_Click" Visible="False"/>
        <br />
        <asp:Label ID="msg" runat="server" Text=" " Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="Requests" runat="server" Visible="False">
        </asp:GridView>
    </form>
</body>
</html>
