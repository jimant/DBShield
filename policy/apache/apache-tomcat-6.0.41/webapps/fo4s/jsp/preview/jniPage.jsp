<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>


function jniPage() {
	 window.open("http://14.63.162.241:"+$("#port").val()+"/fo4s_jni/encryptionPage.do");  
}  
	



$(document).ready(function(){
	
	$("#jniPage").click(function(event) {
		jniPage();
	});
	
});
</script>
<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
					<form method="post" id="sendform" name="sendform">
						<table class="table table-hover table-condensed">
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<th class="al"> port</th>
									<td><input type="text"  id="port"/></td>
								</tr>
							</tbody>
						</table>
						<input type="button" class="btn" id="jniPage" value="JNI테스트" />
					</form>
					<div id="dataList"></div>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
