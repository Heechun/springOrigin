<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="../header.jsp" flush="false"/>
<div class="col-md-8 col-md-offset-2">
	<div>
		<h2 class="text-center page-header">글읽기</h2>
	</div>
	<div>
		<table class=" table table-bordered table-striped" >
			<tr>
				<th id="contentHead" width="50" class="warning text-center">번 호</th>
				<td align="center" width="50">${bbsVo.idx}</td>
				<th id="contentHead" width="100" class="warning text-center">작성자</th>
				<td>${bbsVo.id}</td>
				<th id="contentHead" width="80" class="warning text-center">조회수</th>
				<td align="center" width="150">${bbsVo.hit}</td>
			</tr>
			<tr>
				<th id="contentHead" class="warning text-center" style="padding-top: 20px;">제목</th>
				<td colspan="3" style="padding-top: 20px;">${bbsVo.title}</td>
				<th id="contentHead" class="warning text-center" style="padding-top: 20px;">작성일</th>
				<td align="center">${bbsVo.writeDate}</td>
			</tr>
			<tr height="50">
				<td colspan="6">${bbsVo.content}</td>
			</tr>
		</table>
	</div>
	<div class="container">
		<div class="col-md-2 col-md-offset-4" style="padding-right: 0px;">
			<select name="selectSorting" id="selectSorting" class="form-control" onchange="sortFunc(value)">
				<option value="0" selected="selected">인기순</option>
				<option value="1">최신순</option>
			</select>
			<br />
		</div>
		
		<c:forEach var="commentList" items="${commentList}">
		<div class="col-md-12">
			<table class="table table-hover table-bordered col-md-12" id="comment-table">
				<tr>
					<td width="20%" rowspan="2" class="text-center">${commentList.commentId}</td>
					<td colspan="2">
						${commentList.commentContent}
						<button class="glyphicon glyphicon-remove remove pull-right" 
						onclick="commentRemove(${commentList.commentIdx}, '${commentList.commentPassword}')">
						</button>
					</td>
				</tr>
				<tr>
					<td>${commentList.commentDate}</td>
					<td style="width: 140px;">
						<button class="btn btn-sm btn-primary glyphicon glyphicon-thumbs-up" id="goodBtn" onclick="goodAndBadFunc(${commentList.commentIdx}, 0)">
							<span id="goodValue${commentList.commentIdx}" >${commentList.good}</span>
						</button>
						<button class="btn btn-sm btn-danger glyphicon glyphicon-thumbs-down" id="badBtn" onclick="goodAndBadFunc(${commentList.commentIdx}, 1)">
							<span id="badValue${commentList.commentIdx}" >${commentList.bad}</span>
						</button>
					</td>
				</tr>
			</table>
		</div>
		</c:forEach>
	</div>
	<div>
		<form action="commentInsert.do" method="post">
			<input type="hidden" value="${bbsVo.idx}" id="bbsIdx" name="bbsIdx"/>
			<input type="hidden" value="${page}" id="page" name="page"/>
			<table class=" table table-striped table-bordered" >
				<tr>
					<td class="text-center success" width="70">아이디</td>
					<td><input type="text" id="commentId" name="commentId" placeholder="아이디"/></td>
					<td class="text-center success">비밀번호</td>
					<td><input type="password" id="commentPassword" name="commentPassword" placeholder="password" /></td>
				</tr>
				<tr>
					<td colspan="5"><textarea name="commentContent" id="commentContent" placeholder="댓글 내용 입력"></textarea></td>
					<td><button type="submit" class="btn btn-info col-md-12" id="commentBtn">댓글 쓰기</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="btn-group pull-right" role="group">
		<a class="btn btn-danger" href="#" role="button" data-toggle="modal" data-target="#removeModal">삭제하기</a>
		<a class="btn btn-primary" href="bbs.do?page=${page}" role="button">목록으로</a>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content text-center">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">글을 삭제하시겠습니까?</h4>
      </div>
      <div class="modal-body">
      	<label for="inputPassword">글 비밀번호</label>
      	<input type="password" id="inputPassword"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">No</button>
        <button type="button" class="btn btn-primary" onclick="contentRemove()">Yes</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(function(){
		$("title").text($("title").text()+" | "+$("h2").text());
	});
	$('#removeModal').on('shown.bs.modal', function () {
	    $('#inputPassword').focus();
	});
	function sortFunc(sort){
		if(sort==0){
			var url = "bbsRead.do?idx="+${bbsVo.idx}+"&page="+${page};
		}
		else{
			var url = "bbsRead.do?idx="+${bbsVo.idx}+"&page="+${page}+"&sort="+sort;
		}
		location.href = url;
	}
	
	function contentRemove(){
		var checkPassword = $(inputPassword).val();
		var dbPassword = ${bbsVo.password};

		if(checkPassword == dbPassword){
			alert("글을 삭제합니다.")
			location.href="bbsDelete.do?page="+${page}+"&idx="+${bbsVo.idx};
		}
		else{
			alert("비밀번호가 틀렸습니다.");
		}
	}
	
	function commentRemove(commentIdx, password){
		 var inputPassword = prompt("댓글을 삭제하시겠습니까?", "password");
		 if(inputPassword==password){
			 var url = "commentDelete.do?commentIdx="+commentIdx+"&bbsIdx="+${bbsVo.idx}+"&page="+${page};
			 alert("삭제완료");
			 location.href = url;
		 }
		 else{
			 alert("비밀번호가 틀렸습니다.");
		 }
	}
	
	function goodAndBadFunc(commentIdx, key){
		
		var url = "bbsRead.do?idx="+${bbsVo.idx}+"&page="+${page};
		
		if(key==0){//좋아요 버튼
			var id = "goodValue"+commentIdx
		}
		else{//싫어요 버튼
			var id = "badValue"+commentIdx
		}
				
		var beforeValue = document.getElementById(id).innerHTML;
				
		$.ajax({
			url : "/origin/commentCountBtn.do",
			method : "post",
			dataType : "json",
			data : {
				commentIdx : commentIdx,
				key : key
			},
			success : function(data) {
				if(data.key==0){
					alert("좋아요!");
				}
				else{
					alert("싫어요!");
				}
				beforeValue++;
				document.getElementById(id).innerHTML = beforeValue;
			}
		});
	}
</script>
</body>
</html>