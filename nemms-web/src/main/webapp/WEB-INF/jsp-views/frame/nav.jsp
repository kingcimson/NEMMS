<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Left panel : Navigation area -->
<!-- Note: This width of the aside area can be adjusted through LESS variables -->
<aside id="left-panel">

	<!-- User info -->
	<div class="login-info">
		<span> <!-- User image size is adjusted inside CSS, it should stay as it --> 
			<nav>
				<a href="<%=request.getContextPath()%>/profile"> <img
					src="<%=request.getContextPath()%>/assets/img/avatars/male.png" alt="me" class="online" /> 
					<span>${user.name}</span>
				</a>
			</nav>
		</span>
	</div>
	<!-- end user info -->

	<!-- NAVIGATION : This navigation is also responsive

			To make this navigation dynamic please make sure to link the node
			(the reference to the nav > ul) after page load. Or the navigation
			will not initialize.
			-->
	<nav>
		<!-- NOTE: Notice the gaps after each icon usage <i></i>..
				Please note that these links work a bit different than
				traditional href="" links. See documentation for details.
				-->
		<ul>
			${menus}
		</ul>
	</nav>
	<span class="minifyme"> <i class="fa fa-arrow-circle-left hit"></i></span>

</aside>
<!-- END NAVIGATION -->