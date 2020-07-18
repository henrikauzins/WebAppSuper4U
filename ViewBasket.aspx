<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBasket.aspx.cs" Inherits="WebAppSuper4U.ViewBasket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Basket</title>
       <link href="css/superstyle.css" type ="text/css" rel="stylesheet"/> <!--link to external css file-->
       <!--javascript functionality for navigation bar-->
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<script type="text/javascript">
    $(window).on('scroll', function () {
        if ($(window).scrollTop()) {
            $('nav').addClass('black');
        }
        else {
            $('nav').removeClass('black');
        }
    })
</script>
</head>
<body>
    
         <!--webpage navigation bar-->
      <nav>

<ul>
  <li><a href="index.aspx"class="active">Home</a></li>
    <li><a href="createOrder.aspx"class="active">Create Order</a></li>
    <li><a href="viewBasket.aspx"class="active">View Basket</a></li>
      

</ul>
</nav>
    <form id="form1" runat="server">
        <div>
            <section class="sec1"> </section>
<section class="content">
      <h2>Order Summary</h2>
    <!--summary of order through usage of gridview-->
    <p> You can choose to purchase your basket or remove items from the basket</p>
     <asp:GridView ID="BasketGridView" runat="server" Height="203px" Width="433px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ItemBasketId" OnSelectedIndexChanged="BasketGridView_SelectedIndexChanged">
         <Columns>
             <asp:CommandField ShowSelectButton="True" />
             <asp:BoundField DataField="ItemBasketId" HeaderText="ItemBasketId" InsertVisible="False" ReadOnly="True" SortExpression="ItemBasketId" />
             <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
             <asp:BoundField DataField="FoodDept" HeaderText="FoodDept" SortExpression="FoodDept" />
             <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
             <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
         </Columns>
            </asp:GridView>

               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuperWebDB %>" SelectCommand="SELECT ItemBasket.ItemBasketId, Items.ItemName, Items.FoodDept, ItemBasket.Quantity, Customer.CustomerName FROM Customer INNER JOIN Basket ON Customer.CustomerId = Basket.CustomerId INNER JOIN ItemBasket ON Basket.BasketId = ItemBasket.BasketId INNER JOIN Items ON ItemBasket.ItemId = Items.ItemId"></asp:SqlDataSource>
      <asp:Label ID="emptyBasket" runat="server" Text="You cannot proceed to order confirmation if basket is empty" Font-Bold="True" Font-Size="Large" ForeColor="#FF3300"></asp:Label>
    <asp:Label ID="emptyConfirm" runat="server" Text="You cannot delete item if no item exists" Font-Bold="True" Font-Size="Large" ForeColor="#FF3300"></asp:Label>
            <br />
            <asp:DropDownList ID="NoPurchase" runat="server">
                <asp:ListItem>No</asp:ListItem>
      </asp:DropDownList>
            <br />
      <asp:TextBox ID="basketID" runat="server"></asp:TextBox>
            <br />
    <!--button to purchase order-->
               <asp:Button ID="purchaseBasket" runat="server" Text="Purchase Basket" OnClick="purchaseBasket_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <!--button to delete item from basket-->
    <asp:Button ID="deleteBasket" runat="server" Text="Delete Item from basket" OnClick="deleteBasket_Click" />
      &nbsp;&nbsp;
    <asp:Label ID="itemDeletion" runat="server" Text="selected item has been deleted from basket" Font-Bold="True" Font-Size="Large" ForeColor="#FF3300"></asp:Label>
        </div>
    </form>
     


 

</section>

     <div id ="footer">
      <p> <b> &copy;Copyright 2020 Henrik Auzins </b> </p>
    </div>
</body>
</html>
