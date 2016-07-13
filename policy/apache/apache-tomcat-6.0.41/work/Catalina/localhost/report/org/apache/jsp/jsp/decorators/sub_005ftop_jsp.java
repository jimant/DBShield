package org.apache.jsp.jsp.decorators;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kr.co.jimant.report.vo.AdminVO;

public final class sub_005ftop_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/jsp/common/commonAttribute.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fscope.release();
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

	AdminVO adminVO = (AdminVO) session.getAttribute("SESSION_ADMIN_INFO");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<title>FO4S</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />\r\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"bs-docs-example\">\r\n");
      out.write("            <div class=\"navbar navbar-inverse\" style=\"position: static;\">\r\n");
      out.write("              <div class=\"navbar-inner\">\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                  <a class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".navbar-inverse-collapse\">\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                  </a>\r\n");
      out.write("                  <a href=\"#\" class=\"brand\" style=\"cursor:default\"><b>FO4S</b></a>\r\n");
      out.write("                  <div class=\"nav-collapse collapse navbar-inverse-collapse\">\r\n");
      out.write("                    <ul class=\"nav\">\r\n");
      out.write("                      <li class=\"active\"><a href=\"#\" style=\"cursor:default\">JIMANT</a></li>\r\n");
      out.write("<!--                       <li><a href=\"#\">Link</a></li> -->\r\n");
      out.write("<!--                       <li><a href=\"#\">Link</a></li> -->\r\n");
      out.write("<!--                       <li class=\"dropdown\"> -->\r\n");
      out.write("<!--                         <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">KEY <b class=\"caret\"></b></a> -->\r\n");
      out.write("<!--                         <ul class=\"dropdown-menu\"> -->\r\n");
      out.write("<!--                           <li class=\"nav-header\">키암호키</li> -->\r\n");
      out.write("<!--                           <li><a href=\"./kekMakePage.do\">키암호키 생성</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./kekBackupPage.do\">키암호키 백업복구</a></li> -->\r\n");
      out.write("<!--                           <li class=\"divider\"></li> -->\r\n");
      out.write("<!--                           <li class=\"nav-header\">암호키</li> -->\r\n");
      out.write("<!--                           <li><a href=\"./eckMakePage.do\">암호키 생성</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./eckRemakePage.do\">암호키 재생성</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./eckBackupPage.do\">암호키 백업복구</a></li> -->\r\n");
      out.write("<!--                         </ul> -->\r\n");
      out.write("<!--                       </li> -->\r\n");
      out.write("<!--                      <li class=\"divider-vertical\"></li> -->\r\n");
      out.write("<!--                       <li class=\"dropdown\"> -->\r\n");
      out.write("<!--                         <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">암호정책 <b class=\"caret\"></b></a> -->\r\n");
      out.write("<!--                         <ul class=\"dropdown-menu\"> -->\r\n");
      out.write("<!--                           <li class=\"nav-header\">글로벌 </li> -->\r\n");
      out.write("<!--                           <li><a href=\"./globalPolicyConnect.do\">암호정책 설정</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./globalPolicyView.do\">암호정책</a></li> -->\r\n");
      out.write("<!--                           <li class=\"divider\"></li> -->\r\n");
      out.write("<!--                           <li class=\"nav-header\">컬럼별 </li> -->\r\n");
      out.write("<!--                           <li><a href=\"./columnPolicyConnect.do\">암호정책 설정</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./columnPolicyView.do\">암호정책 목록</a></li> -->\r\n");
      out.write("                          \r\n");
      out.write("<!--                         </ul> -->\r\n");
      out.write("<!--                       </li> -->\r\n");
      out.write("<!--                      <li class=\"divider-vertical\"></li> -->\r\n");
      out.write("<!--                        <li class=\"dropdown\"> -->\r\n");
      out.write("<!--                         <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">접근제어 <b class=\"caret\"></b></a> -->\r\n");
      out.write("<!--                         <ul class=\"dropdown-menu\"> -->\r\n");
      out.write("<!--                           <li class=\"nav-header\">정책기반 </li> -->\r\n");
      out.write("<!--                           <li><a href=\"./policyACPage.do\">접근제어 설정</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./policyACViewPage.do\">접근제어 목록</a></li> -->\r\n");
      out.write("<!--                           <li class=\"divider\"></li> -->\r\n");
      out.write("<!--                           <li class=\"nav-header\">행위기반 </li> -->\r\n");
      out.write("<!--                           <li><a href=\"./behaviorACPage.do\">접근제어 설정</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./behaviorACViewPage.do\">접근제어 목록</a></li> -->\r\n");
      out.write("<!--                         </ul> -->\r\n");
      out.write("<!--                       </li> -->\r\n");
      out.write("<!--                      <li class=\"divider-vertical\"></li> -->\r\n");
      out.write("<!--                       <li class=\"dropdown\"> -->\r\n");
      out.write("<!--                         <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">작업승인 <b class=\"caret\"></b></a> -->\r\n");
      out.write("<!--                         <ul class=\"dropdown-menu\"> -->\r\n");
      out.write("<!--                           <li><a href=\"./workApproveRequestPage.do\">승인요청</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./workApproveCancelPage.do\">승인취소</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./workApprovePage.do\">승인</a></li> -->\r\n");
      out.write("                         \r\n");
      out.write("<!--                         </ul> -->\r\n");
      out.write("<!--                       </li> -->\r\n");
      out.write("<!--                      <li class=\"divider-vertical\"></li> -->\r\n");
      out.write("<!--                       <li class=\"dropdown\"> -->\r\n");
      out.write("<!--                         <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">관리자 <b class=\"caret\"></b></a> -->\r\n");
      out.write("<!--                         <ul class=\"dropdown-menu\"> -->\r\n");
      out.write("<!--                           <li><a href=\"./adminAddPage.do\">관리자 등록</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./adminViewPage.do\">관리자 목록</a></li> -->\r\n");
      out.write("                         \r\n");
      out.write("<!--                         </ul> -->\r\n");
      out.write("<!--                       </li> -->\r\n");
      out.write("<!--                       <li class=\"divider-vertical\"></li> -->\r\n");
      out.write("                      <li><a href=\"./reportPage.do\">리포트</a></li>\r\n");
      out.write("<!--                       <li class=\"divider-vertical\"></li> -->\r\n");
      out.write("<!--                       <li class=\"dropdown\"> -->\r\n");
      out.write("<!--                         <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">previewPage <b class=\"caret\"></b></a> -->\r\n");
      out.write("<!--                         <ul class=\"dropdown-menu\"> -->\r\n");
      out.write("<!--                           <li><a href=\"./previewPage.do\">DB data 암복호화</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"./previewCryptionPage.do\">암복호화 테스트</a></li> -->\r\n");
      out.write("<!--                            <li><a href=\"./previewCryptPage.do\">암복호화 테스트2</a></li> -->\r\n");
      out.write("<!-- <!--                           <li><a href=\"./previewKeyPage.do\">key 테스트</a></li> --> -->\r\n");
      out.write("                         \r\n");
      out.write("<!--                         </ul> -->\r\n");
      out.write("<!--                       </li> -->\r\n");
      out.write("<!--                       <li><a href=\"./previewPage.do\">previewPage</a></li> -->\r\n");
      out.write("                   </ul>\r\n");
      out.write("<!--                     <form class=\"navbar-search pull-left\" action=\"\"> -->\r\n");
      out.write("<!--                       <input type=\"text\" class=\"search-query span2\" placeholder=\"Search\"> -->\r\n");
      out.write("<!--                     </form> -->\r\n");
      out.write("                    <ul class=\"nav pull-right\">\r\n");
      out.write("                    ");
