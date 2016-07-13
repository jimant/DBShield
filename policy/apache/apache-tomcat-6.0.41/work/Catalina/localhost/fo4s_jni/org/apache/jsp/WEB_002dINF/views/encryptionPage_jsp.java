package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class encryptionPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
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
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<title>JIMANT</title>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Include bootstrap stylesheets -->\r\n");
      out.write("    \t<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css\" />\r\n");
      out.write("\t\t<!-- JavaScript placed at the end of the document so the pages load faster -->\r\n");
      out.write("\t    <!-- Optional: Include the jQuery library -->\r\n");
      out.write("\t    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\r\n");
      out.write("\t    <!-- Optional: Incorporate the Bootstrap JavaScript plugins -->\r\n");
      out.write("\t    <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function encryption() {\r\n");
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
      out.write("        \t\r\n");
      out.write("        \tvar content = \"<table class='table'>\";\r\n");
      out.write("        \tcontent  += \"<tr>\";\r\n");
      out.write("        \tcontent  += \"<td>\" + \"encryptionData : \" + \"<b>\" + data.encryptionData + \"<b>\" + \"</td>\";\r\n");
      out.write("\t\t\tcontent  += \"</tr>\";\r\n");
      out.write("\t\t\tcontent += \"</table>\";\r\n");
      out.write("\t\t\t\r\n");
      out.write("        \t$(\"#cryptData\").html(content);\r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("//        \talert($(\"#sendform\").serialize());\r\n");
      out.write("        \talert(\"입력정보가 올바르지 않습니다. DB연결정보가 올바른지 또는 정책에 맞는 정보로 입력하였는지 확인바랍니다.\");\r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function decryption() {\r\n");
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
      out.write("        \t\r\n");
      out.write("        \tvar content = \"<table class='table'>\";\r\n");
      out.write("        \tcontent  += \"<tr>\";\r\n");
      out.write("        \tcontent  += \"<td>\" + \"decryptionData : \" + \"<b>\" + data.decryptionData + \"<b>\" + \"</td>\";\r\n");
      out.write("\t\t\tcontent  += \"</tr>\";\r\n");
      out.write("\t\t\tcontent += \"</table>\";\r\n");
      out.write("\t\t\t\r\n");
      out.write("        \t$(\"#cryptData\").html(content);\r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("//        \talert($(\"#sendform\").serialize());\r\n");
      out.write("        \talert(\"입력정보가 올바르지 않습니다. DB연결정보가 올바른지 또는 정책에 맞는 정보로 입력하였는지 확인바랍니다.\");\r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("$(document).ready(function(){\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#encryption\").click(function(event) {\r\n");
      out.write("\t\tencryption();\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#decryption\").click(function(event) {\r\n");
      out.write("\t\tdecryption();\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\t\t\t\t<form method=\"post\" id=\"sendform\" name=\"sendform\">\r\n");
      out.write("\t\t\t\t\t<table class=\"table \">\r\n");
      out.write("\t\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col width=\"20%\" />\r\n");
      out.write("\t\t\t\t\t\t<col width=\"80%\" />\r\n");
      out.write("\t\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > DB type</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select  name=\"dbType\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option value=\"M\">MySQL</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option value=\"O\">Oracle</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > Host</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\"  name=\"host\" value=\"localhost\"/></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > User</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\"  name=\"dbUser\" value=\"root\"/></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > Password</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"password\"  name=\"password\" value=\"hitcom123\"/></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > Port</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\"  name=\"port\" value=\"3306\"/></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > DB 이름</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\"  name=\"dbName\" value=\"CUSTOM_DB\"/></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 테이블 이름</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\"  name=\"tableName\" value=\"MEMBER\"/></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 컬럼 이름</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\"  name=\"columnName\" value=\"MEMBER_ID\"/></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th > 암복호화할 데이터</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\"  name=\"data\" value=\"dataValue\"/></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t<input type=\"button\" class=\"btn\" id=\"encryption\" value=\"암호화\" /> &nbsp; <input type=\"button\" class=\"btn\" id=\"decryption\" value=\"복호화\" />\r\n");
      out.write("\t\t\t\t<div id=\"cryptData\"></div>\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
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

  private boolean _jspx_meth_c_005furl_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f0.setParent(null);
    // /WEB-INF/views/encryptionPage.jsp(27,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/encryption.aj");
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
    // /WEB-INF/views/encryptionPage.jsp(52,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f1.setValue("/decryption.aj");
    int _jspx_eval_c_005furl_005f1 = _jspx_th_c_005furl_005f1.doStartTag();
    if (_jspx_th_c_005furl_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
    return false;
  }
}
