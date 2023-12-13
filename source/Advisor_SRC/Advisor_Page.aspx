<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_Page.aspx.cs" Inherits="source.Advisor_SRC.Advisor_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
        <div>
            <asp:TreeView ID="Tree" runat="server" ImageSet="Arrows" Width="209px" OnSelectedNodeChanged="SelectedNodeChanged">
                <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                <Nodes>
                    <asp:TreeNode Text="Students" Value="Students" Expanded="False"></asp:TreeNode>

                    <asp:TreeNode Text="Requests" Value="Requests" Expanded="False"></asp:TreeNode>

                    <asp:TreeNode Text="Actions" Value="Actions" Expanded="False" SelectAction="Expand">
                        <asp:TreeNode Text="Add Course" Value="Add Course"></asp:TreeNode>
                        <asp:TreeNode Text="Add Graduation Plan" Value="Add Graduation Plan"></asp:TreeNode>
                        <asp:TreeNode Text="Update Graduation Plan" Value="Update Graduation Plan"></asp:TreeNode>
                        <asp:TreeNode Text="Handle Requests" Value="Handle Requests"></asp:TreeNode>
                    </asp:TreeNode>
    
                </Nodes>
                <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                <ParentNodeStyle Font-Bold="False" />
                <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
            </asp:TreeView>
            </div>
            <br />
    </form>
</body>
</html>
