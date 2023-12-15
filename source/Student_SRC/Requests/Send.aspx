<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send.aspx.cs" Inherits="source.Student_SRC.Requests.Send" %>

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
            <asp:Label ID="Select" runat="server" Text="Select Request Type"></asp:Label>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="-1">Choose</asp:ListItem>
            <asp:ListItem Value="1">Add Credit Hours</asp:ListItem>
            <asp:ListItem Value="2">Add Course</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Course ID" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Comment_Label" runat="server" Text="Comment" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="Comment_Text" runat="server" Height="88px" Width="465px" Visible="False"></asp:TextBox>
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button ID="Send_Button" runat="server" Text="Send" OnClick ="Send_Click" Visible="False"/>
        <br />
        <asp:Label ID="msg" runat="server" Text=" " Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="Requests" runat="server" Visible="False">
        </asp:GridView>
    </form>
</body>
</html>
