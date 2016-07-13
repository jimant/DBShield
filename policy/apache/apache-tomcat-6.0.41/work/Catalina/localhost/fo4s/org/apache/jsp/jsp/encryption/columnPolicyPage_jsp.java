package org.apache.jsp.jsp.encryption;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class columnPolicyPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/jsp/common/commonAttribute.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.release();
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write('\r');
      out.write('\n');
      if (_jspx_meth_c_005fset_005f1(_jspx_page_context))
        return;
      out.write('\r');
      out.write('\n');
      if (_jspx_meth_c_005fset_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("//숫자만입력\r\n");
      out.write("function onlyNumber(){\r\n");
      out.write("\tvar keycode = window.event.keyCode;\r\n");
      out.write("\t \r\n");
      out.write("\t  if(keycode == 8 || (keycode >= 35 && keycode <= 40) || (keycode >= 46 && keycode <= 57) || (keycode >= 96 && keycode <= 105) || keycode == 110 || keycode == 190) {\r\n");
      out.write("\t    window.event.returnValue = true;\r\n");
      out.write("\t    return;\r\n");
      out.write("\t  } else {\r\n");
      out.write("\t    window.event.returnValue = false;\r\n");
      out.write("\t    return;\r\n");
      out.write("\t  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function register() {\r\n");
      out.write("\r\n");
      out.write("    $.ajax({\r\n");
      out.write("        type : \"post\",\r\n");
      out.write("        url : \"");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("        dataType : \"html\",\r\n");
      out.write("        data : $(\"#columnPolicyform\").serialize(),\r\n");
      out.write("        success : function(data) {\r\n");
      out.write("            if (data == \"success\") {\r\n");
      out.write("            \talert(\"success\");\r\n");
      out.write("            } \r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("        \talert($(\"#columnPolicyform\").serialize());\r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("$(document).ready(function(){\r\n");
      out.write("\t$(\"#hashCheck\").click(function(event) {\r\n");
      out.write("\t\tif ($(\"#hashCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\t$('#hash_salt').prop('readonly', false);\r\n");
      out.write("\t\t\t$(\"#hash_check\").val(\"Y\");\r\n");
      out.write("\t\t\t\r\n");
      out.write(" \t\t\t//체크박스 체크불가\r\n");
      out.write("\t\t\t$('#ivCheck').prop('disabled', true);\r\n");
      out.write("\t\t\t$('#partialEncryptCheck').prop('disabled', true);\r\n");
      out.write("\t\t\t$('#maskCheck').prop('disabled', true);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//체크박스 선택해제\r\n");
      out.write("\t\t\t$(\"input[id=ivCheck]:checkbox\").prop(\"checked\", false);\r\n");
      out.write("\t\t\t$(\"input[id=partialEncryptCheck]:checkbox\").prop(\"checked\", false);\r\n");
      out.write("\t\t\t$(\"input[id=maskCheck]:checkbox\").prop(\"checked\", false);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//text value값 초기화\r\n");
      out.write("\t\t\t$(\"#iv_value\").val(\"\");\r\n");
      out.write("\t\t\t$(\"#partial_encrypt_length\").val(\"0\");\r\n");
      out.write("\t\t\t$(\"#mask_digit\").val(\"\");\r\n");
      out.write("\t\t\t$(\"#mask_value\").val(\"\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//text value readonly true\r\n");
      out.write("\t\t\t$('#iv_value').prop('readonly', true);\r\n");
      out.write("\t\t\t$('#partial_encrypt_length').prop('readonly', true);\r\n");
      out.write("\t\t\t$('#mask_digit').prop('readonly', true);\r\n");
      out.write("\t\t\t$('#mask_value').prop('readonly', true);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}else if ($(\"#hashCheck\").is(\":checked\") == false) {\r\n");
      out.write("\t\t\t$('#hash_salt').prop('readonly', true);\r\n");
      out.write("\t\t\t$(\"#hash_check\").val(\"N\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$('#ivCheck').prop('disabled', false);\r\n");
      out.write("\t\t\t$('#partialEncryptCheck').prop('disabled', false);\r\n");
      out.write("\t\t\t$('#maskCheck').prop('disabled', false);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//text value값 초기화\r\n");
      out.write("\t\t\t$(\"#hash_salt\").val(\"\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#ivCheck\").click(function(event) {\r\n");
      out.write("\t\tif ($(\"#ivCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\t$('#iv_value').prop('readonly', false);\r\n");
      out.write("\t\t\t$(\"#iv_check\").val(\"Y\");\r\n");
      out.write("\t\t}else if ($(\"#ivCheck\").is(\":checked\") == false) {\r\n");
      out.write("\t\t\t$('#iv_value').prop('readonly', true);\r\n");
      out.write("\t\t\t$(\"#iv_check\").val(\"N\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//text value값 초기화\r\n");
      out.write("\t\t\t$(\"#iv_value\").val(\"\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#partialEncryptCheck\").click(function(event) {\r\n");
      out.write("\t\tif ($(\"#partialEncryptCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\t$('#partial_encrypt_length').prop('readonly', false);\r\n");
      out.write("\t\t\t$(\"#partial_encrypt_check\").val(\"Y\");\r\n");
      out.write("\t\t}else if ($(\"#partialEncryptCheck\").is(\":checked\") == false) {\r\n");
      out.write("\t\t\t$('#partial_encrypt_length').prop('readonly', true);\r\n");
      out.write("\t\t\t$(\"#partial_encrypt_check\").val(\"N\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//text value값 초기화\r\n");
      out.write("\t\t\t$(\"#partial_encrypt_length\").val(\"0\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#maskCheck\").click(function(event) {\r\n");
      out.write("\t\tif ($(\"#maskCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\t$('#mask_digit').prop('readonly', false);\r\n");
      out.write("\t\t\t$('#mask_value').prop('readonly', false);\r\n");
      out.write("\t\t\t$(\"#mask_check\").val(\"Y\");\r\n");
      out.write("\t\t}else if ($(\"#maskCheck\").is(\":checked\") == false) {\r\n");
      out.write("\t\t\t$('#mask_digit').prop('readonly', true);\r\n");
      out.write("\t\t\t$('#mask_value').prop('readonly', true);\r\n");
      out.write("\t\t\t$(\"#mask_check\").val(\"N\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//text value값 초기화\r\n");
      out.write("\t\t\t$(\"#mask_digit\").val(\"\");\r\n");
      out.write("\t\t\t$(\"#mask_value\").val(\"\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#register\").click(function(event) {\r\n");
      out.write("\t\tregister();\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("<!-- container -->\r\n");
      out.write("<div class=\"container-fluid \">\r\n");
      out.write("\t<div class=\"row-fluid \">\r\n");
      out.write("\t\t<div class=\"span2\">\r\n");
      out.write("\t\t\t<div class=\"well sidebar-nav\">\r\n");
      out.write("\t\t\t\t<ul class=\"nav nav-list\">\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./adminAddPage.do\"><h1>관리자등록</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./adminViewPage.do\"><h1>관리자목록</h1></a></li>\t\t\t\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./globalPolicyPage.do\"><h1>글로벌암호정책설정</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./columnPolicyPage.do\"><h1>컬름별암호정책설정</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./columnPolicyView.do\"><h1>컬름별암호정책목록</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./kekMakePage.do\"><h1>키암호키생성</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./eckMakePage.do\"><h1>암호키생성</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./eckRemakePage.do\"><h1>암호키재생성</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./policyACPage.do\"><h1>정책기반접근제어</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./policyACViewPage.do\"><h1>정책기반접근제어목록</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./behaviorACPage.do\"><h1>행위기반접근제어</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./behaviorACViewPage.do\"><h1>행위기반접근제어목록</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./workApproveRequestPage.do\"><h1>작업승인요청</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./workApproveCancelPage.do\"><h1>작업승인취소</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./workApprovePage.do\"><h1>작업승인</h1></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"./previewPage.do\"><h1>previewPage</h1></a></li>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"span8\">\r\n");
      out.write("\t\t\t<div id=\"container\" class=\"white\"><!-- 배경색 설정 class=\"brown/white\" -->\r\n");
      out.write("\t\t\t\t<div class=\"combine\">\r\n");
      out.write("\t\t\t\t\t<form action=\"./columnPolicy.aj\" method=\"post\" id=\"columnPolicyform\" name=\"columnPolicyform\">\r\n");
      out.write("\t\t\t\t\t\t<table summary=\"신청 상세 내역 영역입니다.\" class=\"basic\" >\r\n");
      out.write("\t\t\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<col width=\"20%\" />\r\n");
      out.write("\t\t\t\t\t\t\t<col width=\"80%\" />\r\n");
      out.write("\t\t\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> USER</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" class=\"med gray\" name=\"user\"/>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<select class=\"ml10\" > -->\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t<option value=\"\"></option> --> \r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t<option value=\"\"></option> --> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t</select> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 테이블 이름</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" class=\"med gray\" name=\"table_name\" />\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<select class=\"ml10\" > -->\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("<!-- \t\t\t \t\t\t\t\t\t\t<option value=\"\"></option> --> \r\n");
      out.write("<!-- \t\t\t \t\t\t\t\t\t\t<option value=\"\"></option> --> \r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t</select> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 컬름 이름</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" class=\"med gray\" name=\"column_name\" />\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<select class=\"ml10\" > -->\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t<option value=\"\"></option> --> \r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t<option value=\"\"></option> --> \r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t</select> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"button\" value=\"조회\" style=\"vertical-align: 20%\"/> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t<hr size=\"3\" color=\"#8C8C8C\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t\t<table summary=\"신청 상세 내역 영역입니다.\" class=\"basic\">\r\n");
      out.write("\t\t\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<col width=\"20%\" />\r\n");
      out.write("\t\t\t\t\t\t\t<col width=\"80%\" />\r\n");
      out.write("\t\t\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<tbody>\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 일방향 알고리즘 여부</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" class=\"med gray\" readonly=\"readonly\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"hashCheck\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"hash_check\" name=\"hash_check\" value=\"N\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 일방향 알고리즘 SALT</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"med gray\" id=\"hash_salt\" name=\"hash_salt\" readonly=\"readonly\"/></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Iv 사용여부</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" class=\"med gray\" readonly=\"readonly\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"ivCheck\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"iv_check\" name=\"iv_check\" value=\"N\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Iv</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"med gray\" id=\"iv_value\" name=\"iv_value\" readonly=\"readonly\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 부분암호화 여부</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" class=\"med gray\" readonly=\"readonly\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"partialEncryptCheck\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"partial_encrypt_check\" name=\"partial_encrypt_check\" value=\"N\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 부분암호화 평문길이</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"med gray\" id=\"partial_encrypt_length\" name=\"partial_encrypt_length\" value=\"0\" onkeydown=\"onlyNumber();\" readonly=\"readonly\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Masking 여부</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" class=\"med gray\" readonly=\"readonly\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"maskCheck\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"mask_check\" name=\"mask_check\" value=\"N\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Masking 자리수</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"med gray\" id=\"mask_digit\" name=\"mask_digit\" readonly=\"readonly\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Mask</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"med gray\" id=\"mask_value\" name=\"mask_value\" readonly=\"readonly\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> </th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"button\" id=\"register\" value=\"등록\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"span2\"></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- //container -->\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fset_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f0.setParent(null);
    // /jsp/common/commonAttribute.jsp(3,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setVar("_ContextPath");
    // /jsp/common/commonAttribute.jsp(3,0) name = scope type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setScope("page");
    int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
    if (_jspx_eval_c_005fset_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_c_005fset_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_c_005fset_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_c_005fset_005f0.doInitBody();
      }
      do {
        out.write("\r\n");
        out.write("    ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
        out.write('\r');
        out.write('\n');
        int evalDoAfterBody = _jspx_th_c_005fset_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_c_005fset_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.reuse(_jspx_th_c_005fset_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.reuse(_jspx_th_c_005fset_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fset_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f1 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f1.setParent(null);
    // /jsp/common/commonAttribute.jsp(6,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f1.setVar("_BasePath");
    // /jsp/common/commonAttribute.jsp(6,0) name = scope type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f1.setScope("page");
    int _jspx_eval_c_005fset_005f1 = _jspx_th_c_005fset_005f1.doStartTag();
    if (_jspx_eval_c_005fset_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_c_005fset_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_c_005fset_005f1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_c_005fset_005f1.doInitBody();
      }
      do {
        out.write("\r\n");
        out.write("    ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.scheme}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
        out.write(':');
        out.write('/');
        out.write('/');
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.serverName}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
        out.write(':');
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.serverPort}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
        out.write(' ');
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
        out.write('/');
        out.write('\r');
        out.write('\n');
        int evalDoAfterBody = _jspx_th_c_005fset_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_c_005fset_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_c_005fset_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.reuse(_jspx_th_c_005fset_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.reuse(_jspx_th_c_005fset_005f1);
    return false;
  }

  private boolean _jspx_meth_c_005fset_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f2 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f2.setParent(null);
    // /jsp/common/commonAttribute.jsp(9,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f2.setVar("_RquestURI");
    // /jsp/common/commonAttribute.jsp(9,0) name = scope type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f2.setScope("page");
    int _jspx_eval_c_005fset_005f2 = _jspx_th_c_005fset_005f2.doStartTag();
    if (_jspx_eval_c_005fset_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_c_005fset_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_c_005fset_005f2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_c_005fset_005f2.doInitBody();
      }
      do {
        out.write("\r\n");
        out.write("    ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.requestURI}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
        out.write('\r');
        out.write('\n');
        int evalDoAfterBody = _jspx_th_c_005fset_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_c_005fset_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_c_005fset_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.reuse(_jspx_th_c_005fset_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.reuse(_jspx_th_c_005fset_005f2);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f0.setParent(null);
    // /jsp/encryption/columnPolicyPage.jsp(27,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/columnPolicy.aj");
    int _jspx_eval_c_005furl_005f0 = _jspx_th_c_005furl_005f0.doStartTag();
    if (_jspx_th_c_005furl_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
    return false;
  }
}
