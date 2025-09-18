<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Working_Ajax.Employees" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Employees</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2>Manage Employees</h2>
        <hr />

        <div class="row mb-3">
            <div class="col-md-4">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Employee Name"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Employee Email"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="col-md-1">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-success w-100" OnClick="btnAdd_Click" />
            </div>
        </div>

        <asp:GridView ID="gvEmployees" runat="server" CssClass="table table-bordered table-striped"
            AutoGenerateColumns="False" DataKeyNames="EmpId"
            OnRowEditing="gvEmployees_RowEditing"
            OnRowCancelingEdit="gvEmployees_RowCancelingEdit"
            OnRowUpdating="gvEmployees_RowUpdating"
            OnRowDeleting="gvEmployees_RowDeleting">
            
            <Columns>
                <asp:BoundField DataField="EmpId" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="DeptName" HeaderText="Department" ReadOnly="True" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>