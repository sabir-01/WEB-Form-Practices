<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Working_with_foreignkey._Default" %>

<head runat="server">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style type="text/css">
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        }
        .form-title {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #0d6efd;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h3 class="form-title">Select Location</h3>
            <div class="mb-3">
                <label for="CountryDropDownList" class="form-label">Country</label>
                <asp:DropDownList ID="CountryDropDownList" runat="server" 
                    CssClass="form-select"
                    AutoPostBack="True" 
                    OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="CountryDropDownList"
                    Display="Dynamic" 
                    ErrorMessage="Country Required" 
                    ForeColor="Red" 
                    InitialValue="select country">
                </asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="CityDropDownList" class="form-label">City</label>
                <asp:DropDownList ID="CityDropDownList" runat="server" CssClass="form-select">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="CityDropDownList" 
                    Display="Dynamic" 
                    ErrorMessage="City Required" 
                    ForeColor="Red" 
                    InitialValue="select City">
                </asp:RequiredFieldValidator>
            </div>

            <div class="d-grid">
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </form>

    <!-- Bootstrap JS (optional for dropdown animations) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
