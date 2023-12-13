<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Page.aspx.cs" Inherits="source.Student_SRC.Student_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TreeView ID="List" runat="server" ImageSet="Arrows" OnSelectedNodeChanged="SelectedNodeChanged" Width="197px">
                <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                <Nodes>
                    <asp:TreeNode SelectAction="Expand" Text="Main" Value="Main">
                        <asp:TreeNode Selected="True" Text="DashBoard" Value="DashBoard"></asp:TreeNode>
                        <asp:TreeNode Text="Contacts" Value="Contacts"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Expanded="False" SelectAction="Expand" Text="Courses" Value="Courses">
                        <asp:TreeNode Text="View Courses" Value="View Courses"></asp:TreeNode>
                        <asp:TreeNode Text="View Prerequisites" Value="View Prerequisites"></asp:TreeNode>
                        <asp:TreeNode Text="Choose Instructor" Value="Choose Instructor"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Expanded="False" SelectAction="Expand" Text="Financial" Value="New Node">
                        <asp:TreeNode Text="Upcoming installment" Value="Upcoming Installment"></asp:TreeNode>
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
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
