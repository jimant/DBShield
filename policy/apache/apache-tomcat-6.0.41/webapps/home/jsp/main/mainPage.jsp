<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.forum.ForumVO"%>
<%@ page import="kr.co.jimant.home.inquiry.InquiryVO"%>
<%@ page import="kr.co.jimant.home.notice.NoticeVO"%>
<%
ArrayList<NoticeVO> noticeList = (ArrayList) request.getAttribute("noticeList");
ArrayList<InquiryVO> inquiryList = (ArrayList) request.getAttribute("inquiryList");
ArrayList<ForumVO> forumList = (ArrayList) request.getAttribute("forumList");

%>
<script>

function inquiryList(inquiry_theme_id, cnt) {
	var params="inquiry_theme_id="+inquiry_theme_id;  
    $.ajax({
        type : "post",
        url : "<c:url value='/getInquiryList.aj'/>",
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
				content  += "<td>" + "<a href='./inquiryDetail.do?inquiry_id=" + data.result[i].inquiry_id + "'>" + data.result[i].inquiry_title + "</a>" +"</td>";
				content  += "<td>" + data.result[i].create_date +"</td>";
				content  += "</tr>";
			}
			content  += "</tbody>"
			content  += "</table>";
        	$("#inquiryList"+cnt).html(content);
        },
        error : function(xhr, textStatus) {
//         	alert("error");
            
        }
    });
}

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
	<%for (int i = 0; i < inquiryList.size(); i++) {InquiryVO inquiryVO = (InquiryVO) inquiryList.get(i);%>
	inquiryList(<%=inquiryVO.getInquiry_theme_id()%>,<%=i%>);
	
	<%}%>
	
	<%for (int i = 0; i < forumList.size(); i++) {ForumVO forumVO = (ForumVO) forumList.get(i);%>
	forumList(<%=forumVO.getForum_theme_id()%>,<%=i%>);

	<%}%>
	
});
</script>
	</div>
</div>
    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="data:image/gif;base64,R0lGODlhAQABAIAAAGZmZgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="data:image/gif;base64,R0lGODlhAQABAIAAAFVVVQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->



    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

<!--  
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style="width: 140px; height: 140px;">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-lg-4">
          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style="width: 140px; height: 140px;">
          <h2>Heading</h2>
          <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-lg-4">
          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style="width: 140px; height: 140px;">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>
-->

      <!-- START THE FEATURETTES -->

<!--       <hr class="featurette-divider"> -->

      <div class="row featurette">
<!--         <div class="col-md-7"> -->
<!--           <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2> -->
<!--           <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p> -->
<!--         </div> -->
<!--         <div class="col-md-5"> -->
<!--           <img class="featurette-image img-responsive" data-src="holder.js/500x500/auto" alt="Generic placeholder image"> -->
<!--         </div> -->
			<h2>공지사항</h2>
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
					<%for (int i = 0; i < noticeList.size(); i++) {NoticeVO noticeVO = (NoticeVO) noticeList.get(i);%>
					<tr>
						<td><%=noticeVO.getRownum() %></td>
						
						<td><a href="./noticeDetail.do?notice_id=<%=noticeVO.getNotice_id()%>"><%=noticeVO.getNotice_title() %></a></td>
						<td><%=noticeVO.getCreate_date()%></td>
					</tr>
					<%}%>
				</tbody>
			</table>
      </div>

<!--       <hr class="featurette-divider"> -->

      <div class="row featurette">
<!--         <div class="col-md-5"> -->
<!--           <img class="featurette-image img-responsive" data-src="holder.js/500x500/auto" alt="Generic placeholder image"> -->
<!--         </div> -->
<!--         <div class="col-md-7"> -->
<!--           <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2> -->
<!--           <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p> -->
<!--         </div> -->
			<h2>Q&A</h2>
			<%for (int i = 0; i < inquiryList.size(); i++) {InquiryVO inquiryVO = (InquiryVO) inquiryList.get(i);%>
	    		<h3><a href="./inquiryList.do?inquiry_theme_id=<%=inquiryVO.getInquiry_theme_id()%>"><%=inquiryVO.getInquiry_theme() %></a></h3>
	    		<%=inquiryVO.getInquiry_explain()%>
	    		<div id="inquiryList<%=i%>"></div>
	    	<%}%>
      </div>

<!--       <hr class="featurette-divider"> -->

      <div class="row featurette">
<!--         <div class="col-md-7"> -->
<!--           <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2> -->
<!--           <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p> -->
<!--         </div> -->
<!--         <div class="col-md-5"> -->
<!--           <img class="featurette-image img-responsive" data-src="holder.js/500x500/auto" alt="Generic placeholder image"> -->
<!--         </div> -->
			<h2>포럼</h2>
			<%for (int i = 0; i < forumList.size(); i++) {ForumVO forumVO = (ForumVO) forumList.get(i);%>
	    		<h3><a href="./forumList.do?forum_theme_id=<%=forumVO.getForum_theme_id()%>"><%=forumVO.getForum_theme() %></a></h3>
	    		<%=forumVO.getForum_explain()%>
	    		<div id="forumList<%=i%>"></div>
	    	<%}%>
      </div>

    </div><!-- /.container -->

<div class="container">
 <div>