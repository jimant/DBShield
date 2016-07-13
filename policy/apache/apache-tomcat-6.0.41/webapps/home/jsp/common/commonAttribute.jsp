<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="_ContextPath" scope="page">
    ${pageContext.request.contextPath}
</c:set>
<c:set var="_BasePath" scope="page">
    ${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort} ${pageContext.request.contextPath}/
</c:set>
<c:set var="_RquestURI" scope="page">
    ${pageContext.request.requestURI}
</c:set>