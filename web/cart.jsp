<%-- 
    Document   : cart
    Created on : Dec 13, 2023, 11:17:57 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shop's House</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/global.css" rel="stylesheet">
	<link href="css/cart.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Amaranth&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Alata&display=swap" rel="stylesheet">
	<script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  
<body>
<section id="top">
 <div class="container">
  <div class="row">
   <div class="top_1 clearfix">
    <div class="col-sm-3">
	 <div class="top_1l clearfix">
	  <h5 class="mgt"><i class="fa fa-headphones col_1"></i> <a href="#"> +091 (123) 456-789</a></h5>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="top_1l clearfix">
	  <h5 class="mgt"><i class="fa fa-envelope col_1"></i> <a href="#"> info@gmail.com</a></h5>
	 </div>
	</div>
	<div class="col-sm-6">
	 <div class="top_1r text-right clearfix">
	  <ul class="mgt">
	   <li><i class="fa fa-map-marker col_1"></i> <a href="#"> Store location</a></li>
	   <li><i class="fa fa-clock-o col_1"></i> <a href="#"> Daily deal</a></li>
	   <li><i class="fa fa-user col_1"></i> <a href="#"> My account</a></li>
	   <li class="border_none"><i class="fa fa-power-off col_1"></i> <a href="#"> Login</a></li>
	  </ul>
	 </div>
	</div>
   </div>
  </div>
 </div>
</section>

<section id="header">
 <div class="container">
  <div class="row">
   <div class="header_1 clearfix">
    <div class="col-sm-2">
	 <div class="header_1l clearfix">
	  <h3><a href="DispathController?page=Home">Shop's House</a></h3>
	 </div>
	</div>
	<div class="col-sm-7">
	 <div class="header_1m text-center clearfix">
	 <select class="form-control form_1">
				 <option>All Category</option>
				 <option>Watch</option>
				 <option>Mobile</option>
				 <option>Kids</option>
				 <option>Fashion</option>
			 </select>
	  <div class="input-group">
					<input type="text" class="form-control form_2" placeholder="Search Products Here...">
					<span class="input-group-btn">
						<button class="btn btn-primary" type="button">
							<i class="fa fa-search"></i></button>
					</span>
      </div>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="header_1r clearfix">
	  <ul class="nav navbar-nav mgt navbar-right">
				<li><a class="tag_m1" href="#"><i class="fa fa-heart-o"></i></a></li>
				<li><a class="tag_m1" href="#"><i class="fa fa-user"></i></a></li>
				<li class="dropdown">
					  <a class="tag_m1" href="#" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-shopping-bag"></i></a>
					  <ul class="dropdown-menu drop_1" role="menu">
						<li>
						 <div class="drop_1i clearfix">
						  <div class="col-sm-6">
						   <div class="drop_1il clearfix"><h5 class="mgt">2 ITEMS</h5></div>
						  </div>
						  <div class="col-sm-6">
						   <div class="drop_1il text-right clearfix"><h5 class="mgt"><a href="#">VIEW CART</a></h5></div>
						  </div>
						 </div>
						 <div class="drop_1i1 clearfix">
						  <div class="col-sm-8">
						   <div class="drop_1i1l clearfix"><h6 class="mgt bold"><a href="#">Nulla Quis</a> <br> <span class="normal col_2">1x - $89.00</span> <br> <span><i class="fa fa-remove"></i></span></h6></div>
						  </div>
						  <div class="col-sm-4">
						   <div class="drop_1i1r text-right clearfix"><a href="#"><img src="img/1.jpg" class="iw" alt="abc"></a></div>
						  </div>
						 </div>
						 <div class="drop_1i1 clearfix">
						  <div class="col-sm-8">
						   <div class="drop_1i1l clearfix"><h6 class="mgt bold"><a href="#">Eget Nulla</a> <br> <span class="normal col_2">1x - $49.00</span> <br> <span><i class="fa fa-remove"></i></span></h6></div>
						  </div>
						  <div class="col-sm-4">
						   <div class="drop_1i1r text-right clearfix"><a href="#"><img src="img/2.jpg" class="iw" alt="abc"></a></div>
						  </div>
						 </div>
						 <div class="drop_1i2 clearfix">
						  <div class="col-sm-6">
						   <div class="drop_1il clearfix"><h5 class="mgt">TOTAL</h5></div>
						  </div>
						  <div class="col-sm-6">
						   <div class="drop_1il text-right clearfix"><h5 class="mgt">$138.00</h5></div>
						  </div>
						 </div>
						 <div class="drop_1i3 text-center clearfix">
						  <div class="col-sm-12">
						   <h5><a class="button" href="#">CHECKOUT</a></h5>
						  </div>
						 </div>
						</li>
					  </ul>
                    </li>
			    </ul>
	 </div>
	</div>
   </div>
  </div>
 </div>
