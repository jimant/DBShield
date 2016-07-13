<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="kr.co.jimant.home.member.MemberVO"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>


<!-- container -->
 <div class="jumbotron">
	<div class="container">
					<table class="table table-hover ">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th > 아이디</th>
								<td><%=memberVO.getMember_id() %></td>
							</tr>
							<tr>
								<th > 이름</th>
								<td><%=memberVO.getName() %></td>
							</tr>
							<tr>
								<th > 유형</th>
								<td>
									<%if(memberVO.getDivision()!=null && memberVO.getDivision().equals("N") ){%>일반
									<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("C1") ){%>개인사업자
									<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("C2") ){%>법인
									<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("P") ){%>프리미엄
									<%}%>
								</td>
								
							</tr>
							<tr>
								<th > 사업자등록번호</th>
								<td>
									<%if(memberVO.getBusiness_number()!=null ){%>
									<%=memberVO.getBusiness_number() %>
									<%}%>
								</td>
							</tr>
							<tr>
								<th > 법인번호</th>
								<td>
									<%if(memberVO.getCorporate_number()!=null ){%>
									<%=memberVO.getCorporate_number() %>
									<%}%>
								
								</td>
							</tr>
							<tr>
								<th > 회사명</th>
								<td>
									<%if(memberVO.getCompany_name()!=null ){%>
									<%=memberVO.getCompany_name() %>
									<%}%>
								</td>
							</tr>
							<tr>
								<th > 직무</th>
								<td>
									<%if(memberVO.getJob()!=null && memberVO.getJob().equals("1") ){%>IT
									<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("2") ){%>영업
									<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("3") ){%>보안
									<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("4") ){%>관리
									<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("5") ){%>기타
									<%}%>
								</td>
							</tr>
							<tr>
								<th > 전화번호</th>
								<td><%=memberVO.getPhone_number() %></td>
							</tr>
							<tr>
								<th > 핸드폰번호</th>
								<td><%=memberVO.getCellphone_number() %></td>
							</tr>
							<tr>
								<th > 이메일</th>
								<td><%=memberVO.getEmail() %></td>
							</tr>
							<tr>
								<th >우편번호</th>
								<td>
									<%if(memberVO.getZip_code()!=null ){%>
									<%=memberVO.getZip_code() %>
									<%}%>
								</td>
							</tr>
							<tr>
								<th >주소</th>
								<td>
									<%if(memberVO.getAddress()!=null ){%>
									<%=memberVO.getAddress() %>
									<%}%>
								</td>
							</tr>
							<tr>
								<th >상세주소</th>
								<td>
									<%if(memberVO.getAddress_detail()!=null ){%>
									<%=memberVO.getAddress_detail() %>
									<%}%>
								</td>
							</tr>
							<tr>
								<th >가입일</th>
								<td><%=memberVO.getJoin_date() %></td>
							</tr>
							<tr>
								<th >서비스 만료일자</th>
								<td>
									<%if(memberVO.getExpiry_date()!=null ){%>
									<%=memberVO.getExpiry_date() %>
									<%}%>
								</td>
							</tr>
							
						</tbody>
					</table>
	</div>
</div>
<!-- //container -->
