
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%
	String inquiry_theme_id = (String) request.getAttribute("inquiry_theme_id");
%>

<script type="text/javascript">


	function inquiryRegister() {
		
		if (confirm("등록 하시겠습니까?")) {

			inquiryform.submit();
		} else {
		}
	}
	
	$(document).ready(function(){
		
		$("#registration").click(function(event) {
			inquiryRegister();
		});
	});
</script>

<!-- container -->
			
	 <div class="jumbotron">
      <div class="container">
        <h2>Q&A 등록</h2>
        <br/>
<form action="./inquiryRegister.do" enctype="multipart/form-data" method="post" name="inquiryform">
	<input type="hidden" name="inquiry_theme_id" value="<%=inquiry_theme_id%>"> 
	
		<table class="table table-hover ">
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text"   maxlength="128" name="inquiry_title" style="width:100%;" /></td>
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
		<input type="button" class ="btn" id="registration" value="등록" />
</form>
</div>
</div>
<!-- //container -->
