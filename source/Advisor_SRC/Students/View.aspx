<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="source.Advisor_SRC.Students.View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Students View</h2>

            <asp:DropDownList ID="list" runat="server" Width="250px" 
                OnSelectedIndexChanged="list_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Enabled="true" Text="choose a listing option" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Assigned Students" Value="1"></asp:ListItem>
                <asp:ListItem Text="Assigned Students In a Major" Value="2"></asp:ListItem>
            </asp:DropDownList>

            <br />
            <br />

            <asp:TextBox ID="txtMajor" runat="server" Visible="false" placeholder="Enter Major"></asp:TextBox>

            <br />

            <asp:Button ID="button" runat="server" OnClick="OnButtonClick" Text="View Students" />
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
