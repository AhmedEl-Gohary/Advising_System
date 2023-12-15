<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="source.Student_SRC.Main.Contacts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Go_Back" runat="server" Text="Go Back" OnClick ="Go_Back_Click"/>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Add New Phone Number"></asp:Label>
            <br />
        </div>
        <asp:TextBox ID="Phone" runat="server" EnableTheming="True"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Add" runat="server" Text="Add" OnClick ="Add_Click"/>
        <br />
        <br />
        <asp:Label ID="msg" runat="server" Text=" "></asp:Label>
    </form>
</body>
</html>
