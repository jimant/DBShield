<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.encryption.WorkVO"%>
<% 
	ArrayList<WorkVO> list = (ArrayList) request.getAttribute("list");
	String request_id = (String) request.getAttribute("request_id");
	
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>
<script>
function checkboxDelete(){
	obj = document.getElementsByName("c1");
	
	var i = 0;
	var msg="";
	while( obj[i] ) {
		// checkbox 는 같은 Deepth상에 존재하는 이름은 같으나 Value가 다른 Node이다 . 즉 , 배열이라는 소리 ^^;
		// 총 5개이므로 5번 Loop를 수행한 후 obj[5]부터는 존재하지 않기에 Loop를 탈출한다. <-- 배열 index는 0부터죠?
		if(obj[i].checked == true ){
			msg+=obj[i].value+"/"; // '/'는 구분 문자열로 차후 spilt해서 사용을 할 수 있다.
		}
		i++;
	}
	location.href = "./workApproveCancel.do?msg="+msg+"&request_id="+"<%=request_id%>";
}

$(document).ready(function(){
	
	$("#delete").click(function(event) {
		checkboxDelete();			
	});
});
</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
				<form class="form-search" id="searchform" method="post">
				  <strong>요청 ID</strong>
				  <div class="input-append">
				    <input type="text" class="span10 search-query" name="request_id" >
				    <button type="submit" class="btn" formaction="./workApproveCancelPage.do">Search</button>
				  </div>
				</form>
					<table class="table table-striped table-bordered table-hover table-condensed">
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
								<th></th>
								<th>요청 시간</th>
								<th>DB USER</th>
								<th>작업 IP</th>
								<th>시작 시간</th>
								<th>종료 시간</th>
							</tr>
						</thead>
						<tbody>
							<%for (int i = 0; i < list.size(); i++) {WorkVO workVO = (WorkVO) list.get(i);%>
							
								<tr class="ac">
									<td><input type="checkbox" name="c1" value="<%=workVO.getWork_control_id()%>"></td>
									<td><%=workVO.getRequest_time() %></td>
									<td><%=workVO.getWork_db_user() %></td>
									<td><%=workVO.getWork_ip() %></td>
									<td><%=workVO.getWork_start_time() %></td>
									<td><%=workVO.getWork_end_time() %></td>
								</tr>
								
							<%}%>	
						</tbody>
					</table>
					<input type="button" class="btn" id="delete" value="취소" />
					<ul class="pager">
								<%if (nowpage <= 1) {%>
								<li><a>Previous</a></li> &nbsp;
								<%} else {%>
								<li><a href="./workApproveCancelPage.do?page=<%=nowpage - 1%>&request_id=<%=request_id%>">Previous</a></li>&nbsp;
								<%}%>
								<%for (int a = startpage; a <= endpage; a++) {if (a == nowpage) {%>
								<%=a%>
								<%} else {%>
								<a href="./workApproveCancelPage.do?page=<%=a%>&request_id=<%=request_id%>"><%=a%> </a>
								<%}%>
								<%}%>
								<%if (nowpage >= maxpage) {%>
								<li><a>Next</a></li>
								<%} else {%>
								<li><a href="./workApproveCancelPage.do?page=<%=nowpage + 1%>&request_id=<%=request_id%>">Next</a></li>
								<%}%>
					</ul>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
