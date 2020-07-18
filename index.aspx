<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebAppSuper4U.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Super4U Index</title>
       <link href="css/superstyle.css" type ="text/css" rel="stylesheet"/> <!--link to external css file-->
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
      &nbsp;<asp:Label ID="LoggedIn" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;
     <!--button to log out of application-->
     <asp:Button ID="LogOut" runat="server" Text="Log out" OnClick="LogOut_Click" />
        </div>
    </form>
     <h1>Super4U</h1>
<p>
Welcome to Super4U! <br>
 To start your Basket, Go to the Create Order page. <br>
    You can view your order on the View Basket page.
</p>

 

</section>

     <div id ="footer">
      <p> <b> &copy;Copyright 2020 Henrik Auzins </b> </p>
    </div>
</body>
</html>
