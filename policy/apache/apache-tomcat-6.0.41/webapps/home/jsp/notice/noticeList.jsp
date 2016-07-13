
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.notice.NoticeVO"%>
<%
	ArrayList<NoticeVO> list = (ArrayList) request.getAttribute("list");
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>

<!-- container -->
	 <div class="jumbotron">
      <div class="container">
        <h2>공지사항</h2>
        <c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null && SESSION_MEMBER_INFO.admin == 'S' }" > 
		<p><a class="btn btn-primary " role="button" onclick="location.href='./noticeRegisterPage.do'" >글쓰기 &raquo;</a></p>
		</c:if>
    
		<table class="table  table-hover ">
			<colgroup>
			
				<col width="" />
				<col width="" />
				<col width="" />
		
			</colgroup>
			
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
			
				</tr>
			</thead>
			<tbody>
				
				<%for (int i = 0; i < list.size(); i++) {NoticeVO noticeVO = (NoticeVO) list.get(i);%>
				
				<tr>
					<td><%=noticeVO.getRownum() %></td>
					
					<td><a href="./noticeDetail.do?notice_id=<%=noticeVO.getNotice_id()%>"><%=noticeVO.getNotice_title() %></a></td>
					<td><%=noticeVO.getCreate_date()%></td>
				
				</tr>
				
				<%}%>
				
			</tbody>
		</table>
		<ul class="pager">
			<%if (nowpage <= 1) {%> 
				<li><a>Previous</a></li> 
			<%} else {%> 
				<li><a href="./noticeList.do?page=<%=nowpage - 1%>">Previous</a></li> 
			<%}%>
			
			<%for (int a = startpage; a <= endpage; a++) {%>
				<%if (a == nowpage) {%>
					<%=a%>
				<%} else {%>
					<li><a href="./noticeList.do?page=<%=a%>"><%=a%> </a></li>
				<%}%>
			<%}%>
			
			<%if (nowpage >= maxpage) {%>
				<li><a>Next</a></li>
			<%} else {%>
				<li><a href="./noticeList.do?page=<%=nowpage + 1%>">Next</a></li>
			<%}%>
		</ul>
	  </div>
    </div>	
<!-- //container -->