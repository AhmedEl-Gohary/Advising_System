<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="source.Student_SRC.Courses.Instructor" %>

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
        width: 75%;
        text-align: center;
    }

    label {
        color: #4b272d;
        font-size: 18px;
        font-weight: bold;
        display: block;
        margin-top: 15px;
    }

    input[type="text"], input[type="date"] {
        width: 40%;
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

    #submitButton {
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

    #submitButton:hover {
        background: linear-gradient(to right, #45a049, #4caf50);
    }

    #msg {
        color: #acabb9;
        margin-top: 10px;
        font-size: 16px;
    }

    #dynamicFields {
        text-align: left;
    }

     #DropDownList1{
        width: 55%;
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

    #Button2, #Button1 {
        background: linear-gradient(to right, #4caf50, #45a049);
        color: white;
        border: none;
        padding: 15px 0;
        width: 25%;
        font-size: 18px;
        cursor: pointer;
        border-radius: 8px;
        transition: background-color 0.3s ease;
        margin-top: 20px;
    }

    #Button2:hover, #Button1:hover {
        background: linear-gradient(to right, #45a049, #4caf50);
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
        <div>
            <asp:Label ID="Label4" runat="server" Text="Please select your Action"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AutoPostBack="True">
                <asp:ListItem Value="1">Show</asp:ListItem>
                <asp:ListItem Value="2">Choose</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="InstructorID"></asp:Label>
            <br />
            <asp:TextBox ID="Ins" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="CourseID"></asp:Label>
            <br />
            <asp:TextBox ID="Course" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Current Semester Code" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="semCode" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Show" OnClick="Show" />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Choose" OnClick="Choose" Visible="False" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <asp:Label ID="msg" runat="server" Text=" " ForeColor ="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
