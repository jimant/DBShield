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
function policyDelete(user, table, column, applyDate){
	if(applyDate != "null"){
		alert("이미 시스템에 적용되어 있으면 삭제할 수 없습니다.");
	} else if (confirm("삭제 하시겠습니까?")) {
		$("#user").val(user);
		$("#tableName").val(table);
		$("#columnName").val(column);
		deleteform.submit();
	}
}

function policyModify(user, table, column, applyDate){
	if(applyDate != "null"){
		alert("이미 시스템에 적용되어 있으면 수정할 수 없습니다.");
	} else {
		$("#mUser").val(user);
		$("#mTableName").val(table);
		$("#mColumnName").val(column);
		modifyform.submit();
	}
}

</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
		<H3>컬럼별 암호정책 목록</H3>
					<table class="table table-striped table-bordered table-hover table-condensed">
						<colgroup>
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th>USER</th>
								<th>테이블</th>
								<th>컬럼</th>
								<th>일방향알고리즘 SALT</th>
								<th>Iv</th>
								<th>PlainText Length</th>
								<th>Masking 자리수</th>
								<th>Mask</th>
								<th>시스템적용일자</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<%for (int i = 0; i < list.size(); i++) {PolicyVO policyVO = (PolicyVO) list.get(i);%>
						
							<tr class="ac">
								<td><%=policyVO.getUser() %></td>
								<td><%=policyVO.getTable_name() %></td>
								<td><%=policyVO.getColumn_name() %></td>
									<td>
									<%if(policyVO.getHash_salt()!=null){ %>
										<%=policyVO.getHash_salt() %>
									<%}%>
								</td>
								<td>
									<%if(policyVO.getIv_value()!=null){ %>
										<%=policyVO.getIv_value() %>
									<%}%>
								</td>
								<td>
									<%if(policyVO.getPartial_encrypt_length()!=0){ %>
										<%=policyVO.getPartial_encrypt_length() %>
									<%}%>
								</td>
								<td>
									<%if(policyVO.getMask_digit()!=null){ %>
										<%=policyVO.getMask_digit() %>
									<%}%>
								</td>
								<td>
									<%if(policyVO.getMask_value()!=null){ %>
										<%=policyVO.getMask_value() %>
									<%}%>
								</td>
								<td>
									<%if(policyVO.getSystem_apply_date()!=null){ %>
										<%=policyVO.getSystem_apply_date() %>
									<%}%>
								</td>
								<td><input type="button"  class="btn" value="수정" id="modify" onclick="javascript:policyModify('<%=policyVO.getUser()%>','<%=policyVO.getTable_name()%>','<%=policyVO.getColumn_name()%>','<%=policyVO.getSystem_apply_date() %>')" ></td>
								<td><input type="button"  class="btn" value="삭제" id="delete" onclick="javascript:policyDelete('<%=policyVO.getUser()%>','<%=policyVO.getTable_name()%>','<%=policyVO.getColumn_name()%>','<%=policyVO.getSystem_apply_date() %>')" ></td>
							</tr>
							
						<%}%>		
						</tbody>
					</table>
					<form  action="./columnPolicyDelete.do" method="post" name="deleteform">
						<input type="hidden" id="user" name="user">
						<input type="hidden" id="tableName" name="table_name">
						<input type="hidden" id="columnName" name="column_name">
					</form>
					<form  action="./columnPolicyModifyPage.do" method="post" name="modifyform">
						<input type="hidden" id="mUser" name="user">
						<input type="hidden" id="mTableName" name="table_name">
						<input type="hidden" id="mColumnName" name="column_name">
					</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
