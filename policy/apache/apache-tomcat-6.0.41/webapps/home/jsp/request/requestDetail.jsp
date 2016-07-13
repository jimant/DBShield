<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.request.RequestVO"%>
<%@ page import="kr.co.jimant.home.common.UtilMgr"%>
<%
RequestVO requestVO = (RequestVO) request.getAttribute("requestVO");
ArrayList<RequestVO> list = (ArrayList) request.getAttribute("list");

UtilMgr utilMgr = new UtilMgr();
%>

<style type = "text/css">
    li{list-style:none;}
    #blank{
    	border: 1px solid #D5D5D5; 
    	padding:10px;
    }  
</style>

<script type="text/javascript">
	
	function replyRegister(request_id) {
		location.href = "./requestReplyPage.do?request_id=" + request_id;
	}
	
	function replyDelete(request_id) {
		if (confirm("삭제 하시겠습니까?")) {
			location.href = "./requestReplyDelete.do?request_id=" + request_id + "&id=" + <%=requestVO.getRequest_id()%>;
		} else {
		}
	}
	
	function requestDelete() {
		if (confirm("삭제 하시겠습니까?")) {

			location.href = "./requestDelete.do?request_id=" + <%=requestVO.getRequest_id()%>;
		} else {
		}
	}
	
	function requestModify() {

		location.href = "./requestModifyPage.do?request_id=" + <%=requestVO.getRequest_id()%>;
	}
	
	function requestRegister() {
		
		if (confirm("등록 하시겠습니까?")) {

			requestform.submit();
		} else {
		}
	}
	
	function stateModify() {
		var state = $("#state").val();
		if (confirm("변경 하시겠습니까?")) {
			location.href = "./stateModify.do?request_id=" + <%=requestVO.getRequest_id()%> + "&state=" + state;
		} else {
		}
	}
	
	$(document).ready(function(){
		
		<%if(requestVO.getState()==1){ %>
			$("#state").val("1");
		<%}else if(requestVO.getState()==2){ %>
			$("#state").val("2");
		<%}else if(requestVO.getState()==3){ %>
			$("#state").val("3");
		<%}else if(requestVO.getState()==4){ %>
			$("#state").val("4");
		<%} %>
		
		$("#register").click(function(event) {
			requestRegister();
		});
		
		$("#modify").click(function(event) {
			requestModify();
		});
		
		$("#delete").click(function(event) {
			requestDelete();
		});
		
		$("#stateModify").click(function(event) {
			stateModify();
		});
		
	});
</script>

	<!-- container -->
			<table class="table table-striped table-bordered  table-condensed ">	
					<tr>
						<td><div><h3><%=requestVO.getRequest_title() %></h3>
						<b>글쓴이: </b><%=requestVO.getName() %>&nbsp;&nbsp;
							<b>등록일: </b><%=requestVO.getCreate_date() %>&nbsp;&nbsp;
							<%if(requestVO.getState()==1){ %>
								<b>신청중</b>
							<%}else if(requestVO.getState()==2){ %>
								<b>검토중</b>
							<%}else if(requestVO.getState()==3){ %>
								<b>시행중</b>
							<%}else if(requestVO.getState()==4){ %>
								<b>서비스완료</b>
							<%} %>
						</div></td>
					</tr>
					<tr>
						<td>
							<div align="left"><%=utilMgr.getContent(requestVO.getRequest_content() )%></div>
						</td>
					</tr>
					<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null && SESSION_MEMBER_INFO.admin != null }" > 
					<tr>
					 	<td>
					 		<select class="ml10" id="state" >
										<option value="1">신청중</option>
										<option value="2">검토중</option>
										<option value="3">시행중</option>
										<option value="4">서비스완료</option>
							</select>
							<input type="button" class ="btn " id="stateModify" value="상태변경" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" class ="btn " id="modify" value="수정" />
							<input type="button" class ="btn " id="delete" value="삭제" />
						</td>
					</tr>
					</c:if>
			</table>
			<%for (int i = 0; i < list.size(); i++) {RequestVO requestvo = (RequestVO) list.get(i);%>
			<%if (requestvo.getRe_lev() != 0) {%><%for (int a = 0; a <= requestvo.getRe_lev() * 2; a++) {%>&nbsp;<%}%><%} else {%><%}%>
			<ul id = 'blank' style="margin-left:<%=requestvo.getRe_lev()*2 %>0px; "  >	
					<li>
						<div>
							<h4><%=requestvo.getRequest_title() %></h4>
							<h5><b>글쓴이: </b><%=requestvo.getName() %>&nbsp;&nbsp;<b>등록일: </b><%=requestvo.getCreate_date() %></h5>
						</div>
					</li>
					<li>
						<div align="left"><%=utilMgr.getContent(requestvo.getRequest_content() )%></div>
					</li>
					<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null && SESSION_MEMBER_INFO.admin != null }" > 
					<li>
					 	<div>
					 		<input type="button" class ="btn " value="답글" onclick="javascript:replyRegister('<%=requestvo.getRequest_id()%>')"/>
							<input type="button" class ="btn " value="삭제" onclick="javascript:replyDelete('<%=requestvo.getRequest_id()%>')"/>
						</div>
					</li>
					</c:if>
			</ul>
			<%}%>
			<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null && SESSION_MEMBER_INFO.admin == 'S' }" > 
			<br></br>
			<form action="./requestReply.do"
								enctype="multipart/form-data" method="post" name="requestform">
								<input type="hidden" name="request_id" value="<%=requestVO.getRequest_id()%>"> 
								<input type="hidden" name="re_ref" value="<%=requestVO.getRe_ref()%>"> 
								<input type="hidden" name="re_lev" value="<%=requestVO.getRe_lev()%>"> 
								<input type="hidden" name="re_seq" value="<%=requestVO.getRe_seq()%>"> 
				<h3>댓글 쓰기</h3>				
				<table class="table table-hover ">
					<colgroup>
						<col width="10%" />
						<col width="90%" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text"  maxlength="128" name="request_title" value="" style="width:100%;" /></td>
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
					<input type="button" class ="btn " id="register" value="등록" />
			</form>
			</c:if>
	<!-- //container -->