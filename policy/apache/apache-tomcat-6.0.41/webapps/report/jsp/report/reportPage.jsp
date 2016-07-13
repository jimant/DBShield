<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%
	String startDate = (String) request.getAttribute("startDate");
	String endDate = (String) request.getAttribute("endDate");
%>

<link rel="stylesheet" type="text/css" href="${_ContextPath}/css/jquery.ptTimeSelect.css" />
<script type="text/javascript" src="${_ContextPath}/js/jquery.ptTimeSelect.js"></script>
<script language="javascript" type="text/javascript" src="${_ContextPath}/js/chart/Chart.js"></script>

    <script>
	        $(function() {
	            $("#datepickerStart").datepicker();
	        });
	        $(function() {
	            $("#datepickerEnd").datepicker();
	        });
	        $(function() {
	            $('#ptTimeStart').ptTimeSelect();
	        });
	        $(function() {
	            $('#ptTimeEnd').ptTimeSelect();
	        });
	        
	        function drawChart(data) {
                var result = JSON.parse(data);
                //alert(JSON.stringify(result));
                //myPie.clear();
                //alert(myPie.segments.length);
                /* 
                for (var i = 0; i < myPie.segments.length+4; i++) {
                	myPie.removeData();
                }
                 */
                var ctx = document.getElementById("chart-area").getContext("2d");
                var myPie = new Chart(ctx).Pie(result);
                /* 
                for (var j = 0; j < result.length; j++) {
                    myPie.addData(result[j]);
                }
                 */
                //myPie.update();
	        }

	        function search() {
	            
	            $.ajax({
	                type : "post",
	                url : "<c:url value='/getAccessLog.aj'/>",
	                dataType : "html",
	                data : $("#searchConditionform").serialize(),
	                success : function(response) {
	                	var data = jQuery.parseJSON(response);
	                	$('#logList').hide();
	                	if(data.length>0){
	                		drawChart(response);
	                		$('#chart').show();
	                		$("#pdfChart").show();
	                	}else{alert("조회결과가 없습니다.");}
	                },
	                error : function(xhr, textStatus) {

	                }
	            });
	        }
	        
	        function logList() {

	            $.ajax({
	                type : "post",
	                url : "<c:url value='/getLogList.aj'/>",
	                dataType : "html",
	                data : $("#searchConditionform").serialize(),
	                success : function(response) {
	                	$('#chart').hide();
	                	var data = jQuery.parseJSON(response);
	                	if(data.result.length>0){
	                		var content = "<table class='table table-striped table-bordered table-hover table-condensed'>";
		                	content  += "<colgroup>";
		                	content  += "<col width='' />";
		                	content  += "<col width='' />";
		                	content  += "<col width='' />";
		                	content  += "<col width='' />";
		                	content  += "<col width='' />";
		                	content  += "<col width='' />";
		                	content  += "</colgroup>";
		                	content  += "<thead>";
							content  += "<tr>";
		                	content  += "<th>" + "접근 IP" +"</th>";
		        			content  += "<th>" + "접근 DB USER" +"</th>";
		        			content  += "<th>" + "암복호화" +"</th>";
		        			content  += "<th>" + "허용여부" +"</th>";
		        			content  += "<th>" + "거부이유" +"</th>";
		        			content  += "<th>" + "접근횟수" +"</th>";
		        			content  += "</tr>";
		        			content  += "</thead>";
		        			content += "<tbody>";
		        			for (var i = 0; i < data.result.length; i++) {
		        				content  += "<tr>";
		        				content  += "<td>" + data.result[i].connect_ip +"</td>";
		        				content  += "<td>" + data.result[i].connect_db_user +"</td>";
		        				content  += "<td>" + data.result[i].encryption_yn +"</td>";
		        				content  += "<td>" + data.result[i].allow_yn +"</td>";
		        				content  += "<td>" + data.result[i].deny_reason +"</td>";
		        				content  += "<td>" + data.result[i].count +"</td>";
		        				content  += "</tr>";
		        			}
		        			content += "<tbody>";
		        			content += "</table>";
		                	$("#logList").html(content);
		                	$('#logList').show();
		                	$("#pdfTable").show();
	                	}else{alert("조회결과가 없습니다.");}
	                },
	                error : function(xhr, textStatus) {
	                    
	                }
	            });
	        }
	        
	        $(document).ready(function(){
	        	$('#connect_ip').prop('readonly', true);
	        	$('#connect_db_user').prop('readonly', true);
	        	
	        	
	        	$("#pdfTable").hide();
	        	$("#pdfChart").hide();
	        	
	            $("#searchButton").click(function(event) {
	            	if($("#IP option:selected").val()=="Direct" && $("#connect_ip").val()==""){
	            		alert("IP를 입력하세요.");
	            		return false;
	            	}
	            	if($("#USER option:selected").val()=="Direct" && $("#connect_db_user").val()==""){
	        			alert("DB user를 입력하세요.");
	        			return false;
	        		}
	            	$("#pdfChart").hide();
	            	$("#pdfTable").hide();
	            	$('#chart').hide();
	                search();
	            });
	            $("#listButton").click(function(event) {
	            	if($("#IP option:selected").val()=="Direct" && $("#connect_ip").val()==""){
	            		alert("IP를 입력하세요.");
	            		return false;
	            	}
	            	if($("#USER option:selected").val()=="Direct" && $("#connect_db_user").val()==""){
	            		alert("DB user를 입력하세요.");
	        			return false;
	        		}
	            	$("#pdfChart").hide();
	            	$("#pdfTable").hide();
	            	$('#logList').hide();
	                logList();
	            });
	            $("#pdfChart").click(function(event) {
	            	document.searchConditionform.action='./pdfChart.do';
	            	searchConditionform.submit();
	            });
	            $("#pdfTable").click(function(event) {
	            	document.searchConditionform.action='./pdfTable.do';
	            	searchConditionform.submit();
	            });
	            
	            $("#IP").change(function() {
	        		if($("#IP option:selected").val()=="ALL"){
	        			$("#connect_ip").val("");
	        			$('#connect_ip').prop('readonly', true);
	        		}else if($("#IP option:selected").val()=="Direct"){
	        			$('#connect_ip').prop('readonly', false);
	        		}
	        	});
	            
	            $("#USER").change(function() {
	        		if($("#USER option:selected").val()=="ALL"){
	        			$("#connect_db_user").val("");
	        			$('#connect_db_user').prop('readonly', true);
	        		}else if($("#USER option:selected").val()=="Direct"){
	        			$('#connect_db_user').prop('readonly', false);
	        		}
	        	});
	            
	        });

    </script>

