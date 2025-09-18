<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Working_Ajax._Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>AJAX Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-card {
            width: 400px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        }
        .login-card .card-body {
            padding: 2rem;
        }
        .login-btn {
            background: #667eea;
            border: none;
        }
        .login-btn:hover {
            background: #5643a0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card login-card">
            <div class="card-body text-center">
                <h3 class="mb-4">Welcome Back 👋</h3>

                <div class="mb-3">
                    <input type="text" id="txtUsername" class="form-control" placeholder="Enter Username" />
                </div>

                <div class="mb-3">
                    <input type="password" id="txtPassword" class="form-control" placeholder="Enter Password" />
                </div>

                <button type="button" class="btn btn-primary w-100 login-btn" onclick="loginUser()">
                    Login
                </button>
            </div>
        </div>
    </form>

    <!-- jQuery + Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function loginUser() {
            var username = $("#txtUsername").val();
            var password = $("#txtPassword").val();

            if (!username || !password) {
                alert("Please enter both username and password.");
                return;
            }

            $.ajax({
                type: "POST",
                url: "Default.aspx/ValidateUser",
                data: JSON.stringify({ username: username, password: password }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d === "success") {
                        alert("Login successful!");
                        window.location.href = "Dashboard.aspx";
                    } else {
                        alert("Invalid username or password.");
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error: " + error);
                }
            });
        }
    </script>
</body>
</html>