<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="WebAppSuper4U.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <link href="css/superstyle.css" type ="text/css" rel="stylesheet"/><!--link to external css file-->
</head>
<body>
    <h1>Admin Panel</h1>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True"></asp:Label>
            <asp:Button ID="LogOut" runat="server" Text="Log off" OnClick="LogOut_Click" />

            <!--item manipulation section-->

             <br />
            <br />
            <br />

             <asp:Label ID="Label2" runat="server" Text="Items" Font-Bold="True"></asp:Label>

            <br />
            <br />
            <!--item selection-->
            <asp:DropDownList ID="DDLItems" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemName" OnSelectedIndexChanged="DDLItems_SelectedIndexChanged"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuperWebDB %>" SelectCommand="SELECT [ItemName] FROM [Items]"></asp:SqlDataSource>
            <br />

            <!--item name-->
             <asp:Label ID="Label3" runat="server" Text="Item Name: " Font-Bold="True"></asp:Label>

            <asp:TextBox ID="FoodItemText" runat="server"></asp:TextBox>
            <br />
            <br />

            <!--item department-->
             <asp:Label ID="Label4" runat="server" Text="Department Name: " Font-Bold="True"></asp:Label>

            <asp:TextBox ID="DeptText" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <!--add item-->
            <asp:Button ID="AddItem" runat="server" Text="Add Item" OnClick="AddItem_Click" />
            <br />

            <asp:Label ID="addConfirm" runat="server" Text="item has been added to database" ForeColor="#336600" Font-Size="Large" Font-Bold="True"></asp:Label>

            <br />
            <br />
            <!--delete item-->
            <asp:Button ID="DeleteItem" runat="server" Text="Delete Item" OnClick="DeleteItem_Click" />
            <br />
               <asp:Label ID="delConfirm" runat="server" Text="item has been deleted from the database" ForeColor="#336600" Font-Size="Large" Font-Bold="True"></asp:Label>
            <br />
            <br />
            <!--update item-->
            <asp:Button ID="UpdateItem" runat="server" Text="Update Item" OnClick="UpdateItem_Click" />
             <br />
             <asp:Label ID="updConfirm" runat="server" Text="item has been updated in the database" ForeColor="#336600" Font-Size="Large" Font-Bold="True"></asp:Label>
        </div>
    </form>
</body>
</html>
