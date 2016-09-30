<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
 <jsp:include page="header.jsp" flush="false"/>
 
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
</html>