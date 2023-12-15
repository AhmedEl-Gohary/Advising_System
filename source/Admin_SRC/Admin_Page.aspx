<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Page.aspx.cs" Inherits="source.Admin_SRC.Admin_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #e0e8e4, #c4d7d2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #form1 {
            background: linear-gradient(to right, #ffffff, #f5f2f0);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 600px;
            text-align: center;
        }

        #dashboardLabel {
            color: #4b272d;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #TreeView1 {
            margin-top: 20px;
            font-size: 20px;
            color: #4b272d;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 20px;
        }

        #TreeView1 a {
            color: #4b272d;
            text-decoration: none;
            transition: color 0.3s ease;
            display: block;
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        #TreeView1 a:hover {
            color: #836263;
            background-color: #c4d7d2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="dashboardLabel" runat="server" Text="Dashboard"></asp:Label>
            <br />
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
