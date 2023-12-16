<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Handle_Requests.aspx.cs" Inherits="source.Advisor_SRC.Actions.Handle_Requests" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Handle Requests</title>
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
            width: 400px;
            text-align: center;
        }

        label {
            color: #4b272d;
            font-size: 18px;
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 15px;
            margin-top: 10px;
            border: none;
            border-radius: 8px;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            font-size: 16px;
            color: #4b272d;
        }

        input[type="radio"] {
            margin-top: 10px;
            margin-right: 5px;
        }

        #submitButton {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px 0;
            width: 100%;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        #submitButton:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }

        #msg {
            color: #acabb9;
            margin-top: 10px;
            font-size: 16px;
        }

        .dynamicFields {
            text-align: left;
        }

        #itemType {
            width: 100%;
            padding: 15px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f5f2f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            font-size: 16px;
            color: #4b272d;
        }

        #Button2 {
            background: linear-gradient(to right, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 15px 0;
            width: 25%;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        #Button2:hover {
            background: linear-gradient(to right, #45a049, #4caf50);
        }

        .spacing {
            margin-bottom: 10px;
        }

        .labelSpacing {
            margin-bottom: 5px;
        }

        .textBoxSpacing {
            margin-bottom: 10px;
        }
    </style>

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
</body>
</html>
