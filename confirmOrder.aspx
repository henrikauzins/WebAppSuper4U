<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmOrder.aspx.cs" Inherits="WebAppSuper4U.confirmOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirm Order</title>
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
       <nav>

<ul><!--webpage navigation bar-->
  <li><a href="index.aspx"class="active">Home</a></li>
    <li><a href="createOrder.aspx"class="active">Create Order</a></li>
    <li><a href="viewBasket.aspx"class="active">View Basket</a></li>
      

</ul>
</nav>
    <form id="form1" runat="server">
        <div>
            <section class="sec1"> </section>
<section class="content">
   
   
        
     <h1>Confirm Order</h1>
    <asp:DropDownList ID="Purchased" runat="server">
                <asp:ListItem>Yes</asp:ListItem>
      </asp:DropDownList>
     <br />
     <br />
     <asp:TextBox ID="basketIdentity" runat="server"></asp:TextBox>
     <br />
     <br />
    <!--button to confirm customer order to be placed-->
  <asp:Button ID="confirmPurchase" runat="server" Text="Confirm Order" BackColor="Red" Font-Bold="True" Height="80px" OnClick="confirmPurchase_Click" Width="197px" />
        

 

</section>
            </div>
    </form>

     <div id ="footer">
      <p> <b> &copy;Copyright 2020 Henrik Auzins </b> </p>
    </div>
            
   
        
</body>
</html>
