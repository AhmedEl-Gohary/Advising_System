﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="source.Admin_SRC.Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>   
            <asp:Button ID="Button2" runat="server" Text="Go back" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:DropDownList ID="itemType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="itemType_SelectedIndexChanged">
            <asp:ListItem Text="Select Item to add" Value="balabizo" />
            <asp:ListItem Text="New Semester" Value="semester" />
            <asp:ListItem Text="New Course" Value="course" />
            <asp:ListItem Text="Makeup Exam" Value="exam" />
        </asp:DropDownList>

        <br />
        <br />
        
        <div id="dynamicFields" runat="server"></div>


        <asp:Button ID="submitButton" runat="server" Text="Submit" OnClientClick="return submitForm();" OnClick="submitButton_Click" />

         <br />
        <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
        <br />


        </div>
    </form>
</body>
</html>
