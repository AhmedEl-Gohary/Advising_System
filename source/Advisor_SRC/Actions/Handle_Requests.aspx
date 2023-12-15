<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Handle_Requests.aspx.cs" Inherits="source.Advisor_SRC.Actions.Handle_Requests" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .dynamicFields {
            display: none;
        }
        .spacing {
            margin-bottom: 10px;
        }

    </style>

    <style>
        .labelSpacing {
            margin-bottom: 5px;
        }
        .textBoxSpacing {
            margin-bottom: 10px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="spacing">
            <label for="itemType">Select Action:</label>
            <asp:DropDownList ID="itemType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="itemType_SelectedIndexChanged">
                <asp:ListItem Text="Select Action" Value="default" />
                <asp:ListItem Text="Handle Credit Hours Requests" Value="HandleCreditHoursRequests" />
                <asp:ListItem Text="Handle Course Requests" Value="HandleCourseRequests" />
            </asp:DropDownList>
        </div>

        <div id="dynamicFields" class="dynamicFields" runat="server">
            
        </div>

        <div class="spacing">
            <asp:Button ID="submitButton" runat="server" Text="Submit" OnClientClick="return submitForm();" OnClick="submitButton_Click" />
        </div>

        <br />
        <asp:Label ID="msg" runat="server" Text=" " ForeColor="Red"></asp:Label>
        <br />
    </form>
    <script>
        function submitForm() {
            var dynamicFields = document.getElementById('<%= dynamicFields.ClientID %>');
            var visibleFields = dynamicFields.querySelectorAll('input[type="text"], input[type="date"]');
            for (var i = 0; i < visibleFields.length; i++) {
                if (visibleFields[i].value.trim() === "") {
                    alert("Please fill in all fields.");
                    return false;
                }
            }
            return true;
        }
    </script>
</body>
</html>
