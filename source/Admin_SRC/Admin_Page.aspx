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
            padding: 20px; /* Added for better spacing */
            background: linear-gradient(to right, #e0e8e4, #c4d7d2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #form1 {
            display: flex;
            width: 100%;
            max-width: 1200px; /* Adjust as needed */
        }

        #dashboardLabel {
            color: #4b272d;
            font-size: 36px; /* Enlarged */
            font-weight: bold;
            margin-bottom: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #treeContainer {
            display: flex;
            align-items: flex-start;
            justify-content: flex-start;
            margin-left: 20px; /* Move the list slightly to the left */
            margin-top: 20px; /* Move the list slightly down */
        }

        #TreeView1 {
            font-size: 24px; /* Enlarged */
            color: #4b272d;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 20px;
            width: 500px; /* Set the width as needed */
        }

        #TreeView1 a {
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

        #TreeView1 a:hover {
            color: #836263;
            background-color: #c4d7d2;
        }

        /* Updated */
        #TreeView1 a:hover::after {
            content: attr(title);
            position: fixed;
            top: 60%; /* Adjusted the position down */
            right: 12%;
            transform: translate(0, 39%);
            padding: 35px; /* Increased padding for better visibility */
            background-color: #f5f2f0;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px; /* Adjust as needed */
            font-size: 18px; /* Enlarged font size */
            font-family:  'Great Vibes', cursive; /* Changed font family for description */
            white-space: pre-line; /* Added to display multiple lines */
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div id="dashboardLabel">
            <asp:Label ID="dashboardLabel" runat="server" Text="Dashboard"></asp:Label>
        </div>

        <div id="treeContainer">
            <asp:TreeView ID="TreeView1" runat="server">
                <Nodes>
                    <asp:TreeNode Text="List Items" NavigateUrl="~/Admin_SRC/View.aspx" Value="Views" ToolTip="View and manage items. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                    <asp:TreeNode Text="Add Items" NavigateUrl="~/Admin_SRC/Add.aspx" Value="Add Items" ToolTip="Add new items. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                    <asp:TreeNode Text="Delete Items" NavigateUrl="~/Admin_SRC/Delete.aspx" Value="Delete Items" ToolTip="Delete existing items. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                    <asp:TreeNode Text="Link" NavigateUrl="~/Admin_SRC/Link.aspx" Value="Link" ToolTip="Manage links. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                    <asp:TreeNode Text="Issue Installments" NavigateUrl="~/Admin_SRC/Issue.aspx" Value="Issue Installments" ToolTip="Manage installment issues. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                    <asp:TreeNode Text="Update Financial Status" NavigateUrl="~/Admin_SRC/Update.aspx" Value="Update Financial Status" ToolTip="Update financial information. This is a longer description to showcase the updated styling. It contains multiple lines."></asp:TreeNode>
                </Nodes>
            </asp:TreeView>
        </div>
    </form>
</body>

</html>
