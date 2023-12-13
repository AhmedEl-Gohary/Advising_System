<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="source.Admin_SRC.View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="list" runat="server" Width="441px" >
            <asp:ListItem Enabled="true" Text="Select Item you want to list" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Advisors" Value="1"></asp:ListItem>
            <asp:ListItem Text="Students with their corresponding advisors" Value="2"></asp:ListItem>
            <asp:ListItem Text="Pending requests" Value="3"></asp:ListItem>
            <asp:ListItem Text="Details of instructors along with their assigned courses" Value="4"></asp:ListItem>
            <asp:ListItem Text="Semesters along with their offered courses" Value="5"></asp:ListItem>
            <asp:ListItem Text="Payments along with their corresponding students" Value="6"></asp:ListItem>
            <asp:ListItem Text="Active students" Value="7"></asp:ListItem>
            <asp:ListItem Text="Graduation plans along with their initiated advisors" Value="8"></asp:ListItem>
            <asp:ListItem Text="Students transcript" Value="9"></asp:ListItem>
            <asp:ListItem Text="Semesters along with their offered courses" Value="10"></asp:ListItem>
            </asp:DropDownList>

           <br />

            <asp:Button ID="Button1" runat="server" Text="list" OnClick="Button1_Click" Width="81px" />
            <br />

            <asp:Label ID="msg" runat="server" Text=" "></asp:Label>
            <asp:GridView ID="GridView1" runat="server" >
            </asp:GridView>
            
        </div>
    </form>
</body>
</html>
