<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.inquiry.InquiryVO"%>
<%@ page import="kr.co.jimant.home.common.UtilMgr"%>
<%
InquiryVO inquiryVO = (InquiryVO) request.getAttribute("inquiryVO");
ArrayList<InquiryVO> list = (ArrayList) request.getAttribute("list");

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

	function replyRegister(inquiry_id) {
		location.href = "./inquiryReplyPage.do?inquiry_id=" + inquiry_id;
	}
	
	function replyDelete(inquiry_id) {
		if (confirm("삭제 하시겠습니까?")) {
			location.href = "./inqiryReplyDelete.do?inquiry_id=" + inquiry_id +"&id=" + <%=inquiryVO.getInquiry_id()%>;
		} else {
		}
	}

	function inquiryDelete() {
		if (confirm("삭제 하시겠습니까?")) {

			location.href = "./inquiryDelete.do?inquiry_id=" + <%=inquiryVO.getInquiry_id()%>+"&inquiry_theme_id=" + <%=inquiryVO.getInquiry_theme_id()%>;
		} else {
		}
	}
	
	function inquiryModify() {

			location.href = "./inquiryModifyPage.do?inquiry_id=" + <%=inquiryVO.getInquiry_id()%>;
	}
	
	function inquiryRegister() {
		
		if (confirm("등록 하시겠습니까?")) {

			inquiryform.submit();
		} else {
		}
	}
	
	
	$(document).ready(function(){
		
		$("#register").click(function(event) {
			inquiryRegister();
		});
		
		$("#modify").click(function(event) {
			inquiryModify();
		});
		
		$("#delete").click(function(event) {
			inquiryDelete();
		});
	});
	
	
</script>

	<!-- container -->
			<table class="table table-striped table-bordered  table-condensed ">	
					<tr>
						<td><div><h3><%=inquiryVO.getInquiry_title() %></h3>
						<b>글쓴이: </b><%=inquiryVO.getName() %>&nbsp;&nbsp;
							<b>등록일: </b><%=inquiryVO.getCreate_date() %>
						</div></td>
					</tr>
					<tr>
						<td>
							<div align="left"><%=utilMgr.getContent(inquiryVO.getInquiry_content() )%></div>
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
			<%for (int i = 0; i < list.size(); i++) {InquiryVO inquiryvo = (InquiryVO) list.get(i);%>
			<%if (inquiryvo.getRe_lev() != 0) {%><%for (int a = 0; a <= inquiryvo.getRe_lev() * 2; a++) {%>&nbsp;<%}%><%} else {%><%}%>
			<ul id = 'blank' style="margin-left:<%=inquiryvo.getRe_lev()*2 %>0px; "  >	
					<li>
						<div>
							<h4><%=inquiryvo.getInquiry_title() %></h4>
							<h5><b>글쓴이: </b><%=inquiryvo.getName() %>&nbsp;&nbsp;<b>등록일: </b><%=inquiryvo.getCreate_date() %></h5>
						</div>
					</li>
					<li>
						<div align="left"><%=utilMgr.getContent(inquiryvo.getInquiry_content() )%></div>
					</li>
					<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null && SESSION_MEMBER_INFO.admin != null }" > 
					<li>
					 	<div>
					 		<input type="button" class ="btn " value="답글" onclick="javascript:replyRegister('<%=inquiryvo.getInquiry_id()%>')"/>
							<input type="button" class ="btn " value="삭제" onclick="javascript:replyDelete('<%=inquiryvo.getInquiry_id()%>')"/>
						</div>
					</li>
					</c:if>
			</ul>
			<%}%>
			<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null  }" > 
			<br></br>
			<form action="./inquiryReply.do"
								enctype="multipart/form-data" method="post" name="inquiryform">
								<input type="hidden" name="inquiry_theme_id" value="<%=inquiryVO.getInquiry_theme_id()%>"> 
								<input type="hidden" name="inquiry_id" value="<%=inquiryVO.getInquiry_id()%>"> 
								<input type="hidden" name="re_ref" value="<%=inquiryVO.getRe_ref()%>"> 
								<input type="hidden" name="re_lev" value="<%=inquiryVO.getRe_lev()%>"> 
								<input type="hidden" name="re_seq" value="<%=inquiryVO.getRe_seq()%>"> 
				<h3>댓글 쓰기</h3>				
				<table class="table table-hover ">
					<colgroup>
						<col width="10%" />
						<col width="90%" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text"  maxlength="128" name="inquiry_title" value="" style="width:100%;"  /></td>
						</tr>
						<tr>
							<th >내용</th>
							<td>
								<div >
								<!-- 에디터 영역 -->
								<TEXTAREA  name="inquiry_content" rows="" cols=""  maxlength="10000" style="width: 100%; height: 200px;"></TEXTAREA>
								</div>
							</td>
						</tr>
						
					</tbody>
					</table>
					<input type="button" class ="btn " id="register" value="등록" />
			</form>
			</c:if>
	<!-- //container -->