 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="../header.jsp" flush="false"/>
    <h1 class="text-center">게시판</h1>
    <div class="container-fluid">
		<div class="table-responsive col-md-6 col-md-offset-3">
		  <table class="table table-hover table-condensed">
		    <thead>
				<tr height="30">												
					<th class="text-center" width="80">번 호</th>
					<th class="text-center" width="200">제  목</th>
					<th class="text-center" width="100">글쓴이</th>
					<th class="text-center" width="130">날 짜</th>
					<th class="text-center" width="80">조회수</th>
				</tr>
			</thead>
				<tbody>
				<c:forEach var="bbsList" items="${bbsList}">
					<tr height="30">
						<td align="center" width="50">
							${bbsList.idx}
						</td>
						<td width="250" class="text-left">
							<a href="bbsRead.do?idx=${bbsList.idx}&page=${page}">${bbsList.title}</a>
						</td>
						<td align="center">${bbsList.id}</td>
						<td align="center">${bbsList.writeDate}</td>
						<td align="center">${bbsList.hit}</td>
					</tr>
				</c:forEach>
				</tbody>
		  </table>
		  <div class="row">
			  <nav class="col-md-6 col-md-offset-3">
			  	<div class="text-center">
				  <ul class="pagination">
				    <li id="pre" class="">
				      <a href="bbs.do?page=${page-1}" aria-label="Previous" id="aTagPre">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <c:forEach begin="1" end ="${totalPage}" step="1" varStatus="status">
				    	<li id="li${status.index}" class=""><a href="bbs.do?page=${status.index}">${status.index}</a></li>
				    </c:forEach>
				    <li id="next">
				      <a href="bbs.do?page=${page+1}" aria-label="Next" id="aTagNext">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				  </div>
				</nav>
				<div class="col-md-3">
					<div class="pull-right">
						<a class="btn btn-success" href="bbsInsert.do" role="button" style="margin-top: 20px;">글쓰기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		$("title").text($("title").text()+" | "+$("h1").text());
	});
	var page = ${page};
	if(page==1){
		$("#pre").attr("class","disabled");
		$("#aTagPre").removeAttr("href");
	}
	else if(page==${totalPage}){
		$("#next").attr("class","disabled");
		$("#aTagNext").removeAttr("href");
	}
	else{
		$("#pre").removeAttr("class", "disabled");
	}

	$("#li${page}").attr("class", "active");
		
		
	</script>
  </body>
</html>