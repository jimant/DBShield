
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.forum.ForumVO"%>
<%
	ForumVO forumvo = (ForumVO) request.getAttribute("forumvo");
	ArrayList<ForumVO> list = (ArrayList) request.getAttribute("list");
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	String forum_theme_id = (String) request.getAttribute("forum_theme_id");
%>

<script>

$(document).ready(function(){
	
});
</script>


<!-- container -->
	 <div class="jumbotron">
      <div class="container">
        <h3><%=forumvo.getForum_theme() %></h3>
        <c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null  }" > 
		<p><a class="btn btn-primary " role="button" onclick="location.href='./forumRegisterPage.do?forum_theme_id=<%=forumvo.getForum_theme_id() %>'" >글쓰기 &raquo;</a></p>
		</c:if>
    
		<table class="table  table-hover ">
			<colgroup>
			
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
		
			</colgroup>
			
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>마지막댓글</th>
			
				</tr>
			</thead>
			<tbody>
				
				<%for (int i = 0; i < list.size(); i++) {ForumVO forumVO = (ForumVO) list.get(i);%>
				
				<tr>
					<td><%=forumVO.getRownum() %></td>
					
					<td><a href="./forumDetail.do?forum_id=<%=forumVO.getForum_id()%>"><%=forumVO.getForum_title() %></a></td>
					<td><%=forumVO.getCreate_date()%></td>
					<%if(forumVO.getLast_reply_date()!=null){ %><td><%=forumVO.getLast_reply_date()%></td><%} %>
					
				
				</tr>
				
				<%}%>
				
			</tbody>
		</table>
		<ul class="pager">
			<%if (nowpage <= 1) {%> 
				<li><a>Previous</a></li> 
			<%} else {%> 
				<li><a href="./forumList.do?page=<%=nowpage - 1%>&forum_theme_id=<%=forum_theme_id%>">Previous</a></li> 
			<%}%>
			
			<%for (int a = startpage; a <= endpage; a++) {%>
				<%if (a == nowpage) {%>
					<%=a%>
				<%} else {%>
					<li><a href="./forumList.do?page=<%=a%>&forum_theme_id=<%=forum_theme_id%>"><%=a%> </a></li>
				<%}%>
			<%}%>
			
			<%if (nowpage >= maxpage) {%>
				<li><a>Next</a></li>
			<%} else {%>
				<li><a href="./forumList.do?page=<%=nowpage + 1%>&forum_theme_id=<%=forum_theme_id%>">Next</a></li>
			<%}%>
		</ul>
	  </div>
    </div>	
<!-- //container -->