<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="source.Advisor_SRC.Requests.View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advisor Requests</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Advisor Requests</h2>

            <asp:DropDownList ID="dropDownList" runat="server" Width="250px">
                <asp:ListItem Text="choose a listing option" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="All Requests" Value="All"></asp:ListItem>
                <asp:ListItem Text="Pending Requests" Value="Pending"></asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="button" runat="server" OnClick="OnButtonCLick" Text="View Requests" />

            <br />
            <br />

            <asp:Label ID="msg" runat="server" ForeColor="Red" Text=""></asp:Label>

            <br />
            <br />

            <asp:GridView ID="GridViewRequests" runat="server" AutoGenerateColumns="true">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