</section>

<section id="menu" class="clearfix cd-secondary-nav">
	<nav class="navbar nav_t">
		<div class="container">
		    <div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="DispathController?page=Home"> Shop's House </a>
			</div>
			<!-- Brand and toggle get grouped for better mobile display -->
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				<li class="dropdown">
					  <a class="m_tag1" href="#" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-bars"></i> CATEGORIES</a>
					  <ul class="dropdown-menu drop_2" role="menu">
						<li><a href="#">New Arrivals</a></li>
						<li><a href="#">Best Selling</a></li>
						<li><a href="#">Accessories</a></li>
						<li><a href="#">Top 100 Offer</a></li>
						<li><a href="#">Sunglass</a></li>
						<li><a href="#">Watch</a></li>
						<li><a href="#">Man’s Product</a></li>
						<li><a href="#">Ladies</a></li>
						<li><a href="#">Sunglass</a></li>
						<li><a href="#">Watch</a></li>
						<li><a href="#">Man’s Product</a></li>
					  </ul>
                    </li>
				<li><a class="m_tag" href="index.jsp">Home</a></li>
				<li class="dropdown">
					  <a class="m_tag" href="#" data-toggle="dropdown" role="button" aria-expanded="false">Product<span class="caret"></span></a>
					  <ul class="dropdown-menu drop_3" role="menu">
						<li><a href="product.jsp">Product</a></li>
						<li><a class="border_none" href="detail.jsp">Product Detail</a></li>
					  </ul>
                    </li>
				<li class="dropdown">
					  <a class="m_tag" href="#" data-toggle="dropdown" role="button" aria-expanded="false">Blog<span class="caret"></span></a>
					  <ul class="dropdown-menu drop_3" role="menu">
						<li><a href="blog.jsp">Blog</a></li>
						<li><a class="border_none" href="blog_detail.jsp">Blog Detail</a></li>
					  </ul>
                    </li>
				<li><a class="m_tag" href="contact.jsp">Contact</a></li>
				<li><a class="m_tag active_tab" href="cart.jsp">Cart</a></li>
				<li><a class="m_tag" href="checkout.jsp">Checkout</a></li>
			</ul>
		    	
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	</section>
	
<section id="center" class="center_shop clearfix">
 <div class="container">
  <div class="row">
    <div class="center_shop_1 clearfix">
	 <div class="col-sm-12">
	  <h5 class="mgt">
	   <a href="#">Home <i class="fa fa-long-arrow-right"></i> </a>
	   <a href="#">Cart</a>
	  </h5>
	 </div>
	</div>
  </div>
 </div>
</section>

