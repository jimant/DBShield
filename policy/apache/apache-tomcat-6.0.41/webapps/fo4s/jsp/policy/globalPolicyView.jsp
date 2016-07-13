<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.fo4s.vo.PolicyVO"%>
<%
	ArrayList<PolicyVO> list = (ArrayList) request.getAttribute("list");
%>
<script>
function policyDelete(algorithm, operateMode, applyDate){
	if(applyDate != "null"){
		alert("이미 시스템에 적용되어 있으면 삭제할 수 없습니다.");
		return false;
	} 
	if(confirm("삭제 하시겠습니까?")) {
		$("#algorithm").val(algorithm);
		$("#operateMode").val(operateMode);
		deleteform.submit();
	}
}

</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
		<H3>글로벌 암호정책</H3>
					<table class="table table-striped table-bordered table-hover table-condensed">
						<colgroup>
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th>DB Type</th>
								<th>DB 이름</th>
								<th>알고리즘</th>
								<th>암호화모드</th>
								<th>시스템적용일자</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<%for (int i = 0; i < list.size(); i++) {PolicyVO policyVO = (PolicyVO) list.get(i);%>
						
							<tr class="ac">
								<td><%if(policyVO.getDb_type().equals("M")){ %>MySql<%}else{ %>Oracle<%} %></td>
								<td><%=policyVO.getDb_name() %></td>
								<td><%=policyVO.getAlgorithm() %></td>
								<td><%=policyVO.getOperate_mode() %></td>
								<td>
									<%if(policyVO.getSystem_apply_date()!=null){ %>
										<%=policyVO.getSystem_apply_date() %>
									<%}%>
								</td>
								<td><input type="button"  class="btn" value="삭제" id="delete" onclick="javascript:policyDelete('<%=policyVO.getAlgorithm()%>','<%=policyVO.getOperate_mode()%>','<%=policyVO.getSystem_apply_date() %>')" ></td>
								
							</tr>
							
						<%}%>		
						</tbody>
					</table>
					<form  action="./globalPolicyDelete.do" method="post" name="deleteform">
						<input type="hidden" id="algorithm" name="algorithm">
						<input type="hidden" id="operateMode" name="operate_mode">
					</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
