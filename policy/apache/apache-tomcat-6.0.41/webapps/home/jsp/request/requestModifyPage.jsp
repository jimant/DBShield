<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%@ page import="kr.co.jimant.home.request.RequestVO"%>
<%
RequestVO requestVO = (RequestVO) request.getAttribute("requestVO");

%>

<script type="text/javascript">


	function requestModify() {
		
		if (confirm("수정 하시겠습니까?")) {

			requestform.submit();
		} else {
		}
	}
	
	$(document).ready(function(){
		
		$("#modify").click(function(event) {
			requestModify();
		});
	});
</script>

<!-- container -->
<div class="jumbotron">
      <div class="container">
<h2>서비스요청 수정</h2>
        <br/>
<form action="./requestModify.do"
					enctype="multipart/form-data" method="post" name="requestform">
				<input type="hidden" name="request_id" value="<%=requestVO.getRequest_id()%>">	
				
	<table class="table table-hover ">
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text"     maxlength="128" name="request_title" value="<%=requestVO.getRequest_title()%>" style="width:100%;"/></td>
			</tr>
			<tr>
				<th class="vt">내용</th>
				<td>
					<div >
					<!-- 에디터 영역 -->
					<TEXTAREA  name="request_content"  maxlength="1000" rows="" cols="" style="width: 100%; height: 200px;" ><%=requestVO.getRequest_content() %></TEXTAREA>
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
