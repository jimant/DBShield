
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


	function inquiryRegister() {
		
		if (confirm("등록 하시겠습니까?")) {

			inquiryform.submit();
		} else {
		}
	}
	
	
	$(document).ready(function(){
		
		$("#register").click(function(event) {
			inquiryRegister();
		});
	});
	
</script>

<!-- container -->
 <div class="jumbotron">
      <div class="container">
        <h2>답글 등록</h2>
        <br/>
<form action="./inquiryReply.do"
					enctype="multipart/form-data" method="post" name="inquiryform">
					<input type="hidden" name="inquiry_theme_id" value="<%=inquiryVO.getInquiry_theme_id()%>"> 
					<input type="hidden" name="inquiry_id" value="<%=inquiryVO.getInquiry_id()%>"> 
					<input type="hidden" name="member_id" value="<%=inquiryVO.getMember_id()%>"> 
					<input type="hidden" name="re_ref" value="<%=inquiryVO.getRe_ref()%>"> 
					<input type="hidden" name="re_lev" value="<%=inquiryVO.getRe_lev()%>"> 
					<input type="hidden" name="re_seq" value="<%=inquiryVO.getRe_seq()%>"> 
					
	<table class="table table-hover ">
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text"  maxlength="128" name="inquiry_title" value="Re: <%=inquiryVO.getInquiry_title()%>" style="width:100%;"/></td>
			</tr>
			<tr>
				<th >내용</th>
				<td>
					<div >
					<!-- 에디터 영역 -->
					<TEXTAREA  name="inquiry_content" rows="" cols=""  maxlength="10000" style="width: 100%; height: 200px;"></TEXTAREA>
					</div>
				</td>
			</tr>
			
		</tbody>
		</table>
		<input type="button" class ="btn" id="register" value="등록" />
</form>
</div>
</div>
<!-- //container -->
