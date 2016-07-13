<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.notice.NoticeVO"%>
<%@ page import="kr.co.jimant.home.common.UtilMgr"%>
<%
NoticeVO noticeVO = (NoticeVO) request.getAttribute("noticeVO");
ArrayList<NoticeVO> list = (ArrayList) request.getAttribute("list");

UtilMgr utilMgr = new UtilMgr();
%>
<%@ page import="java.util.*"%>

<style type = "text/css">
    li{list-style:none; }
    
    #blank{
    	border: 1px solid #D5D5D5; 
    	padding:10px;
    }  
</style>

<script type="text/javascript">

	function replyRegister(notice_id) {
		location.href = "./noticeReplyPage.do?notice_id=" + notice_id;
	}
	
	function replyDelete(notice_id) {
		if (confirm("삭제 하시겠습니까?")) {
			location.href = "./noticeReplyDelete.do?notice_id=" + notice_id +"&id=" + <%=noticeVO.getNotice_id()%>;
		} else {
		}
	}

	function noticeDelete() {
		if (confirm("삭제 하시겠습니까?")) {

			location.href = "./noticeDelete.do?notice_id=" + <%=noticeVO.getNotice_id()%>;
		} else {
		}
	}
	
	function noticeModify() {

			location.href = "./noticeModifyPage.do?notice_id=" + <%=noticeVO.getNotice_id()%>;
	}
	
	function noticeRegister() {
		
		if (confirm("등록 하시겠습니까?")) {

			noticeform.submit();
		} else {
		}
	}
	
	
	$(document).ready(function(){
		
		$("#register").click(function(event) {
			noticeRegister();
		});
		
		$("#modify").click(function(event) {
			noticeModify();
		});
		
		$("#delete").click(function(event) {
			noticeDelete();
		});
	});
	
	
</script>

	<!-- container -->
			<table class="table table-striped table-bordered  table-condensed ">	
					<tr>
						<td><div><h3><%=noticeVO.getNotice_title() %></h3>
						<b>글쓴이: </b><%=noticeVO.getName() %>&nbsp;&nbsp;
							<b>등록일: </b><%=noticeVO.getCreate_date() %>
						</div></td>
					</tr>
					<tr>
						<td>
							<div><%=utilMgr.getContent(noticeVO.getNotice_content() )%></div>
						</td>
					</tr>
					<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null && SESSION_MEMBER_INFO.admin != null }" > 
					<tr>
					 	<td>
							<input type="button" class ="btn " id="modify" value="수정" />
							<input type="button" class ="btn " id="delete" value="삭제" />
						</td>
					</tr>
					</c:if>
			</table>
			<%for (int i = 0; i < list.size(); i++) {NoticeVO noticevo = (NoticeVO) list.get(i);%>
					<ul id = 'blank' style="margin-left:<%=noticevo.getRe_lev()*2 %>0px; "  >	
					<li>
						<div>
							<h4><%=noticevo.getNotice_title() %></h4>
							<h5><b>글쓴이: </b><%=noticevo.getName() %>&nbsp;&nbsp;<b>등록일: </b><%=noticevo.getCreate_date() %></h5>
						</div>
					</li>
					<li>
						<div>
							<%=utilMgr.getContent(noticevo.getNotice_content() )%>
						</div>
					</li>
					<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null}" > 
					<li>
						<div>
					 		<input type="button" class ="btn " value="답글" onclick="javascript:replyRegister('<%=noticevo.getNotice_id()%>')"/>
					 		<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null && SESSION_MEMBER_INFO.admin != null }" > 
								<input type="button" class ="btn " value="삭제" onclick="javascript:replyDelete('<%=noticevo.getNotice_id()%>')"/>
							</c:if>
						</div>
					</li>
					</c:if>
					</ul>
			<%}%>
			<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null  }" > 
			<br></br>
			<form action="./noticeReply.do"
								enctype="multipart/form-data" method="post" name="noticeform">
								<input type="hidden" name="notice_id" value="<%=noticeVO.getNotice_id()%>"> 
								<input type="hidden" name="re_ref" value="<%=noticeVO.getRe_ref()%>"> 
								<input type="hidden" name="re_lev" value="<%=noticeVO.getRe_lev()%>"> 
								<input type="hidden" name="re_seq" value="<%=noticeVO.getRe_seq()%>"> 
				<h3>댓글 쓰기</h3>				
				<table class="table table-hover ">
					<colgroup>
						<col width="10%" />
						<col width="90%" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text"  maxlength="128" name="notice_title" value="" style="width:100%;" /></td>
						</tr>
						<tr>
							<th >내용</th>
							<td>
								<div >
								<!-- 에디터 영역 -->
								<TEXTAREA  name="notice_content" rows="" cols=""  maxlength="10000" style="width: 100%; height: 200px;"></TEXTAREA>
								</div>
							</td>
						</tr>
						
					</tbody>
					</table>
					<input type="button" class ="btn " id="register" value="등록" />
			</form>
			</c:if>
	<!-- //container -->