<!-- container -->
<div class="container-fluid ">
    <div class="row-fluid ">
        <div class="span2">
            
        </div>
        <div class="span8">
        <H3>DB보안 접근로그 리포트(top N)</H3>
          <form method="post" id="searchConditionform" name="searchConditionform">
              <table class="table table-condensed">
                  <colgroup>
                  <col width="20%" />
                  <col width="80%" />
                  </colgroup>
                  <tbody>
                       <tr>
                          <th class="al"> 접근 IP</th>
                          <td>
                          <input type="text" id="connect_ip" name="connect_ip" value="" />
                           <select class="ml10" id="IP">
                                      <option value="ALL">전체</option>
                                      <option value="Direct">직접입력</option>
                           </select>
                          </td>
                       </tr>  
                       <tr>  
                          <th class="al"> 접근 DB User</th>
                          <td><input type="text" id="connect_db_user" name="connect_db_user" value=""/>
                          <select class="ml10" id="USER">
                                      <option value="ALL">전체</option>
                                      <option value="Direct">직접입력</option>
                           </select>
                          
                          </td>
                       </tr> 
                       <tr>  
                          <th class="al"> 기간</th>
                          <td>
                              <input type="text" id="datepickerStart" name="datepickerStart" value="<%=startDate%>"/>
                              <input type="text" id="ptTimeStart" name="ptTimeStart" value="12:00 AM"/> ~ <input type="text" id="datepickerEnd" name="datepickerEnd" value="<%=endDate%>"/>
                              <input type="text" id="ptTimeEnd" name="ptTimeEnd" value="11:59 PM"/>
                          </td>
                       </tr>
                       <tr>  
                       	  <th class="al"> 암복호화</th>	 
                          <td>
                              <select class="ml10" id="encryption_yn" name="encryption_yn">
                                      <option value="">전체</option>
                                      <option value="Y">암호화</option>
                                      <option value="N">복호화</option>
                              </select>
                          </td>
                       </tr> 
                       <tr> 
                          <th class="al"> 접근</th>
                          <td>
                              <select class="ml10" id="allow_yn" name="allow_yn">
                                      <option value="">전체</option>
                                      <option value="Y">허용</option>
                                      <option value="N">차단</option>
                              </select>
                          </td>
                       </tr>
                       <tr>    
                          <th class="al"> TOP N</th>
                          <td><input type="text" name="topN" value="10"/></td>
                          <td> <!-- <input type="button" class="btn" id="searchButton" value="조회" /> --></td>
                      </tr>
                      <tr>
                      	  <th class="al"> </th>
                          <td > <input type="button" class="btn" id="searchButton" value="차트" />&nbsp;<input type="button" class="btn" id="listButton" value="리스트" /></td>
                      </tr>
                      <tr>
<!--                       <th class="al"> </th> -->
<%--                       	<td><canvas id="chart-area" width="900" height="300"/></td> --%>
<!--                       </tr> -->
                  </tbody>
              </table>
          </form>
          <div id = "chart"><canvas id="chart-area" width="900" height="300"/></div><br></br>
          <input type="button" class="btn" id="pdfChart" value="다운로드" />
          <div id="logList"></div>
          <input type="button" class="btn" id="pdfTable" value="다운로드" />
        </div>
        
        
        <div class="span2"></div>
    </div>
</div>
<!-- //container -->
