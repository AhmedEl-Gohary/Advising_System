<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="source.Student_SRC.Courses.Instructor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
