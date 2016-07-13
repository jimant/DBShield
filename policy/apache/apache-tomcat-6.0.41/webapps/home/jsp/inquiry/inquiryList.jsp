
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.inquiry.InquiryVO"%>
<%
	InquiryVO inquiryvo = (InquiryVO) request.getAttribute("inquiryvo");
	ArrayList<InquiryVO> list = (ArrayList) request.getAttribute("list");
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	String inquiry_theme_id = (String) request.getAttribute("inquiry_theme_id");
%>

<script>

$(document).ready(function(){
	
});
</script>


<!-- container -->
	 <div class="jumbotron">
      <div class="container">
         <h3><%=inquiryvo.getInquiry_theme() %></h3>
		<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null }" > 
		<p><a class="btn btn-primary " role="button" onclick="location.href='./inquiryRegisterPage.do?inquiry_theme_id=<%=inquiryvo.getInquiry_theme_id() %>'" >글쓰기 &raquo;</a></p>
		</c:if>
		
		<table class="table table-hover ">
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
				
				<%for (int i = 0; i < list.size(); i++) {InquiryVO inquiryVO = (InquiryVO) list.get(i);%>
				
				<tr>
					<td><%=inquiryVO.getRownum() %></td>
					
					<td><a href="./inquiryDetail.do?inquiry_id=<%=inquiryVO.getInquiry_id()%>"><%=inquiryVO.getInquiry_title() %></a></div></td>
					<td><%=inquiryVO.getCreate_date()%></td>
					<td><%if(inquiryVO.getLast_reply_date()!=null){ %><%=inquiryVO.getLast_reply_date()%><%} %></td>
				
				</tr>
				
				<%}%>
				
			</tbody>
		</table>
		<ul class="pager">
			<%if (nowpage <= 1) {%> 
				<li><a>Previous</a></li> 
			<%} else {%> 
				<li><a href="./inquiryList.do?page=<%=nowpage - 1%>&inquiry_theme_id=<%=inquiry_theme_id%>">Previous</a></li> 
			<%}%>
			
			<%for (int a = startpage; a <= endpage; a++) {%>
				<%if (a == nowpage) {%>
					<%=a%>
				<%} else {%>
					<li><a href="./inquiryList.do?page=<%=a%>&inquiry_theme_id=<%=inquiry_theme_id%>"><%=a%> </a></li>
				<%}%>
			<%}%>
			
			<%if (nowpage >= maxpage) {%>
				<li><a>Next</a></li>
			<%} else {%>
				<li><a href="./inquiryList.do?page=<%=nowpage + 1%>&inquiry_theme_id=<%=inquiry_theme_id%>">Next</a></li>
			<%}%>
		</ul>
		 </div>
    </div>	
<!-- //container -->