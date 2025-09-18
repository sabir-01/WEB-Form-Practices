<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Working_with_foreignkey._Default" %>
<head runat="server">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <style type="text/css">
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --glass-bg: rgba(255, 255, 255, 0.25);
            --glass-border: rgba(255, 255, 255, 0.18);
            --shadow-light: rgba(0, 0, 0, 0.1);
            --shadow-medium: rgba(0, 0, 0, 0.15);
            --text-dark: #2d3748;
            --text-light: #718096;
        }

        * {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        }

        body {
            background: var(--primary-gradient);
            min-height: 100vh;
            padding: 20px 0;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(120, 119, 198, 0.2) 0%, transparent 50%);
            pointer-events: none;
            z-index: -1;
        }

        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto 40px;
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid var(--glass-border);
            padding: 40px;
            border-radius: 24px;
            box-shadow: 
                0 8px 32px var(--shadow-light),
                0 0 0 1px rgba(255, 255, 255, 0.05) inset;
            position: relative;
            overflow: hidden;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
        }

        .form-title {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 2rem;
            color: #ffffff;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .form-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: var(--secondary-gradient);
            border-radius: 2px;
        }

        .form-label {
            font-weight: 600;
            color: #ffffff !important;
            margin-bottom: 8px;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .form-select, .form-control {
            border: 1px solid rgba(255, 255, 255, 0.2) !important;
            background: rgba(255, 255, 255, 0.1) !important;
            backdrop-filter: blur(10px);
            color: #ffffff !important;
            padding: 14px 16px !important;
            border-radius: 12px !important;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            font-weight: 500;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .form-select:focus, .form-control:focus {
            border-color: rgba(255, 255, 255, 0.4) !important;
            box-shadow: 
                0 0 0 3px rgba(255, 255, 255, 0.1),
                0 4px 12px rgba(0, 0, 0, 0.15) !important;
            background: rgba(255, 255, 255, 0.15) !important;
            transform: translateY(-1px);
        }

        .form-select option {
            background: var(--text-dark) !important;
            color: #ffffff !important;
            padding: 8px;
        }

        .btn-primary {
            background: var(--secondary-gradient) !important;
            border: none !important;
            padding: 16px 32px !important;
            border-radius: 50px !important;
            font-weight: 600 !important;
            font-size: 1.1rem !important;
            letter-spacing: 0.5px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .btn-primary:hover {
            transform: translateY(-3px) !important;
            box-shadow: 0 8px 25px rgba(245, 87, 108, 0.4) !important;
        }

        .btn-primary:hover::before {
            left: 100%;
        }

        .btn-primary:active {
            transform: translateY(-1px) !important;
        }

        .validation-error {
            color: #ff6b6b !important;
            font-size: 0.875rem !important;
            margin-top: 6px !important;
            font-weight: 500 !important;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .grid-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 
                0 8px 32px var(--shadow-medium),
                0 0 0 1px rgba(255, 255, 255, 0.1) inset;
            margin-top: 40px;
        }

        .table {
            margin-bottom: 0 !important;
            border-radius: 12px !important;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .table thead th {
            background: var(--primary-gradient) !important;
            color: #ffffff !important;
            border: none !important;
            padding: 18px !important;
            font-weight: 600 !important;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.875rem;
        }

        .table tbody tr {
            transition: all 0.2s ease;
        }

        .table tbody tr:hover {
            background: rgba(102, 126, 234, 0.05) !important;
            transform: scale(1.01);
        }

        .table tbody td {
            padding: 16px 18px !important;
            vertical-align: middle !important;
            border-color: rgba(0, 0, 0, 0.05) !important;
            font-weight: 500;
            color: var(--text-dark);
        }

        .input-group {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.7);
            z-index: 10;
            pointer-events: none;
        }

        .form-select.with-icon, .form-control.with-icon {
            padding-left: 45px !important;
        }

        @media (max-width: 768px) {
            .form-container {
                margin: 20px;
                padding: 30px 25px;
                border-radius: 20px;
            }
            
            .form-title {
                font-size: 1.75rem;
            }
            
            .grid-container {
                margin: 20px;
                padding: 20px;
                border-radius: 16px;
            }
            
            .table {
                font-size: 0.875rem;
            }
            
            .table thead th,
            .table tbody td {
                padding: 12px 10px !important;
            }
        }

        .fade-in {
            animation: fadeInUp 0.6s cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .loading-spinner {
            display: inline-block;
            width: 16px;
            height: 16px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: #ffffff;
            animation: spin 1s linear infinite;
            margin-left: 8px;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
            <div class="form-container fade-in">
                <h3 class="form-title">
                    <i class="fas fa-map-marker-alt" style="margin-right: 12px; color: #f5576c;"></i>
                    Select Location
                </h3>
                
                <div class="mb-4">
                    <label for="CountryDropDownList" class="form-label">
                        <i class="fas fa-globe"></i>
                        Country
                    </label>
                    <div class="input-group">
                        <i class="fas fa-flag input-icon"></i>
                        <asp:DropDownList ID="CountryDropDownList" runat="server" 
                            CssClass="form-select with-icon"
                            AutoPostBack="True" 
                            OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="CountryDropDownList"
                        Display="Dynamic" 
                        ErrorMessage="<i class='fas fa-exclamation-circle'></i> Country Required" 
                        CssClass="validation-error"
                        InitialValue="select country">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="mb-4">
                    <label for="CityDropDownList" class="form-label">
                        <i class="fas fa-city"></i>
                        City
                    </label>
                    <div class="input-group">
                        <i class="fas fa-building input-icon"></i>
                        <asp:DropDownList ID="CityDropDownList" runat="server" CssClass="form-select with-icon">
                        </asp:DropDownList>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="CityDropDownList" 
                        Display="Dynamic" 
                        ErrorMessage="<i class='fas fa-exclamation-circle'></i> City Required" 
                        CssClass="validation-error"
                        InitialValue="select City">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="d-grid">
                    <asp:Button ID="SubmitButton" runat="server" 
                        Text="Submit Selection" 
                        CssClass="btn btn-primary btn-lg" 
                        OnClick="SubmitButton_Click" />
                </div>
            </div>

            <div class="grid-container fade-in">
                <h4 style="color: var(--text-dark); margin-bottom: 25px; font-weight: 600; display: flex; align-items: center; gap: 10px;">
                    <i class="fas fa-table" style="color: #667eea;"></i>
                    Selection History
                </h4>
                <asp:GridView ID="GridView1" runat="server" 
                    CssClass="table table-hover"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="log_id" HeaderText="ID" />
                        <asp:BoundField DataField="country_name" HeaderText="Country" />
                        <asp:BoundField DataField="city_name" HeaderText="City" />
                        <asp:BoundField DataField="selected_date" HeaderText="Selected Date/Time" />

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add loading animation to submit button
        document.addEventListener('DOMContentLoaded', function () {
            const submitBtn = document.querySelector('#SubmitButton');
            if (submitBtn) {
                submitBtn.addEventListener('click', function () {
                    this.innerHTML = 'Processing <span class="loading-spinner"></span>';
                });
            }
        });

        // Add smooth scroll animation for form validation
        function scrollToError() {
            const firstError = document.querySelector('.validation-error:not([style*="display: none"])');
            if (firstError) {
                firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }
    </script>
</body>