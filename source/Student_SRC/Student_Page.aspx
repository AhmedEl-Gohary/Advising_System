﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Page.aspx.cs" Inherits="source.Student_SRC.Student_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Page</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: stretch;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            background: linear-gradient(to right, #e7e1dc, #d1c4bb);
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

        #container {
            display: flex;
        }

        #sidebar {
            width: 250px; /* Adjusted width */
            background: linear-gradient(to right, #e0e8e4, #c4d7d2); /* Similar background color */
            padding: 20px;
            border-right: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #content {
            flex: 1;
            padding: 20px;
        }

        #List {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            font-size: 16px;
            color: #4b272d;
            display: block;
            margin-bottom: 20px;
        }

        .tree-node {
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .tree-node:hover {
            background-color: #c4d7d2; /* Adjusted hover background color */
        }

        #GridView1 {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #GridView1 th, #GridView1 td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        #GridView1 th {
            background-color: #4caf50;
            color: white;
        }

        #GridView1 tr:nth-child(even) {
            background-color: #f5f5f5;
        }

        #GridView1 tr:hover {
            background-color: #e0e0e0;
        }

        /* Matching styles for TreeView from the first file */
        #treeContainer {
            display: flex;
            align-items: flex-start;
            justify-content: flex-start;
            margin-left: 20px; /* Move the list slightly to the left */
            margin-top: 20px; /* Move the list slightly down */
        }

        #List {
            font-size: 24px; /* Enlarged */
            color: #4b272d;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 20px;
            width: 300px; /* Set the width as needed */
        }

        #List a {
            color: #4b272d;
            text-decoration: none;
            transition: color 0.3s ease;
            display: block;
            padding: 15px; /* Increased padding for better visibility */
            margin: 10px 0;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            position: relative;
            font-family: 'Arial', sans-serif; /* Changed font family for description */
        }

        #List a:hover {
            color: #836263;
            background-color: #c4d7d2;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
                <asp:TreeView ID="List" runat="server" ImageSet="Arrows" OnSelectedNodeChanged="SelectedNodeChanged" CssClass="tree-node">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <Nodes>
                        <asp:TreeNode SelectAction="Expand" Text="Main" Value="Main">
                            <asp:TreeNode Selected="True" Text="Dashboard" Value="Dashboard"></asp:TreeNode>
                            <asp:TreeNode Text="Contacts" Value="Contacts"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Expanded="False" SelectAction="Expand" Text="Courses" Value="Courses">
                            <asp:TreeNode Text="View Courses" Value="View Courses"></asp:TreeNode>
                            <asp:TreeNode Text="View Prerequisites" Value="View Prerequisites"></asp:TreeNode>
                            <asp:TreeNode Text="Choose Instructor" Value="Choose Instructor"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Expanded="False" SelectAction="Expand" Text="Financial" Value="New Node">
                            <asp:TreeNode Text="Upcoming Installment" Value="Upcoming Installment"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Expanded="False" SelectAction="Expand" Text="Graduation Plan" Value="New Node">
                            <asp:TreeNode Text="View Plan" Value="View Plan"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Expanded="False" SelectAction="Expand" Text="Makeup Exams" Value="New Node">
                            <asp:TreeNode Text="View Exams" Value="View Exams"></asp:TreeNode>
                            <asp:TreeNode Text="Registeration" Value="Registeration"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Expanded="False" SelectAction="Expand" Text="Requests" Value="New Node">
                            <asp:TreeNode Text="Send Request" Value="Send Request"></asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                </asp:TreeView>
            </div>
            <div id="content">
                <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="grid-view">
                </asp:GridView>
            </div>
    </form>
</body>
</html>