if(adminVO != null){ 
      out.write("<li><a href=\"./logout.do\">로그아웃</a></li>");
} 
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<!-- \t\t\t\t\t        <li><a href=\"./logout.do\">로그아웃</a></li> -->\r\n");
      out.write("\r\n");
      out.write("<!--                       <li class=\"divider-vertical\"></li> -->\r\n");
      out.write("<!--                       <li class=\"dropdown\"> -->\r\n");
      out.write("<!--                         <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Dropdown <b class=\"caret\"></b></a> -->\r\n");
      out.write("<!--                         <ul class=\"dropdown-menu\"> -->\r\n");
      out.write("<!--                           <li><a href=\"#\">Action</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"#\">Another action</a></li> -->\r\n");
      out.write("<!--                           <li><a href=\"#\">Something else here</a></li> -->\r\n");
      out.write("<!--                           <li class=\"divider\"></li> -->\r\n");
      out.write("<!--                           <li><a href=\"#\">Separated link</a></li> -->\r\n");
      out.write("<!--                         </ul> -->\r\n");
      out.write("<!--                       </li> -->\r\n");
      out.write("                    </ul>\r\n");
      out.write("                  </div><!-- /.nav-collapse -->\r\n");
      out.write("                </div>\r\n");
      out.write("              </div><!-- /navbar-inner -->\r\n");
      out.write("            </div><!-- /navbar -->\r\n");
      out.write("          </div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\t<!-- header -->\r\n");
      out.write("\t\t<br></br>\r\n");
      out.write("\t\t<!-- //header -->");
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
}
