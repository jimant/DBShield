
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

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
        <h2>Q&A주제 등록 </h2>
        <br/>
<form action="./inquiryThemeRegister.do" enctype="multipart/form-data" method="post" name="inquiryform">
	
	
		<table class="table  ">
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>Q&A주제</th>
				<td><input type="text"    maxlength="128" name="inquiry_theme" style="width:100%;" /></td>
			</tr>
			<tr>
				<th >설명</th>
				<td>
					<div >
					<!-- 에디터 영역 -->
					<TEXTAREA  name="inquiry_explain" rows="" cols=""  maxlength="1000" style="width: 100%; height: 200px;"></TEXTAREA>
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
