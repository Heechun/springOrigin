<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="false"/>
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="container">
	<div class="col-md-10 col-md-offset-1">
	<h2 class="text-center page-header">글쓰기</h2>
	<form action="bbsInsertImpl.do" method="post">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-5">
					<label for="id" class="col-md-3">글쓴이</label>
					<input type="text" id="id"  name="id" class="col-md-7" required="required"/><br /><br />
				</div>
				<div class="col-md-4">
					<label for="password" class="col-md-5">비밀번호</label>
					<input type="password" id="password"  name="password" class="col-md-4" required="required"/><br /><br />
				</div>
			</div>
			<label for="title" class="col-md-1">제목</label>
			<input type="text" id="title" name="title" class="col-md-8" required="required"/><br /><br />
		</div>
		<div >
			<textarea name="content" id="ir1" rows="10" cols="100"></textarea>
		</div>
		<div class="btn-group col-md-2 col-md-offset-8" role="group">
			<a class="btn btn-warning" href="bbs.do?page=1" role="button">취소</a>
			<input class="btn btn-success" value="저장" id="submitBtn" type="submit"/>
		</div>
	</form>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$("#title").text($("h2").text());
});
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
$("#submitBtn").click(function doSubmit() {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
});
</script>


</body>
</html>