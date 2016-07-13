<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.fo4s.vo.WorkVO"%>
<% 
	ArrayList<WorkVO> list = (ArrayList) request.getAttribute("list"); 
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();

%>
<script>
function approve(msg) {
	var params="msg="+msg;
    $.ajax({
        type : "post",
        url : "<c:url value='/workApprove.aj'/>",
        dataType : "html",
        data : params,
        success : function(data) {
            if (data == "success") {
            	alert("승인된 작업통제 데이터를 암호화 시스템에 적용하려면 키/정책 업로더를 stop후 start하여 주세요.");
            	document.location.reload();
            }
        },
        error : function(xhr, textStatus) {
//         	alert("error");
            
        }
    });
}

function checkboxApprove(){
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
//	location.href = "./workApprove.do?msg="+msg;
	approve(msg);
}

function checkboxCancle(){
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
	location.href = "./approveCancle.do?msg="+msg;
}

$(document).ready(function(){
	
	$("#approve").click(function(event) {
		checkboxApprove();			
	});
	$("#cancle").click(function(event) {
		checkboxCancle();			
	});
});
</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
		<H3>승인</H3>
					<table class="table table-striped table-bordered table-hover table-condensed">
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
								<th></th>
								<th>요청 시간</th>
								<th>요청 ID</th>
								<th>DB USER</th>
								<th>작업 IP</th>
								<th>시작 시간</th>
								<th>종료 시간</th>
								<th>승인 시간</th>
								<th>시스템 적용일자</th>
							</tr>
						</thead>
						<tbody>
							<%for (int i = 0; i < list.size(); i++) {WorkVO workVO = (WorkVO) list.get(i);%>
							
								<tr class="ac">
									<td>
										<%if(workVO.getSystem_apply_date()==null){ %>
											<input type="checkbox" name="c1" value="<%=workVO.getWork_control_id()%>">
										<%}%>
									</td>
									<td><%=workVO.getRequest_time() %></td>
									<td><%=workVO.getRequest_id() %></td>
									<td><%=workVO.getWork_db_user() %></td>
									<td><%=workVO.getWork_ip() %></td>
									<td>
										<%if(workVO.getWork_start_time()!=null && !workVO.getWork_start_time().equals("ALL") ){ %>
											<%=workVO.getWork_start_time() %>
										<%}else{%>ALL<%}%>
									</td>
									<td>
										<%if(workVO.getWork_end_time()!=null && !workVO.getWork_end_time().equals("ALL") ){ %>
											<%=workVO.getWork_end_time() %>
										<%}else{%>ALL<%}%>
									</td>
									<td>
										<%if(workVO.getApprove_time()!=null){ %>
											<%=workVO.getApprove_time() %>
										<%}%>
									</td>
									<td>
										<%if(workVO.getSystem_apply_date()!=null){ %>
											<%=workVO.getSystem_apply_date() %>
										<%}%>
									</td>
								</tr>
								
							<%}%>	
						</tbody>
					</table>
					<br></br>
					<input type="button" class="btn" id="approve" value="승인" />&nbsp;<input type="button" class="btn" id="cancle" value="승인취소" />
					<ul class="pager">
								<%if (nowpage <= 1) {%>
								<li><a>Previous</a></li> &nbsp;
								<%} else {%>
								<li><a href="./workApprovePage.do?page=<%=nowpage - 1%>">Previous</a></li>&nbsp;
								<%}%>
								<%for (int a = startpage; a <= endpage; a++) {if (a == nowpage) {%>
								<%=a%>
								<%} else {%>
								<a href="./workApprovePage.do?page=<%=a%>"><%=a%> </a>
								<%}%>
								<%}%>
								<%if (nowpage >= maxpage) {%>
								<li><a>Next</a></li>
								<%} else {%>
								<li><a href="./workApprovePage.do?page=<%=nowpage + 1%>">Next</a></li>
								<%}%>
					</ul>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