<section id="cart" class="clearfix">
 <div class="container">
  <div class="row">
    <div class="cart_1 clearfix">
	 <div class="col-sm-2">
	   <div class="cart_1i clearfix">
	    <h4 class="mgt col">PRODUCT</h4> 
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_1i clearfix">
	    <h4 class="mgt col">NAME</h4> 
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_1i clearfix">
	    <h4 class="mgt col">UNIT PRICE</h4> 
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_1i clearfix">
	    <h4 class="mgt col">QUANTITY</h4> 
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_1i clearfix">
	    <h4 class="mgt col">TOTAL</h4> 
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_1i clearfix">
	    <h4 class="mgt col"><i class="fa fa-trash"></i></h4> 
	   </div>
	 </div>
	</div>
	<div class="cart_2 clearfix">
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
	    <img src="img/42.jpg" class="iw" alt="abc">
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
	    <h4 class="mgt"><a href="#">Women Dress</a></h4>
		<p>Maboriosam in a tonto nesciung eget distingy magndapibus.</p>
	   </div>
	 </div>
     <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		<p class="mgt">$120.00</p>
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		<div class="input-group number-spinner">
				<span class="input-group-btn">
					<button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
				</span>
				<input type="text" class="form-control text-center" value="1">
				<span class="input-group-btn">
					<button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
				</span>
			</div>
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		 <p class="mgt">$310.78</p>
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		 <p class="mgt"><a href="#"><i class="fa fa-trash"></i></a></p>
	   </div>
	 </div>
	</div>
	<div class="cart_2 clearfix">
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
	    <img src="img/43.jpg" class="iw" alt="abc">
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
	    <h4 class="mgt"><a href="#">Women Dress</a></h4>
		<p>Maboriosam in a tonto nesciung eget distingy magndapibus.</p>
	   </div>
	 </div>
     <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		<p class="mgt">$120.00</p>
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		<div class="input-group number-spinner">
				<span class="input-group-btn">
					<button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
				</span>
				<input type="text" class="form-control text-center" value="1">
				<span class="input-group-btn">
					<button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
				</span>
			</div>
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		 <p class="mgt">$310.78</p>
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		 <p class="mgt"><a href="#"><i class="fa fa-trash"></i></a></p>
	   </div>
	 </div>
	</div>
	<div class="cart_2 clearfix">
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
	    <img src="img/44.jpg" class="iw" alt="abc">
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
	    <h4 class="mgt"><a href="#">Women Dress</a></h4>
		<p>Maboriosam in a tonto nesciung eget distingy magndapibus.</p>
	   </div>
	 </div>
     <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		<p class="mgt">$120.00</p>
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		<div class="input-group number-spinner">
				<span class="input-group-btn">
					<button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
				</span>
				<input type="text" class="form-control text-center" value="1">
				<span class="input-group-btn">
					<button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
				</span>
			</div>
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		 <p class="mgt">$310.78</p>
	   </div>
	 </div>
	 <div class="col-sm-2">
	   <div class="cart_2i clearfix">
		 <p class="mgt"><a href="#"><i class="fa fa-trash"></i></a></p>
	   </div>
	 </div>
	</div>
	<div class="cart_3 clearfix">
	 <div class="col-sm-4 space_left">
	  <div class="cart_3i clearfix">
	   <input class="form-control" placeholder="Enter Your Coupon" type="text">
	   <h6 class="mgt"><a class="button mgt" href="#">APPLY</a></h6>
	   <h5><input type="checkbox"> Shipping (+20$)</h5>
	  </div>
	 </div>
	 <div class="col-sm-4 space_left">
	  <div class="cart_3i clearfix">

	  </div>
	 </div>
	 <div class="col-sm-4 space_left">
	  <div class="cart_3i1 clearfix">
	   <h5>Cart Subtotal <span class="pull-right">$430.00</span></h5>
	   <h5>Shipping <span class="pull-right">Free</span></h5>
	   <h5>You Save <span class="pull-right">$40.00</span></h5>
	   <hr>
	   <h5>You Pay <span class="pull-right">$390.00</span></h5><br>
	   <h6><a class="button" href="checkout.jsp">CHECKOUT</a></h6>
	   <h6><a class="button" href="#">CONTINUE SHOPPING</a></h6>
	  </div>
	 </div>
	</div>
  </div>
 </div>
</section>

<section id="enquiry">
 <div class="container">
  <div class="row">
    <div class="enquiry_1 text-center clearfix">
	 <div class="col-sm-12">
	  <h4 class="mgt">NEWSLETTER</h4>
	  <p>Subscribe to our newsletter and get <span class="col_1">20%</span> off your first purchase</p>
	  <div class="input-group">
		<input type="text" class="form-control form_2" placeholder="Your Email">
		<span class="input-group-btn">
			<button class="btn btn-primary" type="button">
				SUBSCRIBE</button>
		</span>
      </div>
	 </div>
	</div>
  </div>
 </div>
