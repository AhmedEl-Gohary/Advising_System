<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="source.Admin_SRC.Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <form id="form1" runat="server">
        <asp:Label ID="label1" runat="server" Text="Please enter Student_ID"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Enter" Text="Update" Width="110px" />
        <br />
        <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
        <br />
    </form>
</body>
</html>
