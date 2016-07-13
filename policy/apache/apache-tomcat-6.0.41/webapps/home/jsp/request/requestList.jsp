
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.request.RequestVO"%>
<%
	ArrayList<RequestVO> list = (ArrayList) request.getAttribute("list");
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>

<!-- container -->
	 <div class="jumbotron">
      <div class="container">
        <h2>서비스요청</h2>
		<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null }" > 
		<p><a class="btn btn-primary " role="button" onclick="location.href='./requestRegisterPage.do'" >글쓰기 &raquo;</a></p>
		</c:if>
		<table class="table table-hover ">
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
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>등록일</th>
					<th>완료일</th>
					<th>신청상태</th>
			
				</tr>
			</thead>
			<tbody>
				
				<%for (int i = 0; i < list.size(); i++) {RequestVO requestVO = (RequestVO) list.get(i);%>
				
				<tr>
					<td><%=requestVO.getRownum() %></td>
					
					<td><a href="./requestDetail.do?request_id=<%=requestVO.getRequest_id()%>"><%=requestVO.getRequest_title() %></a></td>
					<td><%=requestVO.getName()%></td>
					<td><%=requestVO.getCreate_date()%></td>
					<%if(requestVO.getState()==4){ %>
						<td><%=requestVO.getComplete_date()%></td>
					<%}else{%><td></td><%} %>
					<%if(requestVO.getState()==1){ %>
						<td>신청중</td>
					<%}else if(requestVO.getState()==2){ %>
						<td>검토중</td>
					<%}else if(requestVO.getState()==3){ %>
						<td>시행중</td>
					<%}else if(requestVO.getState()==4){ %>
						<td>서비스완료</td>
					<%} %>
					
				</tr>
				
				<%}%>
				
			</tbody>
		</table>
		<ul class="pager">
			<%if (nowpage <= 1) {%> 
				<li><a>Previous</a></li> 
			<%} else {%> 
				<li><a href="./requestList.do?page=<%=nowpage - 1%>">Previous</a></li> 
			<%}%>
			
			<%for (int a = startpage; a <= endpage; a++) {%>
				<%if (a == nowpage) {%>
					<%=a%>
				<%} else {%>
					<li><a href="./requestList.do?page=<%=a%>"><%=a%> </a></li>
				<%}%>
			<%}%>
			
			<%if (nowpage >= maxpage) {%>
				<li><a>Next</a></li>
			<%} else {%>
				<li><a href="./requestList.do?page=<%=nowpage + 1%>">Next</a></li>
			<%}%>
		</ul>
		 </div>
    </div>	
<!-- //container -->