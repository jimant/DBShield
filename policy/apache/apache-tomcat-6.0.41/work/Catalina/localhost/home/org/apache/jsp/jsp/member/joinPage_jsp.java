package org.apache.jsp.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaFactory;

public final class joinPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("        #ch1{\r\n");
      out.write("            display:none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #ch1 + label{\r\n");
      out.write("            display:inline-block;\r\n");
      out.write("            width:24px;\r\n");
      out.write("            height:24px;\r\n");
      out.write("            border:2px solid #bcbcbc;\r\n");
      out.write("            cursor:pointer;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #ch1:checked + label:after{\r\n");
      out.write("            position:relative;\r\n");
      out.write("            top:-3px;\r\n");
      out.write("            left:5px;\r\n");
      out.write("            content: '\\2714';\r\n");
      out.write("            font-size:18px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("\t\t#ch2{\r\n");
      out.write("            display:none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #ch2 + label{\r\n");
      out.write("            display:inline-block;\r\n");
      out.write("            width:24px;\r\n");
      out.write("            height:24px;\r\n");
      out.write("            border:2px solid #bcbcbc;\r\n");
      out.write("            cursor:pointer;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #ch2:checked + label:after{\r\n");
      out.write("            position:relative;\r\n");
      out.write("            top:-3px;\r\n");
      out.write("            left:5px;\r\n");
      out.write("            content: '\\2714';\r\n");
      out.write("            font-size:18px;\r\n");
      out.write("        }\r\n");
      out.write("        #ch3{\r\n");
      out.write("            display:none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #ch3 + label{\r\n");
      out.write("            display:inline-block;\r\n");
      out.write("            width:24px;\r\n");
      out.write("            height:24px;\r\n");
      out.write("            border:2px solid #bcbcbc;\r\n");
      out.write("            cursor:pointer;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #ch3:checked + label:after{\r\n");
      out.write("            position:relative;\r\n");
      out.write("            top:-3px;\r\n");
      out.write("            left:5px;\r\n");
      out.write("            content: '\\2714';\r\n");
      out.write("            font-size:18px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("var availableId = false;\r\n");
      out.write("\r\n");
      out.write("var passwordSafety = false;\r\n");
      out.write("\r\n");
      out.write("var availableEmail = false;\r\n");
      out.write("\r\n");
      out.write("var blank_pattern = /^\\s+|\\s+$/g;\t//스페이스바 공백을 검사하기 위한 변수\r\n");
      out.write("\r\n");
      out.write("function idCheck() {\r\n");
      out.write("\t\r\n");
      out.write("\t $.ajax({\r\n");
      out.write("         type : \"post\",\r\n");
      out.write("         url : \"");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("         dataType : \"html\",\r\n");
      out.write("         data : $(\"#joinform\").serialize(),\r\n");
      out.write("         success : function(data) {\r\n");
      out.write("             if (data == \"success\") {\r\n");
      out.write("             \talert(\"사용 가능한 아이디 입니다.\");\r\n");
      out.write("             \tavailableId = true;\r\n");
      out.write("             } else if (data == \"fail\") {\r\n");
      out.write("             \talert(\"이미 사용중인 아이디 입니다.\");\r\n");
      out.write("             } \r\n");
      out.write("         },\r\n");
      out.write("         error : function(xhr, textStatus) {\r\n");
      out.write("         \talert(\"error\");\r\n");
      out.write("             \r\n");
      out.write("         }\r\n");
      out.write("     });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function emailCheck() {\r\n");
      out.write("\t\r\n");
      out.write("\t $.ajax({\r\n");
      out.write("        type : \"post\",\r\n");
      out.write("        url : \"");
      if (_jspx_meth_c_005furl_005f1(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("        dataType : \"html\",\r\n");
      out.write("        data : $(\"#joinform\").serialize(),\r\n");
      out.write("        success : function(data) {\r\n");
      out.write("            if (data == \"success\") {\r\n");
      out.write("            \talert(\"사용 가능한 이메일 입니다.\");\r\n");
      out.write("            \tavailableEmail = true;\r\n");
      out.write("            } else if (data == \"fail\") {\r\n");
      out.write("            \talert(\"이미 사용중인 이메일 입니다.\");\r\n");
      out.write("            } \r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("        \talert(\"error\");\r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("\t  });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function join() {\r\n");
      out.write("\t\r\n");
      out.write("\t$('#idCheck').prop('disabled', true);\r\n");
      out.write("\t$('#emailCheck').prop('disabled', true);\r\n");
      out.write("\t$('#postPopup').prop('disabled', true);\r\n");
      out.write("\t$('#joinButton').prop('disabled', true);\r\n");
      out.write("\t$('#joinButton').val(\"처리중..\");\r\n");
      out.write("    $.ajax({\r\n");
      out.write("        type : \"post\",\r\n");
      out.write("        url : \"");
      if (_jspx_meth_c_005furl_005f2(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("        dataType : \"html\",\r\n");
      out.write("        data : $(\"#joinform\").serialize(),\r\n");
      out.write("        success : function(data) {\r\n");
      out.write("            if (data == \"success\") {\r\n");
      out.write("            \t$('#joinButton').val(\"가입\");\r\n");
      out.write("            \talert(\"인증메일을 발송하였습니다. 메일인증을 하셔서 회원가입을 완료해 주시기 바랍니다.\");\r\n");
      out.write("            \tlocation.href = \"./loginPage.do\";\r\n");
      out.write("            } else if (data == \"fail\") {\r\n");
      out.write("            \t$('#joinButton').val(\"가입\");\r\n");
      out.write("             \talert(\"사용할 수 없는 아이디 입니다.\");\r\n");
      out.write("             \t$('#joinButton').prop('disabled', false);\r\n");
      out.write("             \t$('#idCheck').prop('disabled', false);\r\n");
      out.write("            \t$('#emailCheck').prop('disabled', false);\r\n");
      out.write("            \t$('#postPopup').prop('disabled', false);\r\n");
      out.write("            } else if (data == \"typo\") {\r\n");
      out.write("            \t$('#joinButton').val(\"가입\");\r\n");
      out.write("             \talert(\"자동가입 방지문자가 올바르지 않습니다.\");\r\n");
      out.write("             \tRecaptcha.reload();\r\n");
      out.write("             \t$('#joinButton').prop('disabled', false);\r\n");
      out.write("             \t$('#idCheck').prop('disabled', false);\r\n");
      out.write("            \t$('#emailCheck').prop('disabled', false);\r\n");
      out.write("            \t$('#postPopup').prop('disabled', false);\r\n");
      out.write("            } else if (data == \"certify\") {\r\n");
      out.write("            \t$('#joinButton').val(\"가입\");\r\n");
      out.write("             \talert(\"인증메일 발송실패! 이메일을 확인해 주세요.\");\r\n");
      out.write("             \tRecaptcha.reload();\r\n");
      out.write("             \t$('#joinButton').prop('disabled', false);\r\n");
      out.write("             \t$('#idCheck').prop('disabled', false);\r\n");
      out.write("            \t$('#emailCheck').prop('disabled', false);\r\n");
      out.write("            \t$('#postPopup').prop('disabled', false);\r\n");
      out.write("            } \r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("        \t$('#joinButton').val(\"가입\");\r\n");
      out.write("        \talert(\"error\");\r\n");
      out.write("        \t$('#joinButton').prop('disabled', false);\r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkBizID(bizID){  //사업자등록번호 체크\r\n");
      out.write("\t// bizID는 숫자만 10자리로 해서 문자열로 넘긴다.\r\n");
      out.write("\tvar checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);\r\n");
      out.write("\tvar tmpBizID, i, chkSum=0, c2, remander;\r\n");
      out.write("\tbizID = bizID.replace(/-/gi,'');\r\n");
      out.write("\t \r\n");
      out.write("\tfor (i=0; i<=7; i++) chkSum += checkID[i] * bizID.charAt(i);\r\n");
      out.write("\tc2 = \"0\" + (checkID[8] * bizID.charAt(8));\r\n");
      out.write("\tc2 = c2.substring(c2.length - 2, c2.length);\r\n");
      out.write("\tchkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));\r\n");
      out.write("\tremander = (10 - (chkSum % 10)) % 10 ;\r\n");
      out.write("\t \r\n");
      out.write("\tif (Math.floor(bizID.charAt(9)) == remander) return true ; // OK!\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkNumber(numberValue){  \r\n");
      out.write("\tvar regType = /^[0-9+]{3,4}$/;\r\n");
      out.write("\tif (regType.test(numberValue)) { \r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t} else{\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkNumber3(numberValue){  \r\n");
      out.write("\tvar regType = /^[0-9+]{4,4}$/;\r\n");
      out.write("\tif (regType.test(numberValue)) { \r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t} else{\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkEmail(emailValue){  \r\n");
      out.write("\tvar regType = /^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$/i; \r\n");
      out.write("\tif (regType.test(emailValue)) { \r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t} else{\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function postPopup() {\r\n");
      out.write("\twindow.open(\"");
      if (_jspx_meth_c_005furl_005f3(_jspx_page_context))
        return;
      out.write("\", \"Address Search\", \"width=400,height=200,resizable=1,scrollbars=yes, location=no\");\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function addressPopupCallBack(postcd1, postcd2, addressMain) {\r\n");
      out.write("\t//alert(json.postcd1);\r\n");
      out.write("    $(\"#zip_code1\").val(postcd1);\r\n");
      out.write("    $(\"#zip_code2\").val(postcd2);\r\n");
      out.write("    $(\"#address\").val(addressMain);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("$(document).ready(function(){\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#businessNumber\").hide();\r\n");
      out.write("\r\n");
      out.write("\t$(\"#corporateNumber\").hide();\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#idCheck\").click(function(event) {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif ($(\"#member_id\").val().replace(blank_pattern, \"\") == \"\") {\t\r\n");
      out.write("\t\t\t$(\"#member_id\").focus();\r\n");
      out.write("\t\t\talert(\"아이디를 입력해 주세요.\");\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar regType = /^[A-Za-z0-9+]{4,16}$/;\r\n");
      out.write("\t\tif (!regType.test(document.getElementById('member_id').value)) { \r\n");
      out.write("\t\t\t$(\"#member_id\").focus();\r\n");
      out.write("\t\t\talert('사용할 수 없는 아이디 입니다.'); \r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("        $(\"#idCheck\").hide();\r\n");
      out.write("        \r\n");
      out.write("        idCheck();\r\n");
      out.write("        \r\n");
      out.write("        $('#idCheck').show();\r\n");
      out.write("    });\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#emailCheck\").click(function(event) {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif ($(\"#email\").val().replace(blank_pattern, \"\") == \"\") {\t\r\n");
      out.write("\t\t\t$(\"#email\").focus();\r\n");
      out.write("\t\t\talert(\"이메일를 입력해 주세요.\");\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tvar regType = /^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$/i; \r\n");
      out.write("\t\tif (!regType.test($(\"#email\").val())) { \r\n");
      out.write("\t\t\talert('사용할 수 없는 이메일 입니다.'); \r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("        $(\"#emailCheck\").hide();\r\n");
      out.write("        \r\n");
      out.write("        emailCheck();\r\n");
      out.write("        \r\n");
      out.write("        $('#emailCheck').show();\r\n");
      out.write("    });\r\n");
      out.write("\t\r\n");
      out.write("\t$('#passwordInput, #confirmPasswordInput').on('keyup', function(e) {\r\n");
      out.write("\t\t \r\n");
      out.write("        if($('#passwordInput').val() == '' && $('#confirmPasswordInput').val() == '')\r\n");
      out.write("        {\r\n");
      out.write("            $('#passwordStrength').removeClass().html('');\r\n");
      out.write("            passwordSafety = false;\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write(" \r\n");
      out.write("     \tif($('#passwordInput').val() != '' && $('#confirmPasswordInput').val() != '' && $('#passwordInput').val() != $('#confirmPasswordInput').val())\r\n");
      out.write("    \t{\r\n");
      out.write("    \t\t$('#passwordStrength').removeClass().addClass('alert alert-error').html('Passwords do not match!');\r\n");
      out.write("    \t\tpasswordSafety = false;\r\n");
      out.write("        \treturn false;\r\n");
      out.write("    \t}\r\n");
      out.write(" \r\n");
      out.write("        // Must have capital letter, numbers and lowercase letters\r\n");
      out.write("        var strongRegex = new RegExp(\"^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\\\W).*$\", \"g\");\r\n");
      out.write(" \r\n");
      out.write("        // Must have either capitals and lowercase letters or lowercase and numbers\r\n");
      out.write("        var mediumRegex = new RegExp(\"^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$\", \"g\");\r\n");
      out.write(" \r\n");
      out.write("        // Must be at least 6 characters long\r\n");
      out.write("        var okRegex = new RegExp(\"(?=.{6,}).*\", \"g\");\r\n");
      out.write(" \r\n");
      out.write("        if (okRegex.test($(this).val()) === false) {\r\n");
      out.write("            // If ok regex doesn't match the password\r\n");
      out.write("        \t$('#passwordStrength').removeClass().addClass('alert alert-error').html('Password must be 6 characters long.');\r\n");
      out.write("        \tpasswordSafety = false;\r\n");
      out.write("        } else if (strongRegex.test($(this).val())) {\r\n");
      out.write("            // If reg ex matches strong password\r\n");
      out.write("            $('#passwordStrength').removeClass().addClass('alert alert-success').html('Good Password!');\r\n");
      out.write("            passwordSafety = true;\r\n");
      out.write("        } else if (mediumRegex.test($(this).val())) {\r\n");
      out.write("            // If medium password matches the reg ex\r\n");
      out.write("            $('#passwordStrength').removeClass().addClass('alert alert-info').html('Make your password stronger with more capital letters, more numbers and special characters!');\r\n");
      out.write("            passwordSafety = false;\r\n");
      out.write("        } else {\r\n");
      out.write("            // If password is ok\r\n");
      out.write("            $('#passwordStrength').removeClass().addClass('alert alert-error').html('Weak Password, try using numbers and capital letters.');\r\n");
      out.write("            passwordSafety = false;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        return true;\r\n");
      out.write("    });\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#business_number, #corporate_number, #pn_2, #pn_3, #cpn_2, #cpn_3\").keyup(function(event){\r\n");
      out.write("\t\tif (!(event.keyCode >=37 && event.keyCode<=40)) {\r\n");
      out.write("\t\t\tvar inputVal = $(this).val();\r\n");
      out.write("\t\t\t$(this).val(inputVal.replace(/[^0-9]/gi,''));\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#division\").click(function(event) {\r\n");
      out.write("\t\tif ($(\"#division\").val() == \"N\") {\t\r\n");
      out.write("\t\t\t$(\"#businessNumber\").hide();\r\n");
      out.write("\t\t\t$(\"#corporateNumber\").hide();\r\n");
      out.write("\t\t\t$(\"#business_number\").val(null);\r\n");
      out.write("\t\t\t$(\"#corporate_number\").val(null);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif ($(\"#division\").val() == \"C1\") {\t\r\n");
      out.write("\t\t\t$(\"#businessNumber\").show();\r\n");
      out.write("\t\t\t$(\"#corporateNumber\").hide();\r\n");
      out.write("\t\t\t$(\"#corporate_number\").val(null);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif ($(\"#division\").val() == \"C2\") {\t\r\n");
      out.write("\t\t\t$(\"#corporateNumber\").show();\r\n");
      out.write("\t\t\t$(\"#businessNumber\").hide();\r\n");
      out.write("\t\t\t$(\"#business_number\").val(null);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif ($(\"#division\").val() == \"P\") {\t\r\n");
      out.write("\t\t\t$(\"#businessNumber\").hide();\r\n");
      out.write("\t\t\t$(\"#corporateNumber\").hide();\r\n");
      out.write("\t\t\t$(\"#business_number\").val(null);\r\n");
      out.write("\t\t\t$(\"#corporate_number\").val(null);\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("    });\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#postPopup\").click(function(event) {\r\n");
      out.write("\t\tpostPopup();\r\n");
      out.write("    });\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#joinButton\").click(function(event) {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif ($(\"#ch1\").is(\":checked\") != true || $(\"#ch2\").is(\":checked\") != true || $(\"#ch3\").is(\":checked\") != true) {\t\r\n");
      out.write("\t\t\talert(\"개인정보 수집 및 이용에 대한 안내와 개인정보취급방침 그리고 이용약관 모두 동의해주세요.\");\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} \r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar regType = /^[A-Za-z0-9+\"\"]{4,16}$/;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif ($(\"#member_id\").val().replace(blank_pattern, \"\") == \"\") {\t\r\n");
      out.write("\t\t\t$(\"#member_id\").focus();\r\n");
      out.write("\t\t\talert(\"아이디를 입력해 주세요.\");\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if (!regType.test(document.getElementById('member_id').value)) { \r\n");
      out.write("\t\t\t$(\"#member_id\").focus();\r\n");
      out.write("\t\t\talert('사용할 수 없는 아이디 입니다.'); \r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if(!availableId){\r\n");
      out.write("\t\t\talert(\"아이디 검사를 해주세요. \");\r\n");
      out.write("\t\t\tdocument.joinform.idCheck.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if(!passwordSafety){\r\n");
      out.write("\t\t\talert(\"비밀번호를 확인하세요.\");\r\n");
      out.write("\t\t\tdocument.joinform.password.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if (document.joinform.name.value.replace(blank_pattern, \"\") == \"\") {\r\n");
      out.write("\t\t\talert(\"이름을 입력해 주세요.\");\r\n");
      out.write("\t\t\tdocument.joinform.name.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} \r\n");
      out.write("\t\t\r\n");
      out.write("// \t\telse if ($(\"#division\").val() == \"C1\" && document.joinform.business_number.value.replace(blank_pattern, \"\") == \"\") {\r\n");
      out.write("// \t\t\talert(\"사업자등록번호를 입력해 주세요.\");\r\n");
      out.write("// \t\t\tdocument.joinform.business_number.focus();\r\n");
      out.write("// \t\t\treturn false;\r\n");
      out.write("// \t\t} else if ($(\"#division\").val() == \"C2\" && $(\"#corporate_number\").val().replace(blank_pattern, \"\") == \"\") {\r\n");
      out.write("// \t\t\talert(\"법인번호를 입력해 주세요.\");\r\n");
      out.write("// \t\t\t$(\"#corporate_number\").focus();\r\n");
      out.write("// \t\t\treturn false;\r\n");
      out.write("// \t\t} else if ($(\"#division\").val() == \"C1\") {\r\n");
      out.write("// \t\t\tif(!checkBizID($(\"#business_number\").val())){\r\n");
      out.write("// \t\t\t\talert(\"사업자번호가 올바르지 않습니다.\");\r\n");
      out.write("// \t\t\t\tdocument.joinform.business_number.focus();\r\n");
      out.write("// \t\t\t\treturn false;\r\n");
      out.write("// \t\t\t}\r\n");
      out.write("// \t\t} else if ($(\"#division\").val() == \"C2\") {\r\n");
      out.write("// \t\t\tif(!checkBizID($(\"#corporate_number\").val())){\r\n");
      out.write("// \t\t\t\talert(\"법인번호가 올바르지 않습니다.\");\r\n");
      out.write("// \t\t\t\t$(\"#corporate_number\").focus();\r\n");
      out.write("// \t\t\t\treturn false;\r\n");
      out.write("// \t\t\t}\r\n");
      out.write("// \t\t} \r\n");
      out.write("// \t\tif ($(\"#division\").val() == \"C1\" || $(\"#division\").val() == \"C2\" ) {\r\n");
      out.write("// \t\t\tif ($(\"#company_name\").val().replace(blank_pattern, \"\") == \"\") {\r\n");
      out.write("// \t\t\t\talert(\"회사이름을 입력해 주세요.\");\r\n");
      out.write("// \t\t\t\t$(\"#company_name\").focus();\r\n");
      out.write("// \t\t\t\treturn false;\r\n");
      out.write("// \t\t\t} \r\n");
      out.write("// \t\t}\r\n");
      out.write("\t\tif ($(\"#pn_2\").val().replace(blank_pattern, \"\") == \"\") {\r\n");
      out.write("\t\t\talert(\"전화번호를 입력해 주세요.\");\r\n");
      out.write("\t\t\t$(\"#pn_2\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if (!checkNumber($(\"#pn_2\").val())) {\r\n");
      out.write("\t\t\talert(\"전화번호가 올바르지 않습니다.\");\r\n");
      out.write("\t\t\t$(\"#pn_2\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if ($(\"#pn_3\").val().replace(blank_pattern, \"\") == \"\") {\r\n");
      out.write("\t\t\talert(\"전화번호를 입력해 주세요.\");\r\n");
      out.write("\t\t\t$(\"#pn_3\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if (!checkNumber3($(\"#pn_3\").val())) {\r\n");
      out.write("\t\t\talert(\"전화번호가 올바르지 않습니다.\");\r\n");
      out.write("\t\t\t$(\"#pn_3\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if ($(\"#cpn_2\").val().replace(blank_pattern, \"\") == \"\") {\r\n");
      out.write("\t\t\talert(\"핸드폰번호를 입력해 주세요.\");\r\n");
      out.write("\t\t\t$(\"#cpn_2\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if (!checkNumber($(\"#cpn_2\").val())) {\r\n");
      out.write("\t\t\talert(\"핸드폰번호가 올바르지 않습니다.\");\r\n");
      out.write("\t\t\t$(\"#cpn_2\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if ($(\"#cpn_3\").val().replace(blank_pattern, \"\") == \"\") {\r\n");
      out.write("\t\t\talert(\"핸드폰번호를 입력해 주세요.\");\r\n");
      out.write("\t\t\t$(\"#cpn_3\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if (!checkNumber3($(\"#cpn_3\").val())) {\r\n");
      out.write("\t\t\talert(\"핸드폰번호가 올바르지 않습니다.\");\r\n");
      out.write("\t\t\t$(\"#cpn_3\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} else if ($(\"#email\").val().replace(blank_pattern, \"\") == \"\") {\r\n");
      out.write("\t\t\talert(\"이메일을 입력해 주세요.\");\r\n");
      out.write("\t\t\t$(\"#email\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}  else if (!checkEmail($(\"#email\").val())) {\r\n");
      out.write("\t\t\talert(\"이메일이 올바르지 않습니다.\");\r\n");
      out.write("\t\t\t$(\"#email\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}  else if(!availableEmail){\r\n");
      out.write("\t\t\talert(\"이메일 검사를 해주세요. \");\r\n");
      out.write("\t\t\tdocument.joinform.eamilCheck.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} \r\n");
      out.write("// \t\telse if ($(\"#division\").val() == \"C1\" || $(\"#division\").val() == \"C2\") {\r\n");
      out.write("// \t\t\tif($(\"#zip_code1\").val() == \"\"){\r\n");
      out.write("// \t\t\t\talert(\"주소를 입력해 주세요.\");\r\n");
      out.write("// \t\t\t\t$(\"#postPopup\").focus();\r\n");
      out.write("// \t\t\t\treturn false;\r\n");
      out.write("// \t\t\t} \r\n");
      out.write("// \t\t\tif ($(\"#address_detail\").val() == \"\") {\r\n");
      out.write("// \t\t\t\talert(\"상세주소를 입력해 주세요.\");\r\n");
      out.write("// \t\t\t\t$(\"#address_detail\").focus();\r\n");
      out.write("// \t\t\t\treturn false;\r\n");
      out.write("// \t\t\t}\r\n");
      out.write("// \t\t} \r\n");
      out.write("\t\r\n");
      out.write("\t\t$(\"#phone_number\").val($(\"#pn_1\").val() + $(\"#pn_2\").val() + $(\"#pn_3\").val());\r\n");
      out.write("\t\t$(\"#cellphone_number\").val($(\"#cpn_1\").val() + $(\"#cpn_2\").val() + $(\"#cpn_3\").val());\r\n");
      out.write("// \t\t$(\"#zip_code\").val($(\"#zip_code1\").val() + $(\"#zip_code2\").val());\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tjoin();\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<!-- container -->\r\n");
      out.write(" <div class=\"jumbotron\">\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<form action=\"./join.aj\" method=\"post\" id=\"joinform\" name=\"joinform\">\r\n");
      out.write("\t\t\t\t\t<table class=\"table table-hover \">\r\n");
      out.write("\t\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col width=\"20%\" />\r\n");
      out.write("\t\t\t\t\t\t<col width=\"80%\" />\r\n");
      out.write("\t\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 개인정보 수집 및 이용에 대한 안내 &nbsp;<input id=\"ch1\" type=\"checkbox\"><label for=\"ch1\"></label></th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div >\r\n");
      out.write("\t\t\t\t\t\t\t\t<!-- 에디터 영역 -->\r\n");
      out.write("\t\t\t\t\t\t\t\t<TEXTAREA  name=\"notice_content\" rows=\"\" cols=\"\"  maxlength=\"10000\" style=\"width: 60%; height: 100px;\" readonly=\"readonly\">정보통신망법 규정에 따라 <(주)지먼트테크놀로지>(‘www.fo4s.com’) 에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.\r\n");
      out.write("1. 수집하는 개인정보의 항목\r\n");
      out.write("첫째, 회사는 회원가 입, 원활한 서비스의 제공 및 커뮤니티의 활성화를 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 수집하고 있습니다. \r\n");
      out.write("<회원가입>\r\n");
      out.write("아이디, 비밀번호, 이름, 이메일 주소, 휴대용 전화번호 \r\n");
      out.write("둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. \r\n");
      out.write("- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록 \r\n");
      out.write("2. 개인정보의 수집 및 이용 목적\r\n");
      out.write("회원제 서비스 제공, 개인식별, <(주)지먼트테크놀로지>(‘www.fo4s.com’)  이용약관 위반 회원에 대한 이용제한 조치, 서비스의 원활한 운영에 지장을 미치는 행위 및 서비스 부정이용 행위 제재, 가입의사 확인, 가입 및 가입횟수 제한, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 회원탈퇴의사의 확인\r\n");
      out.write("\r\n");
      out.write("3. 개인정보의 보유 및 이용기간\r\n");
      out.write("이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.\r\n");
      out.write("가. 회사 내부 방침에 의한 정보보유 사유 \r\n");
      out.write("- 부정이용기록(부정가입, 징계기록 등의 비정상적 서비스 이용기록) \r\n");
      out.write("보존 항목 : 가입인증 휴대폰 번호\r\n");
      out.write("보존 이유 : 부정 가입 및 이용 방지\r\n");
      out.write("보존 기간 : 1년\r\n");
      out.write("※ ‘부정이용기록’이란 부정 가입 및 운영원칙에 위배되는 게시글 작성 등으로 인해 회사로부터 이용제한 등을 당한 기록입니다.\r\n");
      out.write("나. 관련법령에 의한 정보보유 사유 \r\n");
      out.write("상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.\r\n");
      out.write("- 계약 또는 청약철회 등에 관한 기록 \r\n");
      out.write("보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 \r\n");
      out.write("보존 기간 : 5년 \r\n");
      out.write("- 대금결제 및 재화 등의 공급에 관한 기록 \r\n");
      out.write("보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 \r\n");
      out.write("보존 기간 : 5년 \r\n");
      out.write("- 전자금융 거래에 관한 기록 \r\n");
      out.write("보존 이유 : 전자금융거래법 \r\n");
      out.write("보존 기간 : 5년 \r\n");
      out.write("- 소비자의 불만 또는 분쟁처리에 관한 기록 \r\n");
      out.write("보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 \r\n");
      out.write("보존 기간 : 3년 \r\n");
      out.write("- 웹사이트 방문기록 \r\n");
      out.write("보존 이유 : 통신비밀보호법 \r\n");
      out.write("보존 기간 : 3개월 \r\n");
      out.write("\t\t\t\t\t\t\t\t</TEXTAREA>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 개인정보취급방침 &nbsp;<input id=\"ch2\" type=\"checkbox\"><label for=\"ch2\"></label></th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div >\r\n");
      out.write("\t\t\t\t\t\t\t\t<!-- 에디터 영역 -->\r\n");
      out.write("\t\t\t\t\t\t\t\t<TEXTAREA  name=\"notice_content\" rows=\"\" cols=\"\"  maxlength=\"10000\" style=\"width: 60%; height: 100px;\" readonly=\"readonly\">1. 개인정보의 처리 목적 <(주)지먼트테크놀로지>(‘www.fo4s.com’이하 ‘Fo4s’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.\r\n");
      out.write("- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등\r\n");
      out.write("\r\n");
      out.write("2. 개인정보처리 위탁\r\n");
      out.write("① <(주)지먼트테크놀로지>('Fo4s')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.\r\n");
      out.write("② <(주)지먼트테크놀로지>('www.fo4s.com'이하 'Fo4s')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.\r\n");
      out.write("\r\n");
      out.write("③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.\r\n");
      out.write("\r\n");
      out.write("3. 정보주체의 권리,의무 및 그 행사방법 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.\r\n");
      out.write("① 정보주체는 <(주)지먼트테크놀로지>(Fo4s)에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.\r\n");
      out.write("1. 개인정보 열람요구\r\n");
      out.write("2. 오류 등이 있을 경우 정정 요구\r\n");
      out.write("3. 삭제요구\r\n");
      out.write("4. 처리정지 요구\r\n");
      out.write("\r\n");
      out.write("4. 처리하는 개인정보의 항목 작성 \r\n");
      out.write("\r\n");
      out.write("① <(주)지먼트테크놀로지>(Fo4s)은(는) 다음의 개인정보 항목을 처리하고 있습니다.\r\n");
      out.write("1<개인정보>\r\n");
      out.write("아이디, 비밀번호, 이름, 이메일 주소, 휴대전화번호\r\n");
      out.write("5. 개인정보의 파기<(주)지먼트테크놀로지>('Fo4s')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.\r\n");
      out.write("-파기절차\r\n");
      out.write("이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.\r\n");
      out.write("-파기기한\r\n");
      out.write("이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.\r\n");
      out.write("\r\n");
      out.write("6. 개인정보의 안전성 확보 조치 <(주)지먼트테크놀로지>('Fo4s')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.\r\n");
      out.write("1. 개인정보 취급 직원의 최소화 및 교육\r\n");
      out.write("개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.\r\n");
      out.write("\r\n");
      out.write("2. 개인정보의 암호화\r\n");
      out.write("이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.\r\n");
      out.write("\r\n");
      out.write("3. 해킹 등에 대비한 기술적 대책\r\n");
      out.write("<(주)지먼트테크놀로지>('Fo4s')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신•점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.\r\n");
      out.write("\r\n");
      out.write("4. 개인정보에 대한 접근 제한\r\n");
      out.write("개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.\r\n");
      out.write("\r\n");
      out.write("7. 개인정보 보호책임자 작성 \r\n");
      out.write("\r\n");
      out.write("① (주)지먼트테크놀로지(‘www.fo4s.com’이하 ‘Fo4s) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.\r\n");
      out.write("\r\n");
      out.write("▶ 개인정보 보호책임자 \r\n");
      out.write("성명 :백승우\r\n");
      out.write("연락처 :02-3144-8740, tech@jimant.co.kr, \r\n");
      out.write("※ 개인정보 보호 담당부서로 연결됩니다.\r\n");
      out.write("\r\n");
      out.write("② 정보주체께서는 (주)지먼트테크놀로지(‘www.fo4s.com’이하 ‘Fo4s) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자로 문의하실 수 있습니다. (주)지먼트테크놀로지(‘www.fo4s.com’이하 ‘Fo4s) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.\r\n");
      out.write("\r\n");
      out.write("8. 개인정보 처리방침 변경 \r\n");
      out.write("①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.\r\n");
      out.write("\t\t\t\t\t\t\t\t</TEXTAREA>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 이용약관 &nbsp;<input id=\"ch3\" type=\"checkbox\"><label for=\"ch3\"></label></th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div >\r\n");
      out.write("\t\t\t\t\t\t\t\t<!-- 에디터 영역 -->\r\n");
      out.write("\t\t\t\t\t\t\t\t<TEXTAREA  name=\"notice_content\" rows=\"\" cols=\"\"  maxlength=\"10000\" style=\"width: 60%; height: 100px;\" readonly=\"readonly\">제 1 조 (목적 등)\r\n");
      out.write("1. <(주)지먼트테크놀로지>(‘www.fo4s.com’) 서비스 약관 (이하 \"본 약관\"이라 합니다.)은 \"회원\"이 ㈜지먼트테크놀로지 (이하 “서비스제공자”)에서 제공하는 정보 제공 (이하 \"본 서비스\")을 이용함에 있어 \"회원\"과 \"서비스제공자\"의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. \r\n");
      out.write("2. \"회원\"이 되고자 하는 자가 \"서비스제공자\"가 정한 소정의 절차를 거쳐서 \"동의\" 단추를 누르면, 본 약관에 동의 하는 것으로 간주합니다.\r\n");
      out.write("\r\n");
      out.write("제 2 조 (회원의 정의)\r\n");
      out.write("1. '개인회원'이라 함은 서비스제공자가 제공하는 모든 컨텐츠를 이용하고자 이용자 등록 (아이디, 비밀번호)을 한 개인을 말합니다.\r\n");
      out.write("\r\n");
      out.write("제 3 조 (서비스의 제공 및 변경) \r\n");
      out.write("1. \"서비스제공자\"는 \"회원\"에게 ‘www.fo4s.com’ 내 모든 무료 Contents의 자유로운 이용\r\n");
      out.write("2. \"서비스제공자\"는 그 변경될 서비스의 내용 및 제공일자를 제6조 제2항에서 정한 방법으로 이용자에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.\r\n");
      out.write("\r\n");
      out.write("제 4 조 (서비스의 중단)\r\n");
      out.write("1. \"서비스제공자\"는 컴퓨터 등 정보통신 설비의 보수점검 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체 기타 \"서비스제공자\"가 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다. \r\n");
      out.write("2. 제1항에 의한 서비스 중단의 경우에는 \"서비스제공자\"는 제6조 제2항에서 정한 방법으로 \"회원\"에게 통지합니다.  다만, \"서비스제공자\"가 통제할 수 없는 사유로 인한 서비스의 중단 (시스템 관리자의 고의, 중과실이 없는 디스크 장애, 시스템다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다. \r\n");
      out.write("\r\n");
      out.write("제 5 조 (회원탈퇴 및 자격상실 등) \r\n");
      out.write("1. \"회원\"은 \"서비스제공자\"에 언제든지 자신의 회원등록을 말소해 줄 것 (회원탈퇴)을 요청할 수 있으며 \"서비스제공자\"는 위 요청을 받은 즉시 해당 \"회원\"의 정보말소를 위한 절차를 밟습니다.\r\n");
      out.write("2. \"회원\"이 다음 각 호의 사유에 해당하는 경우, \"서비스제공자\"는 \"회원\"의 자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다. \r\n");
      out.write(" - 허위 내용을 등록한 경우 \r\n");
      out.write(" - 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우 \r\n");
      out.write(" - 서비스를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 \r\n");
      out.write("- 설비에 여유가 없거나 기술상 지장이 있는 경우 \r\n");
      out.write("- 기타 회사가 필요하다고 인정되는 경우\r\n");
      out.write("\r\n");
      out.write("3. \"서비스제공자\"가 \"회원\"의 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다. \r\n");
      out.write("   이 경우 회원에게 회원등록 말소 전에 이를 통지하고, 소명할 기회를 부여합니다. \r\n");
      out.write("\r\n");
      out.write("제 6 조 (회원에 대한 통지) \r\n");
      out.write("1. \"서비스제공자\"는 \"본 서비스\"에 대한 공지사항을 \"회원\"에게 \"서비스제공자\"가 부여한 이메일 주소로 공지할 수 있습니다. \r\n");
      out.write("2. \"서비스제공자\"가 불특정다수 \"회원\"에 대한 통지를 하는 경우 7일 이상 공지함으로써 개별 통지에 갈음할 수 있습니다. \r\n");
      out.write("\r\n");
      out.write("제 7 조 (이용자의 개인정보보호) \r\n");
      out.write("1. “서비스제공자”는 \"본 서비스\"에 등록된 개인정보를 관리합니다.\r\n");
      out.write("2. \"서비스제공자\"는 관련법령이 정하는 바에 따라서 \"회원\"의 개인정보를 보호하기 위하여 노력합니다.\r\n");
      out.write("\r\n");
      out.write("제 8 조 (서비스제공자의 의무)\r\n");
      out.write("1. \"서비스제공자\"는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며, 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다. \r\n");
      out.write("2. \"서비스제공자\"는 \"회원\"이 안전하게 인터넷 서비스를 이용할 수 있도록 \"회원\"의 개인정보 (신용정보 포함)보호를 위한 보안 시스템을 구축합니다. \r\n");
      out.write("\r\n");
      out.write("3. \"서비스제공자\"는 \"회원\"이 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. \r\n");
      out.write("\r\n");
      out.write("제 9 조 (이용 해지 및 이용제한)\r\n");
      out.write("1. \"회원\"이 \"본 서비스\"의 이용을 해지하고자 하는 때에는 \"회원\" 본인이 서비스 또는 전자우편을 통하여 해지하고자 하는 날의 2일전 까지 (단, 해지일이 법정공휴일인 경우 공휴일 개시 3일전 까지) 이를 \"서비스제공자\"에 신청 하여야 합니다.\r\n");
      out.write("\r\n");
      out.write("제 10 조 (손해배상 및 면책조항) \r\n");
      out.write("1. \"서비스제공자\"는 \"본 서비스\"의 이용과 관련하여 \"서비스제공자\"의 고의 또는 중대한 과실 없이 \"회원\"에게 발생한 일체의 손해에 관하여 책임을 부담하지 않습니다.\r\n");
      out.write("\r\n");
      out.write("제 11 조 (약관의 개정)\r\n");
      out.write("1. \"서비스제공자\"는 약관의 규제 등에 관한 법률을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다. \r\n");
      out.write("2. \"서비스제공자\"가 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. \r\n");
      out.write("3. \"회원\"은 변경된 약관에 대해 거부할 권리가 있습니다. \"회원\"은 변경된 약관이 공지된 후 15일 이내에 거부의사를 표명할 수 있습니다. \"회원\"이 거부하는 경우 \"서비스제공자\"는 당해 \"회원\"과의 계약을 해지할 수 있습니다. \r\n");
      out.write("   만약 \"회원\"이 변경된 약관이 공지된 후 15일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다.\r\n");
      out.write("\r\n");
      out.write("제 12 조 (재판관할) \r\n");
      out.write("1. \"서비스제공자\"와 \"회원\"간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다. \r\n");
      out.write("\r\n");
      out.write("- 부칙\r\n");
      out.write("본 약관은 2015. 2. 1부터 적용하고, 기존의 이용자에 대해서는 본 약관으로 대체하는 것으로 합니다.\r\n");
      out.write("\t\t\t\t\t\t\t\t</TEXTAREA>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 아이디</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\" id=\"member_id\" name=\"member_id\" maxlength=\"16\" onkeyDown=\"availableId = false;\" />&nbsp;<input type=\"button\" class =\"btn btn-primary\" id=\"idCheck\" value=\"아이디 검사\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 비밀번호</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"password\" id=\"passwordInput\" name=\"password\" maxlength=\"16\" /><div class=\"\" id=\"passwordStrength\"></div></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 비밀번호 재입력</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"password\" id=\"confirmPasswordInput\" maxlength=\"16\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 이름</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\" id=\"name\" name=\"name\" maxlength=\"20\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t<tr> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<th > 유형</th> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<td> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<select  name=\"division\" id=\"division\"> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t\t<option value=\"N\">일반</option> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t\t<option value=\"C1\">개인기업</option> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t\t<option value=\"C2\">법인</option> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t\t<option value=\"P\">프리미엄</option> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t</select> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t</td> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("<!-- \t\t\t\t\t\t\t</tr> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t<tr id=\"businessNumber\"> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<th > 사업자등록번호</th> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<td><input type=\"text\" id=\"business_number\" name=\"business_number\" maxlength=\"10\"/></td> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t</tr> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t<tr id=\"corporateNumber\"> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<th > 법인번호</th> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<td><input type=\"text\" id=\"corporate_number\" name=\"corporate_number\" maxlength=\"13\"/></td> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t</tr> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t<tr> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<th > 회사명</th> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<td><input type=\"text\" id=\"company_name\" name=\"company_name\" maxlength=\"64\"/></td> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t</tr> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t<tr> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<th > 직무</th> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<td> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<select  name=\"job\" id=\"job\"> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t\t<option value=\"1\">IT</option> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t\t<option value=\"2\">보안</option> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t\t<option value=\"3\">관리</option> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t\t<option value=\"4\">영업</option> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t\t\t<option value=\"5\">기타</option> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t</select> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t</td> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t</tr> -->\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 전화번호</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><select id=\"pn_1\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"02\">02</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"031\">031</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"032\">032</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"033\">033</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"041\">041</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"042\">042</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"043\">043</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"044\">044</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"051\">051</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"052\">052</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"054\">054</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"055\">055</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"061\">061</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"062\">062</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"063\">063</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"064\">064</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select> - \r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"pn_2\" maxlength=\"4\" /> - <input type=\"text\" id=\"pn_3\" maxlength=\"4\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"phone_number\" name=\"phone_number\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 핸드폰번호</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><select id=\"cpn_1\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"010\">010</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"011\">011</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"016\">016</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"017\">017</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"019\">019</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select> - \r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"cpn_2\" maxlength=\"4\" /> - <input type=\"text\" id=\"cpn_3\" maxlength=\"4\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"cellphone_number\" name=\"cellphone_number\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 이메일</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\" id=\"email\" name=\"email\" onkeyDown=\"availableEmail = false;\" />&nbsp;<input type=\"button\" class =\"btn btn-primary\" id=\"emailCheck\" value=\"이메일 검사\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("<!-- \t\t\t\t\t\t\t<tr> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<th >주소</th> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t<td> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"zip_code1\" readonly=\"readonly\" onkeyDown=\"if(event.keyCode==8) {event.keyCode=0;return false;}\" /> - <input type=\"text\" id=\"zip_code2\" readonly=\"readonly\" onkeyDown=\"if(event.keyCode==8) {event.keyCode=0;return false;}\" /> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"zip_code\" name=\"zip_code\"/> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"button\" class =\"btn btn-primary\" id=\"postPopup\" value=\"우편번호\" /><br></br> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"address\" name=\"address\" class=\"max gray mt20\" readonly=\"readonly\" onkeyDown=\"if(event.keyCode==8) {event.keyCode=0;return false;}\"  style=\"width:100%;\" /><br></br> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"address_detail\" name=\"address_detail\" class=\"max gray mt20\"  maxlength=\"100\" style=\"width:100%;\" /> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t\t</td> -->\r\n");
      out.write("<!-- \t\t\t\t\t\t\t</tr> -->\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 자동가입 방지문자</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

										ReCaptcha c = ReCaptchaFactory.newReCaptcha(
									       		  	"6LdlHOsSAAAAAM8ypy8W2KXvgMtY2dFsiQT3HVq-", 
									        		"6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY", false);
										out.print(c.createRecaptchaHtml(null, null));
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > </th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"button\" class=\"btn btn-primary \" id=\"joinButton\" value=\"가입\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</form>\t\r\n");
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
    // /jsp/member/joinPage.jsp(86,16) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/idCheck.aj");
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
    // /jsp/member/joinPage.jsp(108,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f1.setValue("/emailCheck.aj");
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
    // /jsp/member/joinPage.jsp(135,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f2.setValue("/join.aj");
    int _jspx_eval_c_005furl_005f2 = _jspx_th_c_005furl_005f2.doStartTag();
    if (_jspx_th_c_005furl_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f2);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f3 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f3.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f3.setParent(null);
    // /jsp/member/joinPage.jsp(220,14) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f3.setValue("/addressPopup.aj");
    int _jspx_eval_c_005furl_005f3 = _jspx_th_c_005furl_005f3.doStartTag();
    if (_jspx_th_c_005furl_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f3);
    return false;
  }
}
