
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.forum.ForumVO"%>
<%
	ArrayList<ForumVO> list = (ArrayList) request.getAttribute("list");
%>

<script>

function forumList(forum_theme_id, cnt) {
	var params="forum_theme_id="+forum_theme_id;  
    $.ajax({
        type : "post",
        url : "<c:url value='/getForumList.aj'/>",
        dataType : "html",
        data : params,
        success : function(response) {
        	var data = jQuery.parseJSON(response);
        	
        	var content = "<table class='table table-hover'>";
        	content  += "<colgroup>"
			
        	content  += "<col width='' />"
        	content  += "<col width='' />"
        	content  += "<col width='' />"
	
			content  += "</colgroup>"
			
			content  += "<thead>"
        	content  += "<tr>";
        	content  += "<th>" + "번호" +"</th>";
			content  += "<th>" + "제목" + "</th>";
			content  += "<th>" + "등록일" +"</th>";
			content  += "</tr>";
			content  += "</thead>"
			content  += "<tbody>"
			for (var i = 0; i < data.result.length; i++) {
				content  += "<tr>";
				content  += "<td>" + data.result[i].rownum +"</td>";
				content  += "<td>" + "<a href='./forumDetail.do?forum_id=" + data.result[i].forum_id + "'>" + data.result[i].forum_title + "</a>" +"</td>";
				content  += "<td>" + data.result[i].create_date +"</td>";
				content  += "</tr>";
			}
			content  += "</tbody>"
			content  += "</table>";
        	$("#forumList"+cnt).html(content);
        },
        error : function(xhr, textStatus) {
//         	alert("error");
            
        }
    });
}


$(document).ready(function(){
	<%for (int i = 0; i < list.size(); i++) {ForumVO forumVO = (ForumVO) list.get(i);%>
		forumList(<%=forumVO.getForum_theme_id()%>,<%=i%>);
	
	<%}%>
});
</script>



<!-- container -->
	 <div class="jumbotron">
      <div class="container">
        <h2>포럼</h2>
    
    	<%for (int i = 0; i < list.size(); i++) {ForumVO forumVO = (ForumVO) list.get(i);%>
    		<h3><a href="./forumList.do?forum_theme_id=<%=forumVO.getForum_theme_id()%>"><%=forumVO.getForum_theme() %></a></h3>
	    	<%=forumVO.getForum_explain()%>
    		<div id="forumList<%=i%>"></div>
    	<%}%>
    	
		
		
	  </div>
    </div>	
<!-- //container -->