</section>

<section id="shipping">
 <div class="container">
  <div class="row">
   <div class="shipping_1 clearfix">
    <div class="col-sm-3">
	 <div class="shipping_1i clearfix">
	  <span><i class="fa fa-rocket"></i></span>
	  <h5 class="mgt">FREE SHIPING <br> <span class="col_2">Orders over $100</span></h5>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="shipping_1i clearfix">
	  <span><i class="fa fa-recycle"></i></span>
	  <h5 class="mgt">FREE RETURN <br> <span class="col_2">Within 30 days returns</span></h5>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="shipping_1i clearfix">
	  <span><i class="fa fa-lock"></i></span>
	  <h5 class="mgt">SUCURE PAYMENT <br> <span class="col_2">100% secure payment</span></h5>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="shipping_1i clearfix">
	  <span><i class="fa fa-tags"></i></span>
	  <h5 class="mgt">BEST PEICE <br> <span class="col_2">Guaranteed price</span></h5>
	 </div>
	</div>
   </div>
  </div>
 </div>
</section>

<section id="footer">
 <div class="container">
  <div class="row">
   <div class="footer_1 clearfix">
    <div class="col-sm-3">
	 <div class="footer_1i clearfix">
	   <h3 class="mgt"><a href="DispathController?page=Home">Shop's House</a></h3>
	   <p> Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
	   <p>Got Question? Call us 24/7</p>
	   <h4 class="mgt"><a class="col_1" href="#">+0123 456 789</a></h4>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="footer_1i1 clearfix">
      <h4 class="mgt">Useful links</h4>
	  <ul class="normal">
	   <li><a href="#">How it works</a></li>
	   <li><a href="#">About us</a></li>
	   <li><a href="#">Babysitters</a></li>
	   <li><a href="#">Contact us</a></li>
	  </ul>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="footer_1i1 clearfix">
      <h4 class="mgt">My Account</h4>
	  <ul class="normal">
	   <li><a href="#">Track my order</a></li>
	   <li><a href="#">Terms of use</a></li>
	   <li><a href="#">Wishlist</a></li>
	   <li><a href="#">Submit Your feedback</a></li>
	  </ul>
	 </div>
	</div>
	<div class="col-sm-3">
	 <div class="footer_1i2 clearfix">
      <h4 class="mgt">Get In Tuch</h4>
	  <p>NO. 172 - Kingdom Oxford Street.<br>
000 United Kingdom.<br>
info@gmail.com<br>
+012 3456 7890</p>
      <ul class="social-network social-circle">
                        <li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
	 </div>
	</div>
   </div>
  </div>
 </div>
</section>

<section id="footer_last">
 <div class="container">
  <div class="row">
   <div class="footer_last text-center clearfix">
    <div class="col-sm-12">
	  <p class="mgt">© 2013 Your Website Name. All Rights Reserved | Design by <a class="col_1" href="http://www.templateonweb.com">TemplateOnWeb</a></p>
	</div>
   </div>
  </div>
 </div>
</section>

<script>
$(document).ready(function(){
	/*****Fixed Menu******/
	var secondaryNav = $('.cd-secondary-nav'),
	   secondaryNavTopPosition = secondaryNav.offset().top;
		$(window).on('scroll', function(){
			if($(window).scrollTop() > secondaryNavTopPosition ) {
				secondaryNav.addClass('is-fixed');	
			} else {
				secondaryNav.removeClass('is-fixed');
			}
		});	
		
});
</script>

<script type="text/javascript">
	$(document).on('click', '.number-spinner button', function () {    
	var btn = $(this),
		oldValue = btn.closest('.number-spinner').find('input').val().trim(),
		newVal = 0;
	
	if (btn.attr('data-dir') == 'up') {
		newVal = parseInt(oldValue) + 1;
	} else {
		if (oldValue > 1) {
			newVal = parseInt(oldValue) - 1;
		} else {
			newVal = 1;
		}
	}
	btn.closest('.number-spinner').find('input').val(newVal);
});
	</script>
</body>
 
</html>
