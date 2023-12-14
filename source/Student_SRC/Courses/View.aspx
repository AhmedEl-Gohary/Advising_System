<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="source.Student_SRC.Courses.View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="View  "></asp:Label>
            <asp:DropDownList ID="List" runat="server" AutoPostBack="true">
                <asp:ListItem Value="-1">Choose</asp:ListItem>
                <asp:ListItem Value="1">All</asp:ListItem>
                <asp:ListItem Value="2">Available</asp:ListItem>
                <asp:ListItem Value="3">Required</asp:ListItem>
                <asp:ListItem Value="4">Optional</asp:ListItem>
                <asp:ListItem Value="5">Missing</asp:ListItem>
            </asp:DropDownList>
&nbsp;<asp:Label ID="Label2" runat="server" Text="Courses"></asp:Label>
            <br />
            <br />
            Current Semester Code<br />
            <asp:TextBox ID="SemesterCode" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="show" runat="server" Text="Show" OnClick ="Show" Width="90px" />
            <br />
            <br />
            <asp:Label ID="msg" runat="server" Text=" "></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
