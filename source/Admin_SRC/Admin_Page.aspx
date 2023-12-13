<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Page.aspx.cs" Inherits="source.Admin_SRC.Admin_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TreeView ID="TreeView1" runat="server">
                <Nodes>
                    <asp:TreeNode Text="List Items" NavigateUrl="~/Admin_SRC/View.aspx" Value="Views"></asp:TreeNode>
                    <asp:TreeNode Text="Add Items" NavigateUrl="~/Admin_SRC/Add.aspx" Value="Add Items"></asp:TreeNode>
                    <asp:TreeNode Text="Delete Items" NavigateUrl="~/Admin_SRC/Delete.aspx" Value="Delete Items"></asp:TreeNode>
                    <asp:TreeNode Text="Link" NavigateUrl="~/Admin_SRC/Link.aspx" Value="Link"></asp:TreeNode>
                    <asp:TreeNode Text="Issue Installments" NavigateUrl="~/Admin_SRC/Issue.aspx" Value="Issue Installments"></asp:TreeNode>
                    <asp:TreeNode Text="Update Financial Status" NavigateUrl="~/Admin_SRC/Update.aspx" Value="Update Financial Status"></asp:TreeNode>
                </Nodes>
            </asp:TreeView>
        </div>
    </form>
</body>
</html>
