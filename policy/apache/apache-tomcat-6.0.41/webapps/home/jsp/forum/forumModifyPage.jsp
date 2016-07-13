<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%@ page import="kr.co.jimant.home.forum.ForumVO"%>
<%
ForumVO forumVO = (ForumVO) request
			.getAttribute("forumVO");
		
%>

<script type="text/javascript">


	function forumModify() {
		
		if (confirm("수정 하시겠습니까?")) {

			forumform.submit();
		} else {
		}
	}
	
	$(document).ready(function(){
		
		$("#modify").click(function(event) {
			forumModify();
		});
	});
</script>

<!-- container -->

<div class="jumbotron">
      <div class="container">
<h2>포럼 수정</h2>
        <br/>
<form action="./forumModify.do" enctype="multipart/form-data" method="post" name="forumform">
				<input type="hidden" name="forum_id" value="<%=forumVO.getForum_id()%>">	
	
		<table class="table table-hover ">
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text"    maxlength="128" name="Forum_title" value="<%=forumVO.getForum_title()%>" style="width:100%;"/></td>
			</tr>
			<tr>
				<th class="vt">내용</th>
				<td>
					<div >
					<!-- 에디터 영역 -->
					<TEXTAREA  name="forum_content"  maxlength="10000" rows="" cols="" style="width: 100%; height: 200px;" ><%=forumVO.getForum_content() %></TEXTAREA>
					</div>
				</td>
			</tr>
		</tbody>
		</table>
		<input type="button" class ="btn" id="modify" value="수정" />
</form>

</div>
</div>
<!-- //container -->
