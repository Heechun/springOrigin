<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="false"/>
    <h1 class="text-center">This is 500 error page.</h1>
	
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="resources/js/jquery-3.1.0.js"></script>

    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
        <script>
    $(function(){
		$("title").text($("title").text()+" | 500 page");
	});
    </script>
  </body>
</html>