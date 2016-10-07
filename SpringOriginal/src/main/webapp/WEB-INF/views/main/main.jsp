<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="../header.jsp" flush="false"/>
 
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="center-block" src="resources/images/Lighthouse.jpg" alt="image1">
      <div class="carousel-caption">
      	<h3>Lighthouse<small>  등대</small></h3>
      </div>
    </div>
    <div class="item">
      <img class="center-block" src="resources/images/Penguins.jpg" alt="image2">
      <div class="carousel-caption">
       <h3>Penguins<small>  팽귄</small></h3>
      </div>
    </div>
<!--     전체설명 -->
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    <h1 class="text-center">This is main page.</h1>
  	
  </body>
  <footer>
  	<c:if test="${admin==null}">
  		<a class="pull-right" data-toggle="modal" data-target="#managerLoginModal">Manager login</a>
  	</c:if>
  </footer>
  <!-- Modal -->
<div class="modal fade" id="managerLoginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content text-center">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Manager Login</h4>
      </div>
      <div class="modal-body">
	      <div class="form-group">
			<label for="inputId">ID</label>
			<input type="text" id="inputId" name="inputId"/>
		</div>
		<div class="form-group">
			<label for="inputPassword">Password</label>
			<input type="password" id="inputPassword" name="inputPassword"/>
	    </div>
	    <p id="loginStatus"></p>
    </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		<button type="button" class="btn btn-success" onclick="managerSignup()">Registration</button>
		<button type="button" class="btn btn-primary" onclick="managerLogin()">Sign in</button>
      </div>
    </div>
  </div>
</div>

	<script>
	$('input[type=password]').on('keyup', function(e) {
	  if (e.which == 13) {
	        managerLogin();
	    }
	});
	$('#managerLoginModal').on('shown.bs.modal', function () {
		$('#inputId').val("");
		$('#inputPassword').val("");
	    $('#inputId').focus();
	});
	function managerLogin(){
		var inputId = $("#inputId").val();
		var inputPassword = $("#inputPassword").val();

		$.ajax({
			url:'loginCheck.do',
			method : 'post',
            dataType:'json',
            data:{
            	inputId : inputId,
            	inputPassword : inputPassword 
            },
            success:function(data){            	
            	var status = data.loginStatus;
            	console.log(status);
            	if(status == 0){
            		$('#loginStatus').text("아이디를 확인하세요");	
            	}
            	else if(status == 1){
            		$('#loginStatus').text("로그인 성공");
            		 alert("로그인 성공");
        			 location.href = "managerMain.do";
            	}
            	else if(status == 2){
            		$('#loginStatus').text("비밀번호를 확인하세요");
            	}
            	else {
            		$('#loginStatus').text("알수없는 오류");
            	}
            }
		});
	}
  </script>
</html>