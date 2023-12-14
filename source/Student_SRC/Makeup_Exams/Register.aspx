<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="source.Student_SRC.Makeup_Exams.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Register for a Makeup Exam"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Course ID"></asp:Label>
            <br />
            <asp:TextBox ID="courseID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Current Semester Code"></asp:Label>
            <br />
            <asp:TextBox ID="semesterCode" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:DropDownList ID="list" runat="server">
                <asp:ListItem Value="-1">Exam Type</asp:ListItem>
                <asp:ListItem Value="1">First Makeup</asp:ListItem>
                <asp:ListItem Value="2">Second Makeup</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="msg" runat="server" Text=" "></asp:Label>

        </div>
    </form>
</body>
</html>
