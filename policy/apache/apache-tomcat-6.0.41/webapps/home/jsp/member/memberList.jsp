
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.member.MemberVO"%>
<%
	ArrayList<MemberVO> list = (ArrayList) request.getAttribute("list");
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>

<!-- container -->
	 <div class="jumbotron">
      <div class="container">
        <h2>회원목록</h2>
    
		<table class="table  table-hover ">
			<colgroup>
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
					<th>아이디</th>
					<th>이름</th>
					<th>유형</th>
					<th>직무</th>
					<th>전화번호</th>
					<th>핸드폰번호</th>
					<th>email</th>
					<th>가입일</th>
			
				</tr>
			</thead>
			<tbody>
				
				<%for (int i = 0; i < list.size(); i++) {MemberVO memberVO = (MemberVO) list.get(i);%>
				
				<tr>
					<td><a href="./memberDetail.do?member_id=<%=memberVO.getMember_id()%>"><%=memberVO.getMember_id() %></a></td>
					<td><%=memberVO.getName() %></td>
					<td>
						<%if(memberVO.getDivision()!=null && memberVO.getDivision().equals("N") ){%>일반
						<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("C1") ){%>개인사업자
						<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("C2") ){%>법인
						<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("P") ){%>프리미엄
						<%}%>
					</td>
					<td>
						<%if(memberVO.getJob()!=null && memberVO.getJob().equals("1") ){%>IT
						<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("2") ){%>영업
						<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("3") ){%>보안
						<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("4") ){%>관리
						<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("5") ){%>기타
						<%}%>
					</td>
					<td><%=memberVO.getPhone_number() %></td>
					<td><%=memberVO.getCellphone_number() %></td>
					<td><%=memberVO.getEmail() %></td>
					<td><%=memberVO.getJoin_date() %></td>
				
				</tr>
				
				<%}%>
				
			</tbody>
		</table>
		<ul class="pager">
			<%if (nowpage <= 1) {%> 
				<li><a>Previous</a></li> 
			<%} else {%> 
				<li><a href="./memberList.do?page=<%=nowpage - 1%>">Previous</a></li> 
			<%}%>
			
			<%for (int a = startpage; a <= endpage; a++) {%>
				<%if (a == nowpage) {%>
					<%=a%>
				<%} else {%>
					<li><a href="./memberList.do?page=<%=a%>"><%=a%> </a></li>
				<%}%>
			<%}%>
			
			<%if (nowpage >= maxpage) {%>
				<li><a>Next</a></li>
			<%} else {%>
				<li><a href="./memberList.do?page=<%=nowpage + 1%>">Next</a></li>
			<%}%>
		</ul>
	  </div>
    </div>	
<!-- //container -->