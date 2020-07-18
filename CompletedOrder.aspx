<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompletedOrder.aspx.cs" Inherits="WebAppSuper4U.CompletedOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Complete</title>
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

    <!--confirming that the customer's order has been placed-->
            <asp:Label ID="orderConfirmed" runat="server" Text="Your order has been completed" ForeColor="#006600" Font-Size="X-Large" Font-Bold="True"></asp:Label>
            <br />
            <br />
            <asp:Button ID="returnToIndex" runat="server" Text="Go to home page" BackColor="Red" Font-Bold="True" Height="41px" OnClick="returnToIndex_Click" Width="173px" />
    </section>
        </div>
    </form>
</body>
</html>
