<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=7" />
        <title>jimant</title>
        
        <!-- Common CSS import -->
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_main.css" />
        
        <!-- Common JS import -->
        <script language="javascript" type="text/javascript" src="/${_ContextPath}/js/jquery-1.4.4.js"></script>
        <script language="javascript" type="text/javascript" src="/${_ContextPath}/js/common.js"></script>
    
        <!-- JavaScript -->
        <script language="javascript" type="text/javascript">
        	function main() {
         		location.href = "${_ContextPath}/main.do";
        	}
        </script>
    </head>
    <body onload="main()">
    </body>
</html>