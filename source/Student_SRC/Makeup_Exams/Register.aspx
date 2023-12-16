<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="source.Student_SRC.Makeup_Exams.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Makeup Exam</title>
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

        #Label1{
            color: #4b272d;
            font-size: 18px;
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        #Label2, #Label3{
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

         #list{
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


        #register {
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Go_Back" runat="server" Text="Go Back" OnClick="Go_Back_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Register for a Makeup Exam"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Course ID"></asp:Label>
            <br />
            <asp:TextBox ID="courseID" placeholder="Enter the Course ID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Current Semester Code"></asp:Label>
            <br />
            <asp:TextBox ID="semesterCode" placeholder="Enter your Current Semester Code" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:DropDownList ID="list" runat="server">
                <asp:ListItem Value="-1">Exam Type</asp:ListItem>
                <asp:ListItem Value="1">First Makeup</asp:ListItem>
                <asp:ListItem Value="2">Second Makeup</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="register" runat="server" Text="Register" OnClick="Register_Click" />
            <br />
            <br />
            <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>

        </div>
    </form>
</body>
</html>
