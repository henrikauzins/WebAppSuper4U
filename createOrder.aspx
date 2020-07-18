<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createOrder.aspx.cs" Inherits="WebAppSuper4U.createOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Super4U - Create Order</title>
        <link href="css/superstyle.css" type ="text/css" rel="stylesheet"> <!--link to external css file-->
       <!--javascript functionality for navigation bar-->
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<script type="text/javascript">
  $(window).on('scroll', function(){
if($(window).scrollTop()){
$('nav').addClass('black');
}
else
 {
  $('nav').removeClass('black');
}
})
</script>
</head>
<body>
        <!--navigation bar-->
      <nav>

<ul>
  <li><a href="index.aspx"class="active">Home</a></li>
    <li><a href="createOrder.aspx"class="active">Create Order</a></li>
    <li><a href="viewBasket.aspx"class="active">View Basket</a></li>
      

</ul>
</nav>
    <form id="form1" runat="server">
        <div>
             <!--section 1-->
<section class="sec1"> </section>
<section class="content">

<h1>Super4U</h1>

    <p>
        Create your Order!

        You must create an order first before going to the view basket page
        </p>
   
    <br />

    <br />
    <br />
    <br />

    <br />
    &nbsp;&nbsp;&nbsp;
    <br />

     <!--construction of order-->
    &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" runat="server" Text="Search by Department: "></asp:Label>

    <!--shows list of food departments-->
&nbsp;<asp:DropDownList ID="ddlTest" runat="server" AutoPostBack="True" Height="17px" Width="231px" OnSelectedIndexChanged="ddlTest_SelectedIndexChanged">
    <asp:ListItem Text="----Select Department----" Value=""></asp:ListItem>
        <asp:ListItem Text="Fruit" Value="1"></asp:ListItem>
        <asp:ListItem Text="Bread" Value="2"></asp:ListItem>
        <asp:ListItem Text="Drinks" Value="3"></asp:ListItem>
        <asp:ListItem Text="Soft Drinks" Value="4"></asp:ListItem>
        <asp:ListItem Text="Pasta" Value="5"></asp:ListItem>
        <asp:ListItem Text="Baking" Value="6"></asp:ListItem>
</asp:DropDownList>
    <br />

    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="Search by Item: "></asp:Label>
    &nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemName" Height="102px" Width="302px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;<br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuperWebDB %>" SelectCommand="SELECT [ItemName], [ItemId] FROM [Items]"></asp:SqlDataSource>
    <asp:Label ID="Label7" runat="server" Text="Item Id: "></asp:Label>
    &nbsp;<asp:TextBox ID="ItemIDText" runat="server"></asp:TextBox>
    
    <br />
&nbsp;&nbsp;&nbsp;
    
  
    <br />
    
    <asp:Label ID="Label6" runat="server" Text="Quantity: "></asp:Label>
    <!--how much of the item the customer wants-->
    <asp:DropDownList ID="ItemQuantity" runat="server">
        <asp:ListItem Text="----how much of item would you like?----" Value=""></asp:ListItem>
        <asp:ListItem Text="1" Value="1"></asp:ListItem>
        <asp:ListItem Text="2" Value="2"></asp:ListItem>
        <asp:ListItem Text="3" Value="3"></asp:ListItem>
        <asp:ListItem Text="4" Value="4"></asp:ListItem>
        <asp:ListItem Text="5" Value="5"></asp:ListItem>
        <asp:ListItem Text="6" Value="6"></asp:ListItem>

    </asp:DropDownList>
  
    <br />
    <br />
    
    <br />
    <br />
    <br />
     <!--adds item to order-->
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

     <!--confirms that item is placed in the basket-->
    <br />
       
    <br />
    <asp:Label ID="Label3" runat="server" Text="Customer Details:" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Customer Name:"></asp:Label>
    <asp:TextBox ID="customerName" runat="server" Width="176px"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Date:"></asp:Label>
    <asp:TextBox ID="dateText" runat="server" Width="177px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="addItem" runat="server" Text="Add to Order" OnClick="addItem_Click" />
    <br />
        <asp:Label ID="addItemConfirm" runat="server" Text="Item has been added to your basket" ForeColor="#006600" Font-Size="Large" Font-Bold="True"></asp:Label>
    <br />
    

</section>

        </div>
    </form>

      <div id ="footer">
      <p> <b> ©Copyright 2020 Henrik Auzins </b> </p>
    </div>
</body>
</html>
