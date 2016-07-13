package org.apache.jsp.jsp.main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import kr.co.jimant.home.forum.ForumVO;
import kr.co.jimant.home.inquiry.InquiryVO;
import kr.co.jimant.home.notice.NoticeVO;

public final class mainPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

ArrayList<NoticeVO> noticeList = (ArrayList) request.getAttribute("noticeList");
ArrayList<InquiryVO> inquiryList = (ArrayList) request.getAttribute("inquiryList");
ArrayList<ForumVO> forumList = (ArrayList) request.getAttribute("forumList");


      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("function inquiryList(inquiry_theme_id, cnt) {\r\n");
      out.write("\tvar params=\"inquiry_theme_id=\"+inquiry_theme_id;  \r\n");
      out.write("    $.ajax({\r\n");
      out.write("        type : \"post\",\r\n");
      out.write("        url : \"");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("        dataType : \"html\",\r\n");
      out.write("        data : params,\r\n");
      out.write("        success : function(response) {\r\n");
      out.write("        \tvar data = jQuery.parseJSON(response);\r\n");
      out.write("        \t\r\n");
      out.write("        \tvar content = \"<table class='table table-hover'>\";\r\n");
      out.write("        \tcontent  += \"<colgroup>\"\r\n");
      out.write("\t\t\t\r\n");
      out.write("        \tcontent  += \"<col width='' />\"\r\n");
      out.write("        \tcontent  += \"<col width='' />\"\r\n");
      out.write("        \tcontent  += \"<col width='' />\"\r\n");
      out.write("\t\r\n");
      out.write("\t\t\tcontent  += \"</colgroup>\"\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tcontent  += \"<thead>\"\r\n");
      out.write("        \tcontent  += \"<tr>\";\r\n");
      out.write("        \tcontent  += \"<th>\" + \"번호\" +\"</th>\";\r\n");
      out.write("\t\t\tcontent  += \"<th>\" + \"제목\" + \"</th>\";\r\n");
      out.write("\t\t\tcontent  += \"<th>\" + \"등록일\" +\"</th>\";\r\n");
      out.write("\t\t\tcontent  += \"</tr>\";\r\n");
      out.write("\t\t\tcontent  += \"</thead>\"\r\n");
      out.write("\t\t\tcontent  += \"<tbody>\"\r\n");
      out.write("\t\t\tfor (var i = 0; i < data.result.length; i++) {\r\n");
      out.write("\t\t\t\tcontent  += \"<tr>\";\r\n");
      out.write("\t\t\t\tcontent  += \"<td>\" + data.result[i].rownum +\"</td>\";\r\n");
      out.write("\t\t\t\tcontent  += \"<td>\" + \"<a href='./inquiryDetail.do?inquiry_id=\" + data.result[i].inquiry_id + \"'>\" + data.result[i].inquiry_title + \"</a>\" +\"</td>\";\r\n");
      out.write("\t\t\t\tcontent  += \"<td>\" + data.result[i].create_date +\"</td>\";\r\n");
      out.write("\t\t\t\tcontent  += \"</tr>\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tcontent  += \"</tbody>\"\r\n");
      out.write("\t\t\tcontent  += \"</table>\";\r\n");
      out.write("        \t$(\"#inquiryList\"+cnt).html(content);\r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("//         \talert(\"error\");\r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function forumList(forum_theme_id, cnt) {\r\n");
      out.write("\tvar params=\"forum_theme_id=\"+forum_theme_id;  \r\n");
      out.write("    $.ajax({\r\n");
      out.write("        type : \"post\",\r\n");
      out.write("        url : \"");
      if (_jspx_meth_c_005furl_005f1(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("        dataType : \"html\",\r\n");
      out.write("        data : params,\r\n");
      out.write("        success : function(response) {\r\n");
      out.write("        \tvar data = jQuery.parseJSON(response);\r\n");
      out.write("        \t\r\n");
      out.write("        \tvar content = \"<table class='table table-hover'>\";\r\n");
      out.write("        \tcontent  += \"<colgroup>\"\r\n");
      out.write("\t\t\t\r\n");
      out.write("        \tcontent  += \"<col width='' />\"\r\n");
      out.write("        \tcontent  += \"<col width='' />\"\r\n");
      out.write("        \tcontent  += \"<col width='' />\"\r\n");
      out.write("\t\r\n");
      out.write("\t\t\tcontent  += \"</colgroup>\"\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tcontent  += \"<thead>\"\r\n");
      out.write("        \tcontent  += \"<tr>\";\r\n");
      out.write("        \tcontent  += \"<th>\" + \"번호\" +\"</th>\";\r\n");
      out.write("\t\t\tcontent  += \"<th>\" + \"제목\" + \"</th>\";\r\n");
      out.write("\t\t\tcontent  += \"<th>\" + \"등록일\" +\"</th>\";\r\n");
      out.write("\t\t\tcontent  += \"</tr>\";\r\n");
      out.write("\t\t\tcontent  += \"</thead>\"\r\n");
      out.write("\t\t\tcontent  += \"<tbody>\"\r\n");
      out.write("\t\t\tfor (var i = 0; i < data.result.length; i++) {\r\n");
      out.write("\t\t\t\tcontent  += \"<tr>\";\r\n");
      out.write("\t\t\t\tcontent  += \"<td>\" + data.result[i].rownum +\"</td>\";\r\n");
      out.write("\t\t\t\tcontent  += \"<td>\" + \"<a href='./forumDetail.do?forum_id=\" + data.result[i].forum_id + \"'>\" + data.result[i].forum_title + \"</a>\" +\"</td>\";\r\n");
      out.write("\t\t\t\tcontent  += \"<td>\" + data.result[i].create_date +\"</td>\";\r\n");
      out.write("\t\t\t\tcontent  += \"</tr>\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tcontent  += \"</tbody>\"\r\n");
      out.write("\t\t\tcontent  += \"</table>\";\r\n");
      out.write("        \t$(\"#forumList\"+cnt).html(content);\r\n");
      out.write("        },\r\n");
      out.write("        error : function(xhr, textStatus) {\r\n");
      out.write("//         \talert(\"error\");\r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("$(document).ready(function(){\r\n");
      out.write("\t");
for (int i = 0; i < inquiryList.size(); i++) {InquiryVO inquiryVO = (InquiryVO) inquiryList.get(i);
      out.write("\r\n");
      out.write("\tinquiryList(");
      out.print(inquiryVO.getInquiry_theme_id());
      out.write(',');
      out.print(i);
      out.write(");\r\n");
      out.write("\t\r\n");
      out.write("\t");
}
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t");
for (int i = 0; i < forumList.size(); i++) {ForumVO forumVO = (ForumVO) forumList.get(i);
      out.write("\r\n");
      out.write("\tforumList(");
      out.print(forumVO.getForum_theme_id());
      out.write(',');
      out.print(i);
      out.write(");\r\n");
      out.write("\r\n");
      out.write("\t");
}
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("    <!-- Carousel\r\n");
      out.write("    ================================================== -->\r\n");
      out.write("    <div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\">\r\n");
      out.write("      <!-- Indicators -->\r\n");
      out.write("      <ol class=\"carousel-indicators\">\r\n");
      out.write("        <li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>\r\n");
      out.write("        <li data-target=\"#myCarousel\" data-slide-to=\"1\"></li>\r\n");
      out.write("        <li data-target=\"#myCarousel\" data-slide-to=\"2\"></li>\r\n");
      out.write("      </ol>\r\n");
      out.write("      <div class=\"carousel-inner\">\r\n");
      out.write("        <div class=\"item active\">\r\n");
      out.write("          <img src=\"data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==\" alt=\"First slide\">\r\n");
      out.write("          <div class=\"container\">\r\n");
      out.write("            <div class=\"carousel-caption\">\r\n");
      out.write("              <h1>Example headline.</h1>\r\n");
      out.write("              <p>Note: If you're viewing this page via a <code>file://</code> URL, the \"next\" and \"previous\" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>\r\n");
      out.write("              <p><a class=\"btn btn-lg btn-primary\" href=\"#\" role=\"button\">Sign up today</a></p>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"item\">\r\n");
      out.write("          <img src=\"data:image/gif;base64,R0lGODlhAQABAIAAAGZmZgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==\" alt=\"Second slide\">\r\n");
      out.write("          <div class=\"container\">\r\n");
      out.write("            <div class=\"carousel-caption\">\r\n");
      out.write("              <h1>Another example headline.</h1>\r\n");
      out.write("              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\r\n");
      out.write("              <p><a class=\"btn btn-lg btn-primary\" href=\"#\" role=\"button\">Learn more</a></p>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"item\">\r\n");
      out.write("          <img src=\"data:image/gif;base64,R0lGODlhAQABAIAAAFVVVQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==\" alt=\"Third slide\">\r\n");
      out.write("          <div class=\"container\">\r\n");
      out.write("            <div class=\"carousel-caption\">\r\n");
      out.write("              <h1>One more for good measure.</h1>\r\n");
      out.write("              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\r\n");
      out.write("              <p><a class=\"btn btn-lg btn-primary\" href=\"#\" role=\"button\">Browse gallery</a></p>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <a class=\"left carousel-control\" href=\"#myCarousel\" role=\"button\" data-slide=\"prev\"><span class=\"glyphicon glyphicon-chevron-left\"></span></a>\r\n");
      out.write("      <a class=\"right carousel-control\" href=\"#myCarousel\" role=\"button\" data-slide=\"next\"><span class=\"glyphicon glyphicon-chevron-right\"></span></a>\r\n");
      out.write("    </div><!-- /.carousel -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- Marketing messaging and featurettes\r\n");
      out.write("    ================================================== -->\r\n");
      out.write("    <!-- Wrap the rest of the page in another container to center all the content. -->\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container marketing\">\r\n");
      out.write("\r\n");
      out.write("<!--  \r\n");
      out.write("      <div class=\"row\">\r\n");
      out.write("        <div class=\"col-lg-4\">\r\n");
      out.write("          <img class=\"img-circle\" src=\"data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==\" alt=\"Generic placeholder image\" style=\"width: 140px; height: 140px;\">\r\n");
      out.write("          <h2>Heading</h2>\r\n");
      out.write("          <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>\r\n");
      out.write("          <p><a class=\"btn btn-default\" href=\"#\" role=\"button\">View details &raquo;</a></p>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col-lg-4\">\r\n");
      out.write("          <img class=\"img-circle\" src=\"data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==\" alt=\"Generic placeholder image\" style=\"width: 140px; height: 140px;\">\r\n");
      out.write("          <h2>Heading</h2>\r\n");
      out.write("          <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>\r\n");
      out.write("          <p><a class=\"btn btn-default\" href=\"#\" role=\"button\">View details &raquo;</a></p>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col-lg-4\">\r\n");
      out.write("          <img class=\"img-circle\" src=\"data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==\" alt=\"Generic placeholder image\" style=\"width: 140px; height: 140px;\">\r\n");
      out.write("          <h2>Heading</h2>\r\n");
      out.write("          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>\r\n");
      out.write("          <p><a class=\"btn btn-default\" href=\"#\" role=\"button\">View details &raquo;</a></p>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("-->\r\n");
      out.write("\r\n");
      out.write("      <!-- START THE FEATURETTES -->\r\n");
      out.write("\r\n");
      out.write("<!--       <hr class=\"featurette-divider\"> -->\r\n");
      out.write("\r\n");
      out.write("      <div class=\"row featurette\">\r\n");
      out.write("<!--         <div class=\"col-md-7\"> -->\r\n");
      out.write("<!--           <h2 class=\"featurette-heading\">First featurette heading. <span class=\"text-muted\">It'll blow your mind.</span></h2> -->\r\n");
      out.write("<!--           <p class=\"lead\">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p> -->\r\n");
      out.write("<!--         </div> -->\r\n");
      out.write("<!--         <div class=\"col-md-5\"> -->\r\n");
      out.write("<!--           <img class=\"featurette-image img-responsive\" data-src=\"holder.js/500x500/auto\" alt=\"Generic placeholder image\"> -->\r\n");
      out.write("<!--         </div> -->\r\n");
      out.write("\t\t\t<h2>공지사항</h2>\r\n");
      out.write("\t\t\t<table class=\"table  table-hover \">\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t\t<col width=\"\" />\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>번호</th>\r\n");
      out.write("\t\t\t\t\t\t<th>제목</th>\r\n");
      out.write("\t\t\t\t\t\t<th>등록일</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t");
for (int i = 0; i < noticeList.size(); i++) {NoticeVO noticeVO = (NoticeVO) noticeList.get(i);
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print(noticeVO.getRownum() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<td><a href=\"./noticeDetail.do?notice_id=");
      out.print(noticeVO.getNotice_id());
      out.write('"');
      out.write('>');
      out.print(noticeVO.getNotice_title() );
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print(noticeVO.getCreate_date());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("<!--       <hr class=\"featurette-divider\"> -->\r\n");
      out.write("\r\n");
      out.write("      <div class=\"row featurette\">\r\n");
      out.write("<!--         <div class=\"col-md-5\"> -->\r\n");
      out.write("<!--           <img class=\"featurette-image img-responsive\" data-src=\"holder.js/500x500/auto\" alt=\"Generic placeholder image\"> -->\r\n");
      out.write("<!--         </div> -->\r\n");
      out.write("<!--         <div class=\"col-md-7\"> -->\r\n");
      out.write("<!--           <h2 class=\"featurette-heading\">Oh yeah, it's that good. <span class=\"text-muted\">See for yourself.</span></h2> -->\r\n");
      out.write("<!--           <p class=\"lead\">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p> -->\r\n");
      out.write("<!--         </div> -->\r\n");
      out.write("\t\t\t<h2>Q&A</h2>\r\n");
      out.write("\t\t\t");
for (int i = 0; i < inquiryList.size(); i++) {InquiryVO inquiryVO = (InquiryVO) inquiryList.get(i);
      out.write("\r\n");
      out.write("\t    \t\t<h3><a href=\"./inquiryList.do?inquiry_theme_id=");
      out.print(inquiryVO.getInquiry_theme_id());
      out.write('"');
      out.write('>');
      out.print(inquiryVO.getInquiry_theme() );
      out.write("</a></h3>\r\n");
      out.write("\t    \t\t");
      out.print(inquiryVO.getInquiry_explain());
      out.write("\r\n");
      out.write("\t    \t\t<div id=\"inquiryList");
      out.print(i);
      out.write("\"></div>\r\n");
      out.write("\t    \t");
}
      out.write("\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("<!--       <hr class=\"featurette-divider\"> -->\r\n");
      out.write("\r\n");
      out.write("      <div class=\"row featurette\">\r\n");
      out.write("<!--         <div class=\"col-md-7\"> -->\r\n");
      out.write("<!--           <h2 class=\"featurette-heading\">And lastly, this one. <span class=\"text-muted\">Checkmate.</span></h2> -->\r\n");
      out.write("<!--           <p class=\"lead\">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p> -->\r\n");
      out.write("<!--         </div> -->\r\n");
      out.write("<!--         <div class=\"col-md-5\"> -->\r\n");
      out.write("<!--           <img class=\"featurette-image img-responsive\" data-src=\"holder.js/500x500/auto\" alt=\"Generic placeholder image\"> -->\r\n");
      out.write("<!--         </div> -->\r\n");
      out.write("\t\t\t<h2>포럼</h2>\r\n");
      out.write("\t\t\t");
for (int i = 0; i < forumList.size(); i++) {ForumVO forumVO = (ForumVO) forumList.get(i);
      out.write("\r\n");
      out.write("\t    \t\t<h3><a href=\"./forumList.do?forum_theme_id=");
      out.print(forumVO.getForum_theme_id());
      out.write('"');
      out.write('>');
      out.print(forumVO.getForum_theme() );
      out.write("</a></h3>\r\n");
      out.write("\t    \t\t");
      out.print(forumVO.getForum_explain());
      out.write("\r\n");
      out.write("\t    \t\t<div id=\"forumList");
      out.print(i);
      out.write("\"></div>\r\n");
      out.write("\t    \t");
}
      out.write("\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("    </div><!-- /.container -->\r\n");
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write(" <div>");
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
    // /jsp/main/mainPage.jsp(23,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/getInquiryList.aj");
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
    // /jsp/main/mainPage.jsp(68,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f1.setValue("/getForumList.aj");
    int _jspx_eval_c_005furl_005f1 = _jspx_th_c_005furl_005f1.doStartTag();
    if (_jspx_th_c_005furl_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
    return false;
  }
}
