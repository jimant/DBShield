<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%@ page import="kr.co.jimant.home.notice.NoticeVO"%>
<%
NoticeVO noticeVO = (NoticeVO) request.getAttribute("noticeVO");
		
%>

<script type="text/javascript">


	function noticeModify() {
		
		if (confirm("수정 하시겠습니까?")) {

			noticeform.submit();
		} else {
		}
	}
	
	$(document).ready(function(){
		
		$("#modify").click(function(event) {
			noticeModify();
		});
	});
</script>

<!-- container -->
<div class="jumbotron">
      <div class="container">
<h2>공지사항 수정</h2>
        <br/>
<form action="./noticeModify.do" enctype="multipart/form-data" method="post" name="noticeform">
				<input type="hidden" name="notice_id" value="<%=noticeVO.getNotice_id()%>">	
	
		<table class="table table-hover ">
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text"    maxlength="128" name="notice_title" value="<%=noticeVO.getNotice_title()%>" style="width:100%;"/></td>
			</tr>
			<tr>
				<th class="vt">내용</th>
				<td>
					<div >
					<!-- 에디터 영역 -->
					<TEXTAREA  name="notice_content"  maxlength="10000" rows="" cols="" style="width: 100%; height: 200px;" ><%=noticeVO.getNotice_content() %></TEXTAREA>
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
