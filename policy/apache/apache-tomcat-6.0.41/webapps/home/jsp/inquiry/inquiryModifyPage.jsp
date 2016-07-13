<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%@ page import="kr.co.jimant.home.inquiry.InquiryVO"%>
<%
InquiryVO inquiryVO = (InquiryVO) request
			.getAttribute("inquiryVO");
		
%>

<script type="text/javascript">


	function inquiryModify() {
		
		if (confirm("수정 하시겠습니까?")) {

			inquiryform.submit();
		} else {
		}
	}
	
	$(document).ready(function(){
		
		$("#modify").click(function(event) {
			inquiryModify();
		});
	});
</script>

<!-- container -->
<div class="jumbotron">
      <div class="container">
<h2>Q&A 수정</h2>
        <br/>
<form action="./inquiryModify.do"
					enctype="multipart/form-data" method="post" name="inquiryform">
				<input type="hidden" name="inquiry_id" value="<%=inquiryVO.getInquiry_id()%>">	
				
	<table class="table table-hover ">
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text"     maxlength="128" name="inquiry_title" value="<%=inquiryVO.getInquiry_title()%>" style="width:100%;"/></td>
			</tr>
			<tr>
				<th class="vt">내용</th>
				<td>
					<div >
					<!-- 에디터 영역 -->
					<TEXTAREA  name="inquiry_content"  maxlength="10000" rows="" cols="" style="width: 100%; height: 200px;" ><%=inquiryVO.getInquiry_content() %></TEXTAREA>
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
