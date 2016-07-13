<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>JIMANT</title>
		<!-- Bootstrap -->
<%-- 		<link href="${_ContextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" /> --%>
        <!-- Common CSS import -->
<%--         <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub.css" /> --%>
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/carousel.css" />
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/signin.css" />
		
        <!-- Common JS import -->
        
		<script type="text/javascript" src="${_ContextPath}/js/jquery-1.7.2.min.js" ></script>
		<script type="text/javascript" src="${_ContextPath}/js/jquery-ui-1.8.5.custom.min.js"></script>
		
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
		<script type="text/javascript" src="${_ContextPath}/js/common.gnb-left.js"></script>
		<script type="text/javascript" src="${_ContextPath}/js/jquery.number.js"></script>
		<script type="text/javascript" src="${_ContextPath}/js/jquery.ui.datepicker-ko.js"></script>
        <!-- Bootstrap -->
<%-- 		<script src="${_ContextPath}/bootstrap/js/bootstrap.min.js"></script> --%>
		
		<!-- Include bootstrap stylesheets -->
    	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
		<!-- JavaScript placed at the end of the document so the pages load faster -->
	    <!-- Optional: Include the jQuery library -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	    <!-- Optional: Incorporate the Bootstrap JavaScript plugins -->
	    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		
        <decorator:head />
	</head>
    <body>
        
        <!-- 전체 영역 ST. -->
            
            <!-- TOP 영역 ST. -->
                <page:applyDecorator page="/jsp/decorators/sub_top.jsp"  name="sub_top" />
            <!-- TOP 영역 ED. -->
            
            <!-- SUB 영역 ST. -->
            
                <!-- CONTENT 영역 ST. -->
                    <decorator:body />
                <!-- CONTENT 영역 ED. -->
                
            <!-- SUB 영역 ED. -->
            	<page:applyDecorator page="/jsp/decorators/sub_foot.jsp"  name="sub_foot" />
        <!-- 전체 영역 ED. -->
        
	</body>
</html>