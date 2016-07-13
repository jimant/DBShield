<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="kr.co.jimant.fo4s.vo.AdminVO"%>
<%
	AdminVO adminVO = (AdminVO) session.getAttribute("SESSION_ADMIN_INFO");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>FO4S</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
</head>
<body>
	
	<div class="bs-docs-example">
            <div class="navbar navbar-inverse" style="position: static;">
              <div class="navbar-inner">
                <div class="container">
                  <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </a>
                  <a href="#" class="brand" style="cursor:default"><b>FO4S</b></a>
                  <div class="nav-collapse collapse navbar-inverse-collapse">
                    <ul class="nav">
                      <li class="active"><a href="#" style="cursor:default">JIMANT</a></li>
<!--                       <li><a href="#">Link</a></li> -->
<!--                       <li><a href="#">Link</a></li> -->
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">KEY <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li class="nav-header">키암호키</li>
                          <li><a href="./kekMakePage.do">키암호키 생성</a></li>
                          <li><a href="./kekBackupPage.do">키암호키 백업복구</a></li>
                          <li class="divider"></li>
                          <li class="nav-header">암호키</li>
                          <li><a href="./eckMakePage.do">암호키 생성</a></li>
                          <li><a href="./eckRemakePage.do">암호키 재생성</a></li>
                          <li><a href="./eckBackupPage.do">암호키 백업복구</a></li>
                        </ul>
                      </li>
                     <li class="divider-vertical"></li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">암호정책 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li class="nav-header">글로벌 </li>
                          <li><a href="./globalPolicyConnect.do">암호정책 설정</a></li>
                          <li><a href="./globalPolicyView.do">암호정책</a></li>
                          <li class="divider"></li>
                          <li class="nav-header">컬럼별 </li>
                          <li><a href="./columnPolicyConnect.do">암호정책 설정</a></li>
                          <li><a href="./columnPolicyView.do">암호정책 목록</a></li>
                          
                        </ul>
                      </li>
                     <li class="divider-vertical"></li>
                       <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">접근제어 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li class="nav-header">정책기반 </li>
                          <li><a href="./policyACPage.do">접근제어 설정</a></li>
                          <li><a href="./policyACViewPage.do">접근제어 목록</a></li>
                          <li class="divider"></li>
                          <li class="nav-header">행위기반 </li>
                          <li><a href="./behaviorACPage.do">접근제어 설정</a></li>
                          <li><a href="./behaviorACViewPage.do">접근제어 목록</a></li>
                        </ul>
                      </li>
                     <li class="divider-vertical"></li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">작업승인 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li><a href="./workApproveRequestPage.do">승인요청</a></li>
                          <li><a href="./workApproveCancelPage.do">승인취소</a></li>
                          <li><a href="./workApprovePage.do">승인</a></li>
                         
                        </ul>
                      </li>
                     <li class="divider-vertical"></li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">관리자 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li><a href="./adminAddPage.do">관리자 등록</a></li>
                          <li><a href="./adminViewPage.do">관리자 목록</a></li>
                         
                        </ul>
                      </li>
                      <li class="divider-vertical"></li>
                      <!-- <li><a href="./jniPage.do">JNI테스트</a></li> -->
<!--                       <li class="divider-vertical"></li> -->
<!--                       <li><a href="./reportPage.do">리포트</a></li> -->
<!--                       <li class="divider-vertical"></li> -->
<!--                       <li class="dropdown"> -->
<!--                         <a href="#" class="dropdown-toggle" data-toggle="dropdown">previewPage <b class="caret"></b></a> -->
<!--                         <ul class="dropdown-menu"> -->
<!--                           <li><a href="./previewPage.do">DB data 암복호화</a></li> -->
<!--                           <li><a href="./previewCryptionPage.do">암복호화 테스트</a></li> -->
<!--                            <li><a href="./previewCryptPage.do">암복호화 테스트2</a></li> -->
<!--                           <li><a href="./previewKeyPage.do">key 테스트</a></li> -->
                         
<!--                         </ul> -->
<!--                       </li> -->
<!--                       <li><a href="./previewPage.do">previewPage</a></li> -->
                   </ul>
<!--                     <form class="navbar-search pull-left" action=""> -->
<!--                       <input type="text" class="search-query span2" placeholder="Search"> -->
<!--                     </form> -->
                    <ul class="nav pull-right">
                    <%if(adminVO != null){ %><li><a href="./logout.do">로그아웃</a></li><%} %>
<%--                     	<c:when test="${SESSION_ADMIN_INFO != null}"> --%>
<!-- 					        <li><a href="./logout.do">로그아웃</a></li> -->
<%-- 					    </c:when> --%>
<!--                       <li class="divider-vertical"></li> -->
<!--                       <li class="dropdown"> -->
<!--                         <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a> -->
<!--                         <ul class="dropdown-menu"> -->
<!--                           <li><a href="#">Action</a></li> -->
<!--                           <li><a href="#">Another action</a></li> -->
<!--                           <li><a href="#">Something else here</a></li> -->
<!--                           <li class="divider"></li> -->
<!--                           <li><a href="#">Separated link</a></li> -->
<!--                         </ul> -->
<!--                       </li> -->
                    </ul>
                  </div><!-- /.nav-collapse -->
                </div>
              </div><!-- /navbar-inner -->
            </div><!-- /navbar -->
          </div>
	
	
		<!-- header -->
		<br></br>
		<!-- //header -->