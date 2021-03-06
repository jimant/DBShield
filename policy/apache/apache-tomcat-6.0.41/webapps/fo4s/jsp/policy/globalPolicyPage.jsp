<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.fo4s.vo.ConnectionVO"%>
<%
	ArrayList<String> list = (ArrayList) request.getAttribute("list");

	ConnectionVO connectionVO = (ConnectionVO) request.getAttribute("connectionVO");
%>

<script>
function register() {
    $.ajax({
        type : "post",
        url : "<c:url value='/globalPolicy.aj'/>",
        dataType : "html",
        data : $("#globalPolicyform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("등록완료");
            	location.href = "./globalPolicyView.do";
            } 
            if (data == "already") {
            	alert("글로벌 암호정책이 이미존재합니다.");
            } 
        },
        error : function(xhr, textStatus) {
//         	alert("error");
            
        }
    });
}

$(document).ready(function(){
	
	$("#register").click(function(event) {
		register();
	});
});
</script>
<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
		<H3>글로벌 암호정책 설정</H3>
					<form action="./globalPolicy.aj" method="post" id="globalPolicyform" name="globalPolicyform">
					<input type="hidden" name="db_type" value="<%=connectionVO.getDb_type() %>" />
						<table class="table table-condensed">
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
<!-- 								<tr> -->
<!-- 									<th class="al"> DB Type</th> -->
<!-- 									<td> -->
								
<!-- 									<select class="ml10" name="db_type"> -->
<!-- 											<option value="M">MySQL</option> -->
<!-- 											<option value="O">Oracle</option> -->
<!-- 									</select> -->
<!-- 									</td> -->
<!-- 								</tr> -->

								<tr>
									<th class="al"> DB Type</th>
									<%if(connectionVO.getDb_type().equals("M")){ %><td> <input type="text"  value="MySql" readonly="readonly" /></td>
									<%}else {%><td> <input type="text"  value="Oracle" readonly="readonly" /></td><%} %>
								</tr>
								
<!-- 								<tr> -->
<!-- 									<th class="al"> DB 이름</th> -->
<!-- 									<td> -->
<!-- 									<input type="text" name="db_name"/> -->
<!-- 									</td> -->
<!-- 								</tr> -->
								<tr>
									<th class="al"> DB 이름</th>
									<td>
									<select class="ml10" id="selectDB" name="db_name">
								<%for (int i = 0; i < list.size(); i++) {String dbName = (String) list.get(i);%>
									<option value="<%=dbName %>"><%=dbName %></option>
								<%}%>
									</select>
									</td>
								</tr>
								<tr>
									<th class="al"> 알고리즘</th>
									<td>
<!-- 									<input type="text" readonly="readonly"/> -->
									<select class="ml10" name="algorithm" id="algorithm">
						
										<option value="AES">AES</option>
										<option value="SEED">SEED</option>
										
									</select>
									</td>
								</tr>
								<tr>
									<th class="al"> 암호화모드</th>
									<td>
<!-- 									<input type="text" readonly="readonly"/> -->
									<select class="ml10" name="operate_mode" id="operate_mode">
						
										<option value="ECB">ECB</option>
										<option value="CBC">CBC</option>
									</select>
									</td>
								</tr>
								<tr>
									<th class="al"> </th>
									<td><input type="button" class="btn" id="register" value="등록" /></td>
								</tr>
							</tbody>
						</table>
					</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
