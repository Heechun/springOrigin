<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="false"/>
<div class="container">
	<div class="col-md-5 col-md-offset-3">
	<form action="loginProcess" method="post">
		<h2>You need to Sign in.</h2>
			<label for="username">ID</label>
		<input type="text" class="form-control" id="username" name="id" />
		<label for="password">Password</label>
		<input type="password" class="form-control" id="password" name="pw" />
		<div class="checkbox">
			<label>
				<input type="checkbox"/>Remember me.
			</label>
		</div>
		<input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign in"/>
	</form>
	</div>
</div>
</body>
</html>