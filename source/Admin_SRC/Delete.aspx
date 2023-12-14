<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="source.Admin_SRC.Delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>        
             <asp:Button ID="Button1" runat="server" Text="Back" OnClick ="back" Width="79px" />
             <br />
             <br />
        <asp:DropDownList ID="itemType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="itemType_SelectedIndexChanged" Width="253px">
        <asp:ListItem Text="Select Item to Delete" Value="balabizo" />
        <asp:ListItem Text="Course" Value="Course" />
        <asp:ListItem Text="Slot" Value="Slot" />
        </asp:DropDownList>

 
             <br />

 
 <div id="dynamicFields" runat="server">
     <br />
             </div>
 <asp:Button ID="submitButton" runat="server" Text="Submit" OnClientClick="return submitForm();" OnClick="submitButton_Click" />

  <br />
 <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
 <br />
 </div>
    </form>
</body>
</html>
