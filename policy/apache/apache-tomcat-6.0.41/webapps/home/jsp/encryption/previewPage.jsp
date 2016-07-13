<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>

</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
				<form action="./previewEncryptPage.do" method="post" id="dbConnectionform" name="dbConnectionform">
					<table summary="신청 상세 내역 영역입니다." class="basic">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> Select DB</th>
								<td>
									
									<select class="ml10" name="selectDB">
											<option value="M">MySQL</option>
											<option value="O">Oracle</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="al"> Host</th>
								<td><input type="text"  name="host" value="localhost"/></td>
							</tr>
							<tr>
								<th class="al"> User</th>
								<td><input type="text"  name="user" value="root"/></td>
							</tr>
							<tr>
								<th class="al"> Password</th>
								<td><input type="password"  name="password" value="hitcom123"/></td>
							</tr>
							<tr>
								<th class="al"> DB Name</th>
								<td><input type="text"  name="database" value="CUSTOM_DB"/></td>
							</tr>
							<tr>
								<th class="al"> Port</th>
								<td><input type="text"  name="port" value="3306"/></td>
							</tr>
							<tr>
								<th class="al"></th>
								<td> <input type="submit" class="btn" value="연결" /></td>
							</tr>
						</tbody>
					</table>
				</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
