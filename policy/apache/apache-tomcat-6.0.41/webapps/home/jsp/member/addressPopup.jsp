<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>JIMANT</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
 
<style type="text/css">
</style>
 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="${_ContextPath}/js/jquery.number.js"></script>
<script type="text/javascript" src="${_ContextPath}/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="${_ContextPath}/js/common.gnb-left.js"></script>



<script>

function apply(postcd1, postcd2, addressMain) {
	
	var json = [];
	var address = {
			postcd1:postcd1,
			postcd2:postcd2,
			addressMain:addressMain
		};
	json.push(address);
	
	if (json.length == 0) {
		alert("선택해 주시기 바랍니다");
		return;
	} else {
		//alert(json.postcd1);
		//alert(json.postcd2);
		//alert(json.addressMain);
		eval(opener.addressPopupCallBack(postcd1, postcd2, addressMain));
		self.close();
	}
}

function postSearch() {
	
	if ($("#search_address").val() == "") {
		alert("'동' 을 입력해 주시기 바랍니다.");
	} else {
// 		$.post(
// 				"<c:url value='/postcd.aj'/>?address=" + $("#search_address").val(), 
// 				function(result) {
// 					//alert(result);
// 					if (result) {
// 						var obj = eval("("+result+")");
// 						for (var i = 0; i < obj.postcdList.length; i++) {
// 							var postcd1 = obj.postcdList[i].postcd.substring(0,3);
// 							var postcd2 = obj.postcdList[i].postcd.substring(3,6);
// 							var address = obj.postcdList[i].address;
// 				        	$add_html = "<tr><td>" + postcd1 + "-" + postcd2 + "</td><td>" + address + "</td><td><input type='button' onclick='apply(\"" + postcd1 + "\",\"" + postcd2 + "\",\"" + address + "\");' value='적용'/></td></tr>";
// 				            $('.d_tbody').append($add_html);
// 						}
// 					} else {
// 						//alert('실패');
// 					}
// 				}
// 		);
		
		$.ajax({
			type: "POST",
			url: "<c:url value='/postcd.aj'/>",
			data: $("#postform").serialize(),
			success: function(result) {
				//alert(result);
				if (result) {
					var obj = eval("("+result+")");
					for (var i = 0; i < obj.postcdList.length; i++) {
						var postcd1 = obj.postcdList[i].postcd.substring(0,3);
						var postcd2 = obj.postcdList[i].postcd.substring(3,6);
						var address = obj.postcdList[i].address;
			        	$add_html = "<tr><td>" + postcd1 + "-" + postcd2 + "</td><td>" + address + "</td><td><input type='button' onclick='apply(\"" + postcd1 + "\",\"" + postcd2 + "\",\"" + address + "\");' value='적용'/></td></tr>";
			            $('.d_tbody').append($add_html);
					}
				} else {
					//alert('실패');
				}
			}
		});
		
	}
}



$(document).ready(function(){
	
	$('#postSearch').css('cursor', 'pointer');
	$("#postSearch").keyup(function(e) {
		if (e.keyCode == 13) {
			postSearch();
		}
	});
	$("#postSearch").click(function() {
		postSearch();
	});
	
});



</script>



</head>
<body>


<!-- container -->
	<div id="container" class="white"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>주소 입력</strong></h2>
		
		<form action="./postcd.aj" method="post" id="postform" name="postform" onsubmit ="return false;">
			<input type="text" id="search_address" name="search_address" class="max gray mt20" />
		
			<input type="button" id="postSearch" value="검색" />
			
			<div class="combine">
				<table summary="신청 상세 내역 영역입니다." class="basic_gray">
					<colgroup>
					<col width="20%" />
					<col width="80%" />
					</colgroup>
					<thead>
						<tr>
							<th>번지</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody class="d_tbody">
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<!-- //container -->

</body>
</html>