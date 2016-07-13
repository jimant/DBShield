<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.fo4s.vo.AccessControlVO"%>
<%
	ArrayList<AccessControlVO> list = (ArrayList) request.getAttribute("list");

	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>
<script>

function policyDelete(msg) {
	var params="msg="+msg;
    $.ajax({
        type : "post",
        url : "<c:url value='/policyCheckDelete.aj'/>",
        dataType : "html",
        data : params,
        success : function(data) {
            if (data == "success") {
            	alert("정책을 암호화 시스템에 적용하려면 키/정책 업로더를 stop후 start하여 주세요.");
            	document.location.reload();
            }
        },
        error : function(xhr, textStatus) {
//         	alert("error");
            
        }
    });
}

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
//	location.href = "./policyCheckDelete.do?msg="+msg;
	policyDelete(msg);
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
		<H3>정책기반 접근제어 목록</H3>
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
								<th>접속 IP</th>
								<th>DB USER</th>
								<th>시작 시간</th>
								<th>종료 시간</th>
								<th>프로그램명</th>
							</tr>
						</thead>
						<tbody>
						<%for (int i = 0; i < list.size(); i++) {AccessControlVO accessControlVO = (AccessControlVO) list.get(i);%>
						
							<tr class="ac">
								<td><input type="checkbox" name="c1" value="<%=accessControlVO.getPolicy_access_control_id()%>"></td>
								<td><%=accessControlVO.getConnect_ip() %></td>
								<td><%=accessControlVO.getConnect_db_user() %></td>
								<td>
									<%if(accessControlVO.getStart_time()!=null && !accessControlVO.getStart_time().equals("ALL") ){ %>
										<%=accessControlVO.getStart_time() %>
									<%}else{%>ALL<%}%>
								</td>
								<td>
									<%if(accessControlVO.getEnd_time()!=null && !accessControlVO.getEnd_time().equals("ALL") ){ %>
										<%=accessControlVO.getEnd_time() %>
									<%}else{%>ALL<%}%>
								</td>
								<td><%=accessControlVO.getConnect_program_name() %></td>
							</tr>
							
						<%}%>		
						</tbody>
					</table>
					<input type="button" class="btn" id="delete" value="삭제" />
					<ul class="pager">
								<%if (nowpage <= 1) {%>
								<li><a>Previous</a></li> &nbsp;
								<%} else {%>
								<li><a href="./policyACViewPage.do?page=<%=nowpage - 1%>">Previous</a></li>&nbsp;
								<%}%>
								<%for (int a = startpage; a <= endpage; a++) {if (a == nowpage) {%>
								<%=a%>
								<%} else {%>
								<a href="./policyACViewPage.do?page=<%=a%>"><%=a%> </a>
								<%}%>
								<%}%>
								<%if (nowpage >= maxpage) {%>
								<li><a>Next</a></li>
								<%} else {%>
								<li><a href="./policyACViewPage.do?page=<%=nowpage + 1%>">Next</a></li>
								<%}%>
					</ul>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
