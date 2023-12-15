<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Page.aspx.cs" Inherits="source.Student_SRC.Student_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Page</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #e7e1dc, #d1c4bb);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #form1 {
            background: linear-gradient(to right, #ffffff, #f5f2f0);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: fit-content;
            text-align: center;
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
        }

        .tree-node {
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        #GridView1 {
            margin-top: 20px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
                        <asp:TreeNode Text="Registration" Value="Registration"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Expanded="False" SelectAction="Expand" Text="Requests" Value="New Node">
                        <asp:TreeNode Text="Send Request" Value="Send Request"></asp:TreeNode>
                    </asp:TreeNode>
                </Nodes>
                <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                <ParentNodeStyle Font-Bold="False" />
                <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
            </asp:TreeView>
            <br />
            <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="grid-view">
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
