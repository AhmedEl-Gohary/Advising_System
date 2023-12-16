<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_Page.aspx.cs" Inherits="source.Advisor_SRC.Advisor_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Admin Page</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            background: linear-gradient(to right, #e0e8e4, #c4d7d2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #form1 {
            display: flex;
            width: 100%;
            max-width: 1200px;
        }

        #dashboardLabel {
            color: #4b272d;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #treeContainer {
            display: flex;
            align-items: flex-start;
            justify-content: flex-start;
            margin-left: 20px;
            margin-top: 20px;
        }

        #Tree {
            font-size: 24px;
            color: #4b272d;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 20px;
            width: 500px;
        }

        #Tree a {
            color: #4b272d;
            text-decoration: none;
            transition: color 0.3s ease;
            display: block;
            padding: 15px;
            margin: 10px 0;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            position: relative;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #Tree a:hover {
            color: #836263;
            background-color: #c4d7d2;
            text-decoration: none;
        }

        /* Updated */
        #Tree a:hover::after {
            content: attr(title);
            position: fixed;
            top: 60%;
            right: 12%;
            transform: translate(0, 39%);
            padding: 35px;
            background-color: #f5f2f0;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            font-size: 18px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            white-space: pre-line; /* Display text in multiple rows */
        }

        /* Updated: Remove underline */
        #Tree a:hover {
            text-decoration: none;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div id="dashboardLabel">
            <asp:Label ID="dashboardLabel" runat="server" Text="Dashboard"></asp:Label>
        </div>

        <div id="treeContainer">
            <asp:TreeView ID="Tree" runat="server" ImageSet="Arrows" Width="500px" OnSelectedNodeChanged="SelectedNodeChanged">
                <HoverNodeStyle Font-Underline="False" ForeColor="#5555DD" />
                <Nodes>
                    <asp:TreeNode Text="My Students" Value="Students" Expanded="False" ToolTip="View and manage items. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                    <asp:TreeNode Text="View Requests" Value="View Requests" Expanded="False" ToolTip="View and manage items. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                    <asp:TreeNode Text="Courses/GradPlan" Value="Actions" Expanded="False" ToolTip="View and manage items. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                    <asp:TreeNode Text="Handle Requests" Value="Handle Requests" ToolTip="View and manage items. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                </Nodes>
                <NodeStyle Font-Names="Segoe UI, Tahoma, Geneva, Verdana, sans-serif" Font-Size="24px" ForeColor="#4b272d" HorizontalPadding="20px" NodeSpacing="0px" VerticalPadding="20px" />
                <ParentNodeStyle Font-Bold="False" />
                <SelectedNodeStyle Font-Underline="False" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
            </asp:TreeView>
        </div>
    </form>
</body>

</html>
