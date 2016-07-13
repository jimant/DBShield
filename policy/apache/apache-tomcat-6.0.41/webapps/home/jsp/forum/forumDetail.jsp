<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.forum.ForumVO"%>
<%@ page import="kr.co.jimant.home.common.UtilMgr"%>
<%
ForumVO forumVO = (ForumVO) request.getAttribute("forumVO");
ArrayList<ForumVO> list = (ArrayList) request.getAttribute("list");

UtilMgr utilMgr = new UtilMgr();
%>
<%@ page import="java.util.*"%>

<style type = "text/css">
    li{list-style:none;}
    
 	#blank{
    	border: 1px solid #D5D5D5; 
    	padding:10px;
    }  
    
</style>

<script type="text/javascript">

	function replyRegister(forum_id) {
			location.href = "./forumReplyPage.do?forum_id=" + forum_id;
	}
	
	function replyDelete(forum_id) {
		if (confirm("삭제 하시겠습니까?")) {
			location.href = "./forumReplyDelete.do?forum_id=" + forum_id +"&id=" + <%=forumVO.getForum_id()%>;
		} else {
		}
	}

	function forumDelete() {
		if (confirm("삭제 하시겠습니까?")) {

			location.href = "./forumDelete.do?forum_id=" + <%=forumVO.getForum_id()%>+"&forum_theme_id=" + <%=forumVO.getForum_theme_id()%>;
		} else {
		}
	}
	
	function forumModify() {

			location.href = "./forumModifyPage.do?forum_id=" + <%=forumVO.getForum_id()%>;
	}
	
	function forumRegister() {
		
		if (confirm("등록 하시겠습니까?")) {

			forumform.submit();
		} else {
		}
	}
	
	
	$(document).ready(function(){
		
		$("#register").click(function(event) {
			forumRegister();
		});
		
		$("#modify").click(function(event) {
			forumModify();
		});
		
		$("#delete").click(function(event) {
			forumDelete();
		});
		
	});
	
	
</script>

	<!-- container -->
			<table class="table table-striped table-bordered  table-condensed ">	
					<tr>
						<td><div><h3><%=forumVO.getForum_title() %></h3>
						<b>글쓴이: </b><%=forumVO.getName() %>&nbsp;&nbsp;
							<b>등록일: </b><%=forumVO.getCreate_date() %>
						</div></td>
					</tr>
					<tr>
						<td>
							<div align="left"><%=utilMgr.getContent(forumVO.getForum_content() )%></div>
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
			<%for (int i = 0; i < list.size(); i++) {ForumVO forumvo = (ForumVO) list.get(i);%>
				<ul id = 'blank' style="margin-left:<%=forumvo.getRe_lev()*2 %>0px; "  >	
					<li>
						<div>
							<h4><%=forumvo.getForum_title() %></h4>
							<h5><b>글쓴이: </b><%=forumvo.getName() %>&nbsp;&nbsp;<b>등록일: </b><%=forumvo.getCreate_date() %></h5>
						</div>
					</li>
					<li>
						<div>
							<%=utilMgr.getContent(forumvo.getForum_content() )%>
						</div>
					</li>
					<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null && SESSION_MEMBER_INFO.admin != null }" > 
					<li>
				 		<div>
					 		<input type="button" class ="btn " value="답글" onclick="javascript:replyRegister('<%=forumvo.getForum_id()%>')"/>
							<input type="button" class ="btn " value="삭제" onclick="javascript:replyDelete('<%=forumvo.getForum_id()%>')"/>
						</div>
					</li>
					</c:if>
				</ul>
			
			<%}%>
			<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null  }" > 
			<br></br>
			<form action="./forumReply.do"
								enctype="multipart/form-data" method="post" name="forumform">
								<input type="hidden" name="forum_theme_id" value="<%=forumVO.getForum_theme_id()%>"> 
								<input type="hidden" name="forum_id" value="<%=forumVO.getForum_id()%>"> 
								<input type="hidden" name="re_ref" value="<%=forumVO.getRe_ref()%>"> 
								<input type="hidden" name="re_lev" value="<%=forumVO.getRe_lev()%>"> 
								<input type="hidden" name="re_seq" value="<%=forumVO.getRe_seq()%>"> 
				<h3>댓글 쓰기</h3>				
				<table class="table table-hover ">
					<colgroup>
						<col width="10%" />
						<col width="90%" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text"  maxlength="128" name="forum_title" value="" style="width:100%;" /></td>
						</tr>
						<tr>
							<th >내용</th>
							<td>
								<div >
								<!-- 에디터 영역 -->
								<TEXTAREA  name="forum_content" rows="" cols=""  maxlength="10000" style="width: 100%; height: 200px;"></TEXTAREA>
								</div>
							</td>
						</tr>
						
					</tbody>
					</table>
					<input type="button" class ="btn " id="register" value="등록" />
			</form>
			</c:if>
	<!-- //container -->