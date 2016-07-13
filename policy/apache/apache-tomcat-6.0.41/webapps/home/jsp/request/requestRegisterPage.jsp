
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script type="text/javascript">

	function requestRegister() {
		
		if (confirm("등록 하시겠습니까?")) {

			requestform.submit();
		} else {
		}
	}
	
	$(document).ready(function(){
		
		$("#registration").click(function(event) {
			requestRegister();
		});
	});
	
</script>

<!-- container -->
			
	 <div class="jumbotron">
      <div class="container">
        <h2>서비스요청</h2>
        <br/>
<form action="./requestRegister.do"	enctype="multipart/form-data" method="post" name="requestform">
	
		<table class="table ">
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text"   maxlength="128" name="request_title"  style="width:100%;" /></td>
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
		<input type="button" class ="btn" id="registration" value="등록" />
</form>
</div>
</div>
<!-- //container -->
