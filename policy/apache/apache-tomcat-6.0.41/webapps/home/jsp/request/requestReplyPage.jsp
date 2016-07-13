
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


	function requestRegister() {
		
		if (confirm("등록 하시겠습니까?")) {

			requestform.submit();
		} else {
		}
	}
	
	
	$(document).ready(function(){
		
		$("#register").click(function(event) {
			requestRegister();
		});
	});
	
</script>

<!-- container -->
 <div class="jumbotron">
      <div class="container">
        <h2>답글 등록</h2>
        <br/>
<form action="./requestReply.do"
					enctype="multipart/form-data" method="post" name="requestform">
					<input type="hidden" name="request_id" value="<%=requestVO.getRequest_id()%>"> 
					<input type="hidden" name="member_id" value="<%=requestVO.getMember_id()%>"> 
					<input type="hidden" name="re_ref" value="<%=requestVO.getRe_ref()%>"> 
					<input type="hidden" name="re_lev" value="<%=requestVO.getRe_lev()%>"> 
					<input type="hidden" name="re_seq" value="<%=requestVO.getRe_seq()%>"> 
					
	<table class="table table-hover ">
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text"  maxlength="128" name="request_title" value="Re: <%=requestVO.getRequest_title()%>" style="width:100%;"/></td>
			</tr>
			<tr>
				<th >내용</th>
				<td>
					<div >
					<!-- 에디터 영역 -->
					<TEXTAREA  name="request_content" rows="" cols=""  maxlength="1000" style="width: 100%; height: 200px;"></TEXTAREA>
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
