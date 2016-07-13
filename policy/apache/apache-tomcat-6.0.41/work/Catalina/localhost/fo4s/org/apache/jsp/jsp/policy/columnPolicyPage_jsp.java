package org.apache.jsp.jsp.policy;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import kr.co.jimant.fo4s.vo.ConnectionVO;
import kr.co.jimant.fo4s.vo.PolicyVO;

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
      out.write("\r\n");
      out.write("\r\n");

	ArrayList<String> list = (ArrayList) request.getAttribute("list");

	ConnectionVO connectionVO = (ConnectionVO) request.getAttribute("connectionVO");
	
	PolicyVO policyVO = (PolicyVO) request.getAttribute("policyVO");
	

      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("var saltSafety = 0;\r\n");
      out.write("var ivSafety = 0;\r\n");
      out.write("\r\n");
      out.write("function columnView() {\r\n");
      out.write("\t \r\n");
      out.write("    $.ajax({\r\n");
      out.write("        type : \"post\",\r\n");
      out.write("        url : \"");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("        dataType : \"html\",\r\n");
      out.write("        data : $(\"#sendform\").serialize(),\r\n");
      out.write("        success : function(response) {\r\n");
      out.write("        \tvar data = jQuery.parseJSON(response);\r\n");
      out.write("        \tvar str = \"\";\r\n");
      out.write("        \t\r\n");
      out.write("        \tfor (var i = 0; i < data.result.length; i++) {\r\n");
      out.write("        \t\t\r\n");
      out.write("        \t\t\tstr += \"<option value='\" + data.result[i].columnName + \"' >\" + data.result[i].columnName + \"</option>\";\r\n");
      out.write("        \t}\r\n");
      out.write("        \t$(\"#selectColumn\").html(str);\r\n");
      out.write("\t\t\t\r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("//         \talert(\"error\");\r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function tableView() {\r\n");
      out.write("\t \r\n");
      out.write("    $.ajax({\r\n");
      out.write("        type : \"post\",\r\n");
      out.write("        url : \"");
      if (_jspx_meth_c_005furl_005f1(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("        dataType : \"html\",\r\n");
      out.write("        data : $(\"#sendform\").serialize(),\r\n");
      out.write("        success : function(response) {\r\n");
      out.write("        \tvar data = jQuery.parseJSON(response);\r\n");
      out.write("        \tvar str = \"\";\r\n");
      out.write("        \t\r\n");
      out.write("        \tfor (var i = 0; i < data.result.length; i++) {\r\n");
      out.write("        \t\t\r\n");
      out.write("        \t\t\tstr += \"<option value='\" + data.result[i].tableName + \"' >\" + data.result[i].tableName + \"</option>\";\r\n");
      out.write("        \t}\r\n");
      out.write("        \t$(\"#selectTable\").html(str);\r\n");
      out.write("        \t\r\n");
      out.write("        \tcolumnView();\r\n");
      out.write("\t\t\t\r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("        \talert(\"error\");\r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function register() {\r\n");
      out.write("\r\n");
      out.write("    $.ajax({\r\n");
      out.write("        type : \"post\",\r\n");
      out.write("        url : \"");
      if (_jspx_meth_c_005furl_005f2(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("        dataType : \"html\",\r\n");
      out.write("        data : $(\"#columnPolicyform\").serialize(),\r\n");
      out.write("        success : function(data) {\r\n");
      out.write("            if (data == \"success\") {\r\n");
      out.write("            \talert(\"등록완료\");\r\n");
      out.write("            \tdocument.location.reload();\r\n");
      out.write("            } \r\n");
      out.write("            if (data == \"already\") {\r\n");
      out.write("            \talert(\"동일Table 동일Column 암호정책이 이미존재합니다.\");\r\n");
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
      out.write("\t\r\n");
      out.write("\t");
if(policyVO.getOperate_mode()!=null && policyVO.getOperate_mode().equals("ECB")){
      out.write("\r\n");
      out.write("\t\t$(\"#IV_CHECK_USE\").hide();\r\n");
      out.write("\t\t$(\"#IV_VALUE_USE\").hide();\r\n");
      out.write("\t");
}
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#partial_encrypt_length \").keyup(function(event){\r\n");
      out.write("\t\tif (!(event.keyCode >=37 && event.keyCode<=40)) {\r\n");
      out.write("\t\t\tvar inputVal = $(this).val();\r\n");
      out.write("\t\t\t$(this).val(inputVal.replace(/[^0-9]/gi,''));\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\ttableView();\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#selectDB\").change(function() {\r\n");
      out.write("\t\ttableView();\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#selectTable\").change(function() {\r\n");
      out.write("\t\tcolumnView();\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
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
      out.write("\t\t\t$('#saltStrength').removeClass().html('');\r\n");
      out.write("\t        saltSafety = 0;\r\n");
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
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$('#saltStrength').removeClass().html('');\r\n");
      out.write("\t        saltSafety = 0;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#ivCheck\").click(function(event) {\r\n");
      out.write("\t\tif ($(\"#ivCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\t$('#iv_value').prop('readonly', false);\r\n");
      out.write("\t\t\t$(\"#iv_check\").val(\"Y\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$('#ivStrength').removeClass().html('');\r\n");
      out.write("\t\t\tivSafety = 0;\r\n");
      out.write("\t\t}else if ($(\"#ivCheck\").is(\":checked\") == false) {\r\n");
      out.write("\t\t\t$('#iv_value').prop('readonly', true);\r\n");
      out.write("\t\t\t$(\"#iv_check\").val(\"N\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//text value값 초기화\r\n");
      out.write("\t\t\t$(\"#iv_value\").val(\"\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$('#ivStrength').removeClass().html('');\r\n");
      out.write("\t\t\tivSafety = 0;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#partialEncryptCheck\").click(function(event) {\r\n");
      out.write("\t\tif ($(\"#partialEncryptCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\t$('#partial_encrypt_length').prop('readonly', false);\r\n");
      out.write("\t\t\t$(\"#partial_encrypt_check\").val(\"Y\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$(\"#partial_encrypt_length\").val(\"\");\r\n");
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
      out.write("\t\t\r\n");
      out.write("\t\tvar selectDB = $(\"#selectDB option:selected\").val();\r\n");
      out.write("\t\tvar selectTable = $(\"#selectTable option:selected\").val();\r\n");
      out.write("\t\tvar selectColumn = $(\"#selectColumn option:selected\").val();\r\n");
      out.write("\t\t$(\"#db_name\").val(selectDB);\r\n");
      out.write("\t\t$(\"#table_name\").val(selectTable);\r\n");
      out.write("\t\t$(\"#column_name\").val(selectColumn);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif ($(\"#hashCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\tif (saltSafety!=1) {\r\n");
      out.write("\t\t\t\talert('salt값을  확인하세요'); \r\n");
      out.write("\t\t\t\treturn false; \r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tif ($(\"#ivCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\t\tif (ivSafety!=1) {\r\n");
      out.write("\t\t\t\t\talert('iv값을  확인하세요'); \r\n");
      out.write("\t\t\t\t\treturn false; \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif ($(\"#partialEncryptCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\t\tif ($('#partial_encrypt_length').val() == \"\") { \r\n");
      out.write("\t\t\t\t\talert('부분암호화 평문길이를 입력하세요'); \r\n");
      out.write("\t\t\t\t\treturn false; \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t//부분암호화 평문길이 숫자체크\r\n");
      out.write("\t\t\t\tre = /[^0-9]/gi,\"\"; //숫자만 허용\r\n");
      out.write("\t\t\t\tif ($('#partial_encrypt_length').val().match(re)) { \r\n");
      out.write("\t\t\t\t\talert('부분암호화 평문길이는 숫자만 가능합니다.'); \r\n");
      out.write("\t\t\t\t\treturn false; \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif ($(\"#maskCheck\").is(\":checked\") == true) {\r\n");
      out.write("\t\t\t\tif ($('#mask_digit').val() == \"\") { \r\n");
      out.write("\t\t\t\t\talert('Masking 자리수를 입력하세요'); \r\n");
      out.write("\t\t\t\t\treturn false; \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif ($('#mask_value').val() == \"\") { \r\n");
      out.write("\t\t\t\t\talert('Mask를 입력하세요'); \r\n");
      out.write("\t\t\t\t\treturn false; \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tre =  /[^0-9\\,\\.]/; // , . 숫자 만허용\r\n");
      out.write("\t\t\t\tif ($('#mask_digit').val().match(re)) { \r\n");
      out.write("\t\t\t\t\talert('Masking 자리수가 형식에 맞지않습니다.'); \r\n");
      out.write("\t\t\t\t\treturn false; \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tre =  /[^#\\*]/; //# * 만 허용\r\n");
      out.write("\t\t\t\tif ($('#mask_value').val().match(re)) { \r\n");
      out.write("\t\t\t\t\talert('mask는 #과 *중 한문자만 입력가능합니다.'); \r\n");
      out.write("\t\t\t\t\treturn false; \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tregister();\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$('#hash_salt').on('keyup', function(e) {\r\n");
      out.write("\t\t \r\n");
      out.write("\t       if($('#hash_salt').val() == '' ){\r\n");
      out.write("\t           $('#saltStrength').removeClass().html('');\r\n");
      out.write("\t           saltSafety = 0;\r\n");
      out.write("\t           return false;\r\n");
      out.write("\t       }\r\n");
      out.write("\t       // Must have capital letter, numbers and lowercase letters\r\n");
      out.write("\t       var strongRegex = new RegExp(\"^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\\\W).*$\", \"g\");\r\n");
      out.write("\t       // Must have either capitals and lowercase letters or lowercase and numbers\r\n");
      out.write("\t       var mediumRegex = new RegExp(\"^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$\", \"g\");\r\n");
      out.write("\t       // Must be at least 6 characters long\r\n");
      out.write("\t       var okRegex = new RegExp(\"(?=.{6,}).*\", \"g\");\r\n");
      out.write("\t       \r\n");
      out.write("\t       if (okRegex.test($(this).val()) === false) {\r\n");
      out.write("\t           // If ok regex doesn't match the password\r\n");
      out.write("\t       \t$('#saltStrength').removeClass().addClass('alert alert-error').html('Password must be 6 characters long.');\r\n");
      out.write("\t       \tsaltSafety = 0;\r\n");
      out.write("\t       } else if (strongRegex.test($(this).val())) {\r\n");
      out.write("\t           // If reg ex matches strong password\r\n");
      out.write("\t           $('#saltStrength').removeClass().addClass('alert alert-success').html('Good Password!');\r\n");
      out.write("\t           saltSafety = 1;\r\n");
      out.write("\t       } else if (mediumRegex.test($(this).val())) {\r\n");
      out.write("\t           // If medium password matches the reg ex\r\n");
      out.write("\t           $('#saltStrength').removeClass().addClass('alert alert-info').html('Make your password stronger with more capital letters, more numbers and special characters!');\r\n");
      out.write("\t           saltSafety = 0;\r\n");
      out.write("\t       } else {\r\n");
      out.write("\t           // If password is ok\r\n");
      out.write("\t           $('#saltStrength').removeClass().addClass('alert alert-error').html('Weak Password, try using numbers and capital letters.');\r\n");
      out.write("\t           saltSafety = 0;\r\n");
      out.write("\t       }\r\n");
      out.write("\t       \r\n");
      out.write("\t       return true;\r\n");
      out.write("\t   });\r\n");
      out.write("\t$('#iv_value').on('keyup', function(e) {\r\n");
      out.write("\t\t \r\n");
      out.write("\t       if( $('#iv_value').val() == ''){\r\n");
      out.write("\t           $('#ivStrength').removeClass().html('');\r\n");
      out.write("\t           saltSafety = 0;\r\n");
      out.write("\t           return false;\r\n");
      out.write("\t       }\r\n");
      out.write("\t       // Must have capital letter, numbers and lowercase letters\r\n");
      out.write("\t       var strongRegex = new RegExp(\"^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\\\W).*$\", \"g\");\r\n");
      out.write("\t       // Must have either capitals and lowercase letters or lowercase and numbers\r\n");
      out.write("\t       var mediumRegex = new RegExp(\"^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$\", \"g\");\r\n");
      out.write("\t       // Must be at least 6 characters long\r\n");
      out.write("\t       var okRegex = new RegExp(\"(?=.{6,}).*\", \"g\");\r\n");
      out.write("\t       \r\n");
      out.write("\t       if (okRegex.test($(this).val()) === false) {\r\n");
      out.write("\t           // If ok regex doesn't match the password\r\n");
      out.write("\t       \t$('#ivStrength').removeClass().addClass('alert alert-error').html('Password must be 6 characters long.');\r\n");
      out.write("\t       \tivSafety = 0;\r\n");
      out.write("\t       } else if (strongRegex.test($(this).val())) {\r\n");
      out.write("\t           // If reg ex matches strong password\r\n");
      out.write("\t           $('#ivStrength').removeClass().addClass('alert alert-success').html('Good Password!');\r\n");
      out.write("\t           ivSafety = 1;\r\n");
      out.write("\t       } else if (mediumRegex.test($(this).val())) {\r\n");
      out.write("\t           // If medium password matches the reg ex\r\n");
      out.write("\t           $('#ivStrength').removeClass().addClass('alert alert-info').html('Make your password stronger with more capital letters, more numbers and special characters!');\r\n");
      out.write("\t           ivSafety = 0;\r\n");
      out.write("\t       } else {\r\n");
      out.write("\t           // If password is ok\r\n");
      out.write("\t           $('#ivStrength').removeClass().addClass('alert alert-error').html('Weak Password, try using numbers and capital letters.');\r\n");
      out.write("\t           ivSafety = 0;\r\n");
      out.write("\t       }\r\n");
      out.write("\t       \r\n");
      out.write("\t       return true;\r\n");
      out.write("\t   });\r\n");
      out.write("\t\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("<!-- container -->\r\n");
      out.write("<div class=\"container-fluid \">\r\n");
      out.write("\t<div class=\"row-fluid \">\r\n");
      out.write("\t\t<div class=\"span2\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"span8\">\r\n");
      out.write("\t\t<H3>컬럼별 암호정책 설정</H3>\r\n");
      out.write("\t\t\t\t\t<form method=\"post\" id=\"sendform\" name=\"sendform\">\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"db_type\" value=\"");
      out.print(connectionVO.getDb_type() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"host\" value=\"");
      out.print(connectionVO.getHost() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"user\" value=\"");
      out.print(connectionVO.getUser() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"password\" value=\"");
      out.print(connectionVO.getPassword() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"port\" value=\"");
      out.print(connectionVO.getPort() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t\t\t<table class=\"table table-hover table-condensed\">\r\n");
      out.write("\t\t\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<col width=\"20%\" />\r\n");
      out.write("\t\t\t\t\t\t\t<col width=\"80%\" />\r\n");
      out.write("\t\t\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> USER</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" value=\"");
      out.print(connectionVO.getUser() );
      out.write("\" readonly=\"readonly\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> DB 이름</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\" /> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select class=\"ml10\" id=\"selectDB\" name=\"db_name\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
for (int i = 0; i < list.size(); i++) {String dbName = (String) list.get(i);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"");
      out.print(dbName );
      out.write('"');
      out.write('>');
      out.print(dbName );
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 테이블 이름</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\"  /> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select class=\"ml10\" id=\"selectTable\" name=\"table_name\">\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t<!-- \t\t\t\t\t\t\t<option value=\"\"></option> -->\r\n");
      out.write("\t\t\t<!-- \t\t\t\t\t\t\t<option value=\"\"></option> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"button\" id=\"dataView\" value=\"조회\" style=\"vertical-align: 20%\"/> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 컬럼 이름</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\"  /> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select class=\"ml10\" id=\"selectColumn\" name=\"column_name\">\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t<!-- \t\t\t\t\t\t\t<option value=\"\"></option> -->\r\n");
      out.write("\t\t\t<!-- \t\t\t\t\t\t\t<option value=\"\"></option> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"button\" id=\"dataView\" value=\"조회\" style=\"vertical-align: 20%\"/> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t<form method=\"post\" id=\"columnPolicyform\" name=\"columnPolicyform\">\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"user\" value=\"");
      out.print(connectionVO.getUser() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id = \"table_name\" name=\"table_name\" value=\"\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id = \"column_name\" name=\"column_name\" value=\"\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<table class=\"table table-condensed\">\r\n");
      out.write("\t\t\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<col width=\"20%\" />\r\n");
      out.write("\t\t\t\t\t\t\t<col width=\"80%\" />\r\n");
      out.write("\t\t\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<tbody>\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 일방향 알고리즘 여부</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\"  readonly=\"readonly\"/> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"hashCheck\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"hash_check\" name=\"hash_check\" value=\"N\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 일방향 알고리즘 SALT</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"password\"  id=\"hash_salt\" name=\"hash_salt\" readonly=\"readonly\" maxlength=\"16\"/>&nbsp;1개이상의 대문자,숫자,특수문자포함 8자이상<div class=\"\" id=\"saltStrength\"></div></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr id=\"IV_CHECK_USE\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Iv 사용여부</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\"  readonly=\"readonly\"/> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"ivCheck\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"iv_check\" name=\"iv_check\" value=\"N\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr id=\"IV_VALUE_USE\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Iv</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"password\"  id=\"iv_value\" name=\"iv_value\" readonly=\"readonly\" maxlength=\"16\"/>&nbsp;1개이상의 대문자,숫자,특수문자포함 8자이상<div class=\"\" id=\"ivStrength\"></div></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 부분암호화 여부</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\"  readonly=\"readonly\"/> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"partialEncryptCheck\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"partial_encrypt_check\" name=\"partial_encrypt_check\" value=\"N\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> 부분암호화 평문길이</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"text\"  id=\"partial_encrypt_length\" name=\"partial_encrypt_length\" value=\"0\" readonly=\"readonly\" maxlength=\"2\"/> &nbsp;숫자 입력</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Masking 여부</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\" readonly=\"readonly\"/> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"maskCheck\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"mask_check\" name=\"mask_check\" value=\"N\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Masking 자리수</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"text\"  id=\"mask_digit\" name=\"mask_digit\" readonly=\"readonly\" maxlength=\"16\"/> &nbsp;ex) 1,5.8,12</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> Mask</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"text\"  id=\"mask_value\" name=\"mask_value\" readonly=\"readonly\" maxlength=\"1\"/> &nbsp;ex) # 또는 * 입력</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"al\"> </th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><input type=\"button\" class=\"btn\" id=\"register\" value=\"등록\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
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
    // /jsp/policy/columnPolicyPage.jsp(26,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/columnView.aj");
    int _jspx_eval_c_005furl_005f0 = _jspx_th_c_005furl_005f0.doStartTag();
    if (_jspx_th_c_005furl_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f1 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f1.setParent(null);
    // /jsp/policy/columnPolicyPage.jsp(51,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f1.setValue("/tableView.aj");
    int _jspx_eval_c_005furl_005f1 = _jspx_th_c_005furl_005f1.doStartTag();
    if (_jspx_th_c_005furl_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f2 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f2.setParent(null);
    // /jsp/policy/columnPolicyPage.jsp(78,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f2.setValue("/columnPolicy.aj");
    int _jspx_eval_c_005furl_005f2 = _jspx_th_c_005furl_005f2.doStartTag();
    if (_jspx_th_c_005furl_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f2);
    return false;
  }
}
