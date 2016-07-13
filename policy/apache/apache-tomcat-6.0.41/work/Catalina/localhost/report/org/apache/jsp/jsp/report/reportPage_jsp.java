package org.apache.jsp.jsp.report;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class reportPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	String startDate = (String) request.getAttribute("startDate");
	String endDate = (String) request.getAttribute("endDate");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${_ContextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/css/jquery.ptTimeSelect.css\" />\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${_ContextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery.ptTimeSelect.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${_ContextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/js/chart/Chart.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <script>\r\n");
      out.write("\t        $(function() {\r\n");
      out.write("\t            $(\"#datepickerStart\").datepicker();\r\n");
      out.write("\t        });\r\n");
      out.write("\t        $(function() {\r\n");
      out.write("\t            $(\"#datepickerEnd\").datepicker();\r\n");
      out.write("\t        });\r\n");
      out.write("\t        $(function() {\r\n");
      out.write("\t            $('#ptTimeStart').ptTimeSelect();\r\n");
      out.write("\t        });\r\n");
      out.write("\t        $(function() {\r\n");
      out.write("\t            $('#ptTimeEnd').ptTimeSelect();\r\n");
      out.write("\t        });\r\n");
      out.write("\t        \r\n");
      out.write("\t        function drawChart(data) {\r\n");
      out.write("                var result = JSON.parse(data);\r\n");
      out.write("                //alert(JSON.stringify(result));\r\n");
      out.write("                //myPie.clear();\r\n");
      out.write("                //alert(myPie.segments.length);\r\n");
      out.write("                /* \r\n");
      out.write("                for (var i = 0; i < myPie.segments.length+4; i++) {\r\n");
      out.write("                \tmyPie.removeData();\r\n");
      out.write("                }\r\n");
      out.write("                 */\r\n");
      out.write("                var ctx = document.getElementById(\"chart-area\").getContext(\"2d\");\r\n");
      out.write("                var myPie = new Chart(ctx).Pie(result);\r\n");
      out.write("                /* \r\n");
      out.write("                for (var j = 0; j < result.length; j++) {\r\n");
      out.write("                    myPie.addData(result[j]);\r\n");
      out.write("                }\r\n");
      out.write("                 */\r\n");
      out.write("                //myPie.update();\r\n");
      out.write("\t        }\r\n");
      out.write("\r\n");
      out.write("\t        function search() {\r\n");
      out.write("\t            \r\n");
      out.write("\t            $.ajax({\r\n");
      out.write("\t                type : \"post\",\r\n");
      out.write("\t                url : \"");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("\t                dataType : \"html\",\r\n");
      out.write("\t                data : $(\"#searchConditionform\").serialize(),\r\n");
      out.write("\t                success : function(response) {\r\n");
      out.write("\t                \tvar data = jQuery.parseJSON(response);\r\n");
      out.write("\t                \t$('#logList').hide();\r\n");
      out.write("\t                \tif(data.length>0){\r\n");
      out.write("\t                \t\tdrawChart(response);\r\n");
      out.write("\t                \t\t$('#chart').show();\r\n");
      out.write("\t                \t\t$(\"#pdfChart\").show();\r\n");
      out.write("\t                \t}else{alert(\"조회결과가 없습니다.\");}\r\n");
      out.write("\t                },\r\n");
      out.write("\t                error : function(xhr, textStatus) {\r\n");
      out.write("\r\n");
      out.write("\t                }\r\n");
      out.write("\t            });\r\n");
      out.write("\t        }\r\n");
      out.write("\t        \r\n");
      out.write("\t        function logList() {\r\n");
      out.write("\r\n");
      out.write("\t            $.ajax({\r\n");
      out.write("\t                type : \"post\",\r\n");
      out.write("\t                url : \"");
      if (_jspx_meth_c_005furl_005f1(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("\t                dataType : \"html\",\r\n");
      out.write("\t                data : $(\"#searchConditionform\").serialize(),\r\n");
      out.write("\t                success : function(response) {\r\n");
      out.write("\t                \t$('#chart').hide();\r\n");
      out.write("\t                \tvar data = jQuery.parseJSON(response);\r\n");
      out.write("\t                \tif(data.result.length>0){\r\n");
      out.write("\t                \t\tvar content = \"<table class='table table-striped table-bordered table-hover table-condensed'>\";\r\n");
      out.write("\t\t                \tcontent  += \"<colgroup>\";\r\n");
      out.write("\t\t                \tcontent  += \"<col width='' />\";\r\n");
      out.write("\t\t                \tcontent  += \"<col width='' />\";\r\n");
      out.write("\t\t                \tcontent  += \"<col width='' />\";\r\n");
      out.write("\t\t                \tcontent  += \"<col width='' />\";\r\n");
      out.write("\t\t                \tcontent  += \"<col width='' />\";\r\n");
      out.write("\t\t                \tcontent  += \"<col width='' />\";\r\n");
      out.write("\t\t                \tcontent  += \"</colgroup>\";\r\n");
      out.write("\t\t                \tcontent  += \"<thead>\";\r\n");
      out.write("\t\t\t\t\t\t\tcontent  += \"<tr>\";\r\n");
      out.write("\t\t                \tcontent  += \"<th>\" + \"접근 IP\" +\"</th>\";\r\n");
      out.write("\t\t        \t\t\tcontent  += \"<th>\" + \"접근 DB USER\" +\"</th>\";\r\n");
      out.write("\t\t        \t\t\tcontent  += \"<th>\" + \"암복호화\" +\"</th>\";\r\n");
      out.write("\t\t        \t\t\tcontent  += \"<th>\" + \"허용여부\" +\"</th>\";\r\n");
      out.write("\t\t        \t\t\tcontent  += \"<th>\" + \"거부이유\" +\"</th>\";\r\n");
      out.write("\t\t        \t\t\tcontent  += \"<th>\" + \"접근횟수\" +\"</th>\";\r\n");
      out.write("\t\t        \t\t\tcontent  += \"</tr>\";\r\n");
      out.write("\t\t        \t\t\tcontent  += \"</thead>\";\r\n");
      out.write("\t\t        \t\t\tcontent += \"<tbody>\";\r\n");
      out.write("\t\t        \t\t\tfor (var i = 0; i < data.result.length; i++) {\r\n");
      out.write("\t\t        \t\t\t\tcontent  += \"<tr>\";\r\n");
      out.write("\t\t        \t\t\t\tcontent  += \"<td>\" + data.result[i].connect_ip +\"</td>\";\r\n");
      out.write("\t\t        \t\t\t\tcontent  += \"<td>\" + data.result[i].connect_db_user +\"</td>\";\r\n");
      out.write("\t\t        \t\t\t\tcontent  += \"<td>\" + data.result[i].encryption_yn +\"</td>\";\r\n");
      out.write("\t\t        \t\t\t\tcontent  += \"<td>\" + data.result[i].allow_yn +\"</td>\";\r\n");
      out.write("\t\t        \t\t\t\tcontent  += \"<td>\" + data.result[i].deny_reason +\"</td>\";\r\n");
      out.write("\t\t        \t\t\t\tcontent  += \"<td>\" + data.result[i].count +\"</td>\";\r\n");
      out.write("\t\t        \t\t\t\tcontent  += \"</tr>\";\r\n");
      out.write("\t\t        \t\t\t}\r\n");
      out.write("\t\t        \t\t\tcontent += \"<tbody>\";\r\n");
      out.write("\t\t        \t\t\tcontent += \"</table>\";\r\n");
      out.write("\t\t                \t$(\"#logList\").html(content);\r\n");
      out.write("\t\t                \t$('#logList').show();\r\n");
      out.write("\t\t                \t$(\"#pdfTable\").show();\r\n");
      out.write("\t                \t}else{alert(\"조회결과가 없습니다.\");}\r\n");
      out.write("\t                },\r\n");
      out.write("\t                error : function(xhr, textStatus) {\r\n");
      out.write("\t                    \r\n");
      out.write("\t                }\r\n");
      out.write("\t            });\r\n");
      out.write("\t        }\r\n");
      out.write("\t        \r\n");
      out.write("\t        $(document).ready(function(){\r\n");
      out.write("\t        \t$('#connect_ip').prop('readonly', true);\r\n");
      out.write("\t        \t$('#connect_db_user').prop('readonly', true);\r\n");
      out.write("\t        \t\r\n");
      out.write("\t        \t\r\n");
      out.write("\t        \t$(\"#pdfTable\").hide();\r\n");
      out.write("\t        \t$(\"#pdfChart\").hide();\r\n");
      out.write("\t        \t\r\n");
      out.write("\t            $(\"#searchButton\").click(function(event) {\r\n");
      out.write("\t            \tif($(\"#IP option:selected\").val()==\"Direct\" && $(\"#connect_ip\").val()==\"\"){\r\n");
      out.write("\t            \t\talert(\"IP를 입력하세요.\");\r\n");
      out.write("\t            \t\treturn false;\r\n");
      out.write("\t            \t}\r\n");
      out.write("\t            \tif($(\"#USER option:selected\").val()==\"Direct\" && $(\"#connect_db_user\").val()==\"\"){\r\n");
      out.write("\t        \t\t\talert(\"DB user를 입력하세요.\");\r\n");
      out.write("\t        \t\t\treturn false;\r\n");
      out.write("\t        \t\t}\r\n");
      out.write("\t            \t$(\"#pdfChart\").hide();\r\n");
      out.write("\t            \t$(\"#pdfTable\").hide();\r\n");
      out.write("\t            \t$('#chart').hide();\r\n");
      out.write("\t                search();\r\n");
      out.write("\t            });\r\n");
      out.write("\t            $(\"#listButton\").click(function(event) {\r\n");
      out.write("\t            \tif($(\"#IP option:selected\").val()==\"Direct\" && $(\"#connect_ip\").val()==\"\"){\r\n");
      out.write("\t            \t\talert(\"IP를 입력하세요.\");\r\n");
      out.write("\t            \t\treturn false;\r\n");
      out.write("\t            \t}\r\n");
      out.write("\t            \tif($(\"#USER option:selected\").val()==\"Direct\" && $(\"#connect_db_user\").val()==\"\"){\r\n");
      out.write("\t            \t\talert(\"DB user를 입력하세요.\");\r\n");
      out.write("\t        \t\t\treturn false;\r\n");
      out.write("\t        \t\t}\r\n");
      out.write("\t            \t$(\"#pdfChart\").hide();\r\n");
      out.write("\t            \t$(\"#pdfTable\").hide();\r\n");
      out.write("\t            \t$('#logList').hide();\r\n");
      out.write("\t                logList();\r\n");
      out.write("\t            });\r\n");
      out.write("\t            $(\"#pdfChart\").click(function(event) {\r\n");
      out.write("\t            \tdocument.searchConditionform.action='./pdfChart.do';\r\n");
      out.write("\t            \tsearchConditionform.submit();\r\n");
      out.write("\t            });\r\n");
      out.write("\t            $(\"#pdfTable\").click(function(event) {\r\n");
      out.write("\t            \tdocument.searchConditionform.action='./pdfTable.do';\r\n");
      out.write("\t            \tsearchConditionform.submit();\r\n");
      out.write("\t            });\r\n");
      out.write("\t            \r\n");
      out.write("\t            $(\"#IP\").change(function() {\r\n");
      out.write("\t        \t\tif($(\"#IP option:selected\").val()==\"ALL\"){\r\n");
      out.write("\t        \t\t\t$(\"#connect_ip\").val(\"\");\r\n");
      out.write("\t        \t\t\t$('#connect_ip').prop('readonly', true);\r\n");
      out.write("\t        \t\t}else if($(\"#IP option:selected\").val()==\"Direct\"){\r\n");
      out.write("\t        \t\t\t$('#connect_ip').prop('readonly', false);\r\n");
      out.write("\t        \t\t}\r\n");
      out.write("\t        \t});\r\n");
      out.write("\t            \r\n");
      out.write("\t            $(\"#USER\").change(function() {\r\n");
      out.write("\t        \t\tif($(\"#USER option:selected\").val()==\"ALL\"){\r\n");
      out.write("\t        \t\t\t$(\"#connect_db_user\").val(\"\");\r\n");
      out.write("\t        \t\t\t$('#connect_db_user').prop('readonly', true);\r\n");
      out.write("\t        \t\t}else if($(\"#USER option:selected\").val()==\"Direct\"){\r\n");
      out.write("\t        \t\t\t$('#connect_db_user').prop('readonly', false);\r\n");
      out.write("\t        \t\t}\r\n");
      out.write("\t        \t});\r\n");
      out.write("\t            \r\n");
      out.write("\t        });\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("<!-- container -->\r\n");
      out.write("<div class=\"container-fluid \">\r\n");
      out.write("    <div class=\"row-fluid \">\r\n");
      out.write("        <div class=\"span2\">\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"span8\">\r\n");
      out.write("        <H3>DB보안 접근로그 리포트(top N)</H3>\r\n");
      out.write("          <form method=\"post\" id=\"searchConditionform\" name=\"searchConditionform\">\r\n");
      out.write("              <table class=\"table table-condensed\">\r\n");
      out.write("                  <colgroup>\r\n");
      out.write("                  <col width=\"20%\" />\r\n");
      out.write("                  <col width=\"80%\" />\r\n");
      out.write("                  </colgroup>\r\n");
      out.write("                  <tbody>\r\n");
      out.write("                       <tr>\r\n");
      out.write("                          <th class=\"al\"> 접근 IP</th>\r\n");
      out.write("                          <td>\r\n");
      out.write("                          <input type=\"text\" id=\"connect_ip\" name=\"connect_ip\" value=\"\" />\r\n");
      out.write("                           <select class=\"ml10\" id=\"IP\">\r\n");
      out.write("                                      <option value=\"ALL\">전체</option>\r\n");
      out.write("                                      <option value=\"Direct\">직접입력</option>\r\n");
      out.write("                           </select>\r\n");
      out.write("                          </td>\r\n");
      out.write("                       </tr>  \r\n");
      out.write("                       <tr>  \r\n");
      out.write("                          <th class=\"al\"> 접근 DB User</th>\r\n");
      out.write("                          <td><input type=\"text\" id=\"connect_db_user\" name=\"connect_db_user\" value=\"\"/>\r\n");
      out.write("                          <select class=\"ml10\" id=\"USER\">\r\n");
      out.write("                                      <option value=\"ALL\">전체</option>\r\n");
      out.write("                                      <option value=\"Direct\">직접입력</option>\r\n");
      out.write("                           </select>\r\n");
      out.write("                          \r\n");
      out.write("                          </td>\r\n");
      out.write("                       </tr> \r\n");
      out.write("                       <tr>  \r\n");
      out.write("                          <th class=\"al\"> 기간</th>\r\n");
      out.write("                          <td>\r\n");
      out.write("                              <input type=\"text\" id=\"datepickerStart\" name=\"datepickerStart\" value=\"");
      out.print(startDate);
      out.write("\"/>\r\n");
      out.write("                              <input type=\"text\" id=\"ptTimeStart\" name=\"ptTimeStart\" value=\"12:00 AM\"/> ~ <input type=\"text\" id=\"datepickerEnd\" name=\"datepickerEnd\" value=\"");
      out.print(endDate);
      out.write("\"/>\r\n");
      out.write("                              <input type=\"text\" id=\"ptTimeEnd\" name=\"ptTimeEnd\" value=\"11:59 PM\"/>\r\n");
      out.write("                          </td>\r\n");
      out.write("                       </tr>\r\n");
      out.write("                       <tr>  \r\n");
      out.write("                       \t  <th class=\"al\"> 암복호화</th>\t \r\n");
      out.write("                          <td>\r\n");
      out.write("                              <select class=\"ml10\" id=\"encryption_yn\" name=\"encryption_yn\">\r\n");
      out.write("                                      <option value=\"\">전체</option>\r\n");
      out.write("                                      <option value=\"Y\">암호화</option>\r\n");
      out.write("                                      <option value=\"N\">복호화</option>\r\n");
      out.write("                              </select>\r\n");
      out.write("                          </td>\r\n");
      out.write("                       </tr> \r\n");
      out.write("                       <tr> \r\n");
      out.write("                          <th class=\"al\"> 접근</th>\r\n");
      out.write("                          <td>\r\n");
      out.write("                              <select class=\"ml10\" id=\"allow_yn\" name=\"allow_yn\">\r\n");
      out.write("                                      <option value=\"\">전체</option>\r\n");
      out.write("                                      <option value=\"Y\">허용</option>\r\n");
      out.write("                                      <option value=\"N\">차단</option>\r\n");
      out.write("                              </select>\r\n");
      out.write("                          </td>\r\n");
      out.write("                       </tr>\r\n");
      out.write("                       <tr>    \r\n");
      out.write("                          <th class=\"al\"> TOP N</th>\r\n");
      out.write("                          <td><input type=\"text\" name=\"topN\" value=\"10\"/></td>\r\n");
      out.write("                          <td> <!-- <input type=\"button\" class=\"btn\" id=\"searchButton\" value=\"조회\" /> --></td>\r\n");
      out.write("                      </tr>\r\n");
      out.write("                      <tr>\r\n");
      out.write("                      \t  <th class=\"al\"> </th>\r\n");
      out.write("                          <td > <input type=\"button\" class=\"btn\" id=\"searchButton\" value=\"차트\" />&nbsp;<input type=\"button\" class=\"btn\" id=\"listButton\" value=\"리스트\" /></td>\r\n");
      out.write("                      </tr>\r\n");
      out.write("                      <tr>\r\n");
      out.write("<!--                       <th class=\"al\"> </th> -->\r\n");
      out.write("\r\n");
      out.write("<!--                       </tr> -->\r\n");
      out.write("                  </tbody>\r\n");
      out.write("              </table>\r\n");
      out.write("          </form>\r\n");
      out.write("          <div id = \"chart\"><canvas id=\"chart-area\" width=\"900\" height=\"300\"/></div><br></br>\r\n");
      out.write("          <input type=\"button\" class=\"btn\" id=\"pdfChart\" value=\"다운로드\" />\r\n");
      out.write("          <div id=\"logList\"></div>\r\n");
      out.write("          <input type=\"button\" class=\"btn\" id=\"pdfTable\" value=\"다운로드\" />\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <div class=\"span2\"></div>\r\n");
      out.write("    </div>\r\n");
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
    // /jsp/report/reportPage.jsp(54,24) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/getAccessLog.aj");
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
    // /jsp/report/reportPage.jsp(76,24) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f1.setValue("/getLogList.aj");
    int _jspx_eval_c_005furl_005f1 = _jspx_th_c_005furl_005f1.doStartTag();
    if (_jspx_th_c_005furl_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
    return false;
  }
}
