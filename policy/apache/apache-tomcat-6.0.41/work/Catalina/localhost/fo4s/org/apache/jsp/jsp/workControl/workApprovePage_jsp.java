package org.apache.jsp.jsp.workControl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import kr.co.jimant.fo4s.vo.WorkVO;

public final class workApprovePage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 
	ArrayList<WorkVO> list = (ArrayList) request.getAttribute("list"); 
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();


      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("function approve(msg) {\r\n");
      out.write("\tvar params=\"msg=\"+msg;\r\n");
      out.write("    $.ajax({\r\n");
      out.write("        type : \"post\",\r\n");
      out.write("        url : \"");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("        dataType : \"html\",\r\n");
      out.write("        data : params,\r\n");
      out.write("        success : function(data) {\r\n");
      out.write("            if (data == \"success\") {\r\n");
      out.write("            \talert(\"승인된 작업통제 데이터를 암호화 시스템에 적용하려면 키/정책 업로더를 stop후 start하여 주세요.\");\r\n");
      out.write("            \tdocument.location.reload();\r\n");
      out.write("            }\r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("//         \talert(\"error\");\r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkboxApprove(){\r\n");
      out.write("\tobj = document.getElementsByName(\"c1\");\r\n");
      out.write("\t\r\n");
      out.write("\tvar i = 0;\r\n");
      out.write("\tvar msg=\"\";\r\n");
      out.write("\twhile( obj[i] ) {\r\n");
      out.write("\t\t// checkbox 는 같은 Deepth상에 존재하는 이름은 같으나 Value가 다른 Node이다 . 즉 , 배열이라는 소리 ^^;\r\n");
      out.write("\t\t// 총 5개이므로 5번 Loop를 수행한 후 obj[5]부터는 존재하지 않기에 Loop를 탈출한다. <-- 배열 index는 0부터죠?\r\n");
      out.write("\t\tif(obj[i].checked == true ){\r\n");
      out.write("\t\t\tmsg+=obj[i].value+\"/\"; // '/'는 구분 문자열로 차후 spilt해서 사용을 할 수 있다.\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\ti++;\r\n");
      out.write("\t}\r\n");
      out.write("//\tlocation.href = \"./workApprove.do?msg=\"+msg;\r\n");
      out.write("\tapprove(msg);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkboxCancle(){\r\n");
      out.write("\tobj = document.getElementsByName(\"c1\");\r\n");
      out.write("\t\r\n");
      out.write("\tvar i = 0;\r\n");
      out.write("\tvar msg=\"\";\r\n");
      out.write("\twhile( obj[i] ) {\r\n");
      out.write("\t\t// checkbox 는 같은 Deepth상에 존재하는 이름은 같으나 Value가 다른 Node이다 . 즉 , 배열이라는 소리 ^^;\r\n");
      out.write("\t\t// 총 5개이므로 5번 Loop를 수행한 후 obj[5]부터는 존재하지 않기에 Loop를 탈출한다. <-- 배열 index는 0부터죠?\r\n");
      out.write("\t\tif(obj[i].checked == true ){\r\n");
      out.write("\t\t\tmsg+=obj[i].value+\"/\"; // '/'는 구분 문자열로 차후 spilt해서 사용을 할 수 있다.\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\ti++;\r\n");
      out.write("\t}\r\n");
      out.write("\tlocation.href = \"./approveCancle.do?msg=\"+msg;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("$(document).ready(function(){\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#approve\").click(function(event) {\r\n");
      out.write("\t\tcheckboxApprove();\t\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#cancle\").click(function(event) {\r\n");
      out.write("\t\tcheckboxCancle();\t\t\t\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<!-- container -->\r\n");
      out.write("<div class=\"container-fluid \">\r\n");
      out.write("\t<div class=\"row-fluid \">\r\n");
      out.write("\t\t<div class=\"span2\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"span8\">\r\n");
      out.write("\t\t<H3>승인</H3>\r\n");
      out.write("\t\t\t\t\t<table class=\"table table-striped table-bordered table-hover table-condensed\">\r\n");
      out.write("\t\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th></th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th>요청 시간</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th>요청 ID</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th>DB USER</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th>작업 IP</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th>시작 시간</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th>종료 시간</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th>승인 시간</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th>시스템 적용일자</th>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t");
for (int i = 0; i < list.size(); i++) {WorkVO workVO = (WorkVO) list.get(i);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr class=\"ac\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
if(workVO.getSystem_apply_date()==null){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" name=\"c1\" value=\"");
      out.print(workVO.getWork_control_id());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
      out.print(workVO.getRequest_time() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
      out.print(workVO.getRequest_id() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
      out.print(workVO.getWork_db_user() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
      out.print(workVO.getWork_ip() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
if(workVO.getWork_start_time()!=null && !workVO.getWork_start_time().equals("ALL") ){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");
      out.print(workVO.getWork_start_time() );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
}else{
      out.write('A');
      out.write('L');
      out.write('L');
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
if(workVO.getWork_end_time()!=null && !workVO.getWork_end_time().equals("ALL") ){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");
      out.print(workVO.getWork_end_time() );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
}else{
      out.write('A');
      out.write('L');
      out.write('L');
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
if(workVO.getApprove_time()!=null){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");
      out.print(workVO.getApprove_time() );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
if(workVO.getSystem_apply_date()!=null){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");
      out.print(workVO.getSystem_apply_date() );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t");
}
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t<br></br>\r\n");
      out.write("\t\t\t\t\t<input type=\"button\" class=\"btn\" id=\"approve\" value=\"승인\" />&nbsp;<input type=\"button\" class=\"btn\" id=\"cancle\" value=\"승인취소\" />\r\n");
      out.write("\t\t\t\t\t<ul class=\"pager\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
if (nowpage <= 1) {
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a>Previous</a></li> &nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t");
} else {
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"./workApprovePage.do?page=");
      out.print(nowpage - 1);
      out.write("\">Previous</a></li>&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t");
for (int a = startpage; a <= endpage; a++) {if (a == nowpage) {
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(a);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t");
} else {
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"./workApprovePage.do?page=");
      out.print(a);
      out.write('"');
      out.write('>');
      out.print(a);
      out.write(" </a>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t");
if (nowpage >= maxpage) {
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a>Next</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
} else {
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"./workApprovePage.do?page=");
      out.print(nowpage + 1);
      out.write("\">Next</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
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
    // /jsp/workControl/workApprovePage.jsp(23,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/workApprove.aj");
    int _jspx_eval_c_005furl_005f0 = _jspx_th_c_005furl_005f0.doStartTag();
    if (_jspx_th_c_005furl_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
    return false;
  }
}
