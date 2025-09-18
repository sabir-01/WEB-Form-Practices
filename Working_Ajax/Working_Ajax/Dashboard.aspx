<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Working_Ajax.Dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form runat="server" class="container mt-5">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

        <h2>Welcome, <asp:Label ID="lblWelcome" runat="server"></asp:Label></h2>
        <br />
        <a href="Employees.aspx" class="btn btn-primary">Manage Employees</a>
        <br /><br />
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger" OnClick="btnLogout_Click" />
   
                </ContentTemplate>
        </asp:UpdatePanel>
    
    </form>
</body>
</html>

