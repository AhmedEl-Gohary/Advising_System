<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error_Page.aspx.cs" Inherits="source.Error_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>403 - Forbidden: Access is denied.</title>
    <style>
        body {
            margin: 0;
            font-size: 16px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0e8e4, #c4d7d2);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        #header {
            width: 100%;
            padding: 20px 0;
            background-color: #4caf50; /* Match the login button color */
            text-align: center;
            color: #FFF;
            font-size: 2.4em;
        }

        #content {
            width: 400px;
            background: linear-gradient(to right, #ffffff, #f5f2f0);
            margin-top: 20px;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 32px;
            margin: 0;
            color: #4b272d;
            font-family: 'Great Vibes', cursive;
            display: inline-block;
            position: relative;
            letter-spacing: 2px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease-in-out;
        }

        h3 {
            font-size: 18px;
            margin: 10px 0 0 0;
            color: #4b272d;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div id="header">
        <h1>Server Error</h1>
    </div>
    <div id="content">
        <fieldset>
            <h2>403 - Forbidden: Access is denied.</h2>
            <h3>You do not have permission to view this directory or page using the credentials that you supplied.</h3>
        </fieldset>
    </div>
</body>
</html>
