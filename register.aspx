<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebAppSuper4U.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="auto-style1">

             <br />
             <br />
            <!--textboxes to input username and password information-->
             <asp:Label ID="Label1" runat="server" Text="Username: " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="uname1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Password: " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="password1" runat="server"></asp:TextBox>
             <br />
             <br />
            <!--type of user is Customer-->
             <asp:Label ID="Label3" runat="server" Text="UserType: " Font-Bold="True"></asp:Label>
             <asp:DropDownList ID="ddlUserType" runat="server">

            <asp:ListItem Text="Customer"></asp:ListItem>
           
             </asp:DropDownList>
            <!--buttons to register user and return to login page-->
            <br />
            <br />
            <asp:Button ID="regUser" runat="server" OnClick="regUser_Click" Text="Register User" BackColor="#FF3300" Font-Bold="True" />
            <br />
            <br />
            <asp:Button ID="returnLogin" runat="server" OnClick="returnLogin_Click" Text="Return to Login" Font-Bold="True" />
            <br />

                <asp:Label ID="regConfirm" runat="server" Text="Your details have been registered to the system" ForeColor="#006600" Font-Size="Large" Font-Bold="True"></asp:Label>
        </div>
        </div>
    </form>
</body>
</html>
