<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>JIMANT</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
</head>
<body>
	
	<div class="navbar-wrapper">
      <div class="container">

        <div class="navbar navbar-inverse navbar-static-top" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#" style="cursor:default">JIMANT</a>
            </div>
            <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="./mainPage.do">Home</a></li>
<!--                 <li><a href="#about">About</a></li> -->
                <li><a href="./noticeList.do">공지사항</a></li>
                <li><a href="./forumThemeList.do">포럼</a></li>
                <li><a href="./inquiryThemeList.do">Q&A</a></li>
                <li><a href="./requestList.do">서비스요청</a></li>
                <c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null && SESSION_MEMBER_INFO.admin == 'S' }" > 
                 <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">관리자 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="./noticeRegisterPage.do">공지사항등록</a></li>
                    <li><a href="./forumThemeRegisterPage.do">포럼주제등록</a></li>
                    <li><a href="./inquiryThemeRegisterPage.do">Q&A주제등록</a></li>
                    <li><a href="./memberList.do">회원목록</a></li>
<!--                     <li><a href="#">Something else here</a></li> -->
<!--                     <li class="divider"></li> -->
<!--                     <li class="dropdown-header">Nav header</li> -->
<!--                     <li><a href="#">Separated link</a></li> -->
<!--                     <li><a href="#">One more separated link</a></li> -->
                  </ul>
                </li>
                </c:if>
                <li><a href="#">DBSild</a></li>
                <li><a href="#">Framwork</a></li>
              </ul>
	          <ul class="nav navbar-nav navbar-right">
		        <c:choose>
					    <c:when test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null }">
					    	<li><a href="./myPage.do">마이페이지</a></li>
					        <li><a href="./logout.do">로그아웃</a></li>
					    </c:when>
					   
					    <c:otherwise>
					       	<li><a href="./loginPage.do">로그인</a></li>
					       	<li><a href="./findPasswordPage.do">비밀번호찾기</a></li>
		            		<li><a href="./joinPage.do">회원가입</a></li>
					    </c:otherwise>
				</c:choose>    
	          </ul>
            </div>
          </div>
        </div>

<!--       </div> -->
<!--     </div> -->
	
	
		<!-- header -->

		<!-- //header -->