/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.58
 * Generated at: 2021-06-08 05:26:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.image;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import poly.dto.ImageDTO;
import poly.dto.UserDTO;
import poly.util.CmmUtil;
import poly.util.CmmUtil;
import java.util.List;
import poly.dto.ImageDTO;
import poly.dto.UserDTO;

public final class imageDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/view/user/top.jsp", Long.valueOf(1623054076000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("poly.dto.ImageDTO");
    _jspx_imports_classes.add("poly.dto.UserDTO");
    _jspx_imports_classes.add("poly.util.CmmUtil");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

	String SS_USER_ID = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));

	ImageDTO rDTO = (ImageDTO)request.getAttribute("rDTO");

	UserDTO uDTO = (UserDTO)request.getAttribute("urDTO");


      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\"\n");
      out.write("          content=\"width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0\">\n");
      out.write("\n");
      out.write("    <meta name=\"mobile-web-app-capable\" content=\"yes\">\n");
      out.write("    <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"default\">\n");
      out.write("    <!-- Facebook Meta Tags / 페이스북 오픈 그래프 -->\n");
      out.write("    <meta property=\"og:url\" content=\"http://kindtiger.dothome.co.kr/insta\">\n");
      out.write("    <meta property=\"og:type\" content=\"website\">\n");
      out.write("    <meta property=\"og:title\" content=\"instagram\">\n");
      out.write("    <meta property=\"og:description\" content=\"instagram clone\">\n");
      out.write("    <meta property=\"og:image\" content=\"http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg\">\n");
      out.write("    .\n");
      out.write("    <!-- Twitter Meta Tags / 트위터 -->\n");
      out.write("    <meta name=\"twitter:card\" content=\"instagram clone\">\n");
      out.write("    <meta name=\"twitter:title\" content=\"instagram\">\n");
      out.write("    <meta name=\"twitter:description\" content=\"instagram clone\">\n");
      out.write("    <meta name=\"twitter:image\" content=\"http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg\">\n");
      out.write("\n");
      out.write("    <!-- Google / Search Engine Tags / 구글 검색 엔진 -->\n");
      out.write("    <meta itemprop=\"name\" content=\"instagram\">\n");
      out.write("    <meta itemprop=\"description\" content=\"instagram clone\">\n");
      out.write("    <meta itemprop=\"image\" content=\"http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    <title>instagram</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"../resourceImg/css/reset.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"../resourceImg/css/common.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"../resourceImg/css/style.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"../resourceImg/css/detail-page.css\">\n");
      out.write("    <link rel=\"shortcut icon\" href=\"../resourceImg/imgs/instagram.png\">\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<section id=\"container\">\n");
      out.write("\n");
      out.write("    ");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

	String user_id = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<header id=\"header\">\n");
      out.write("        <section class=\"inner\">\n");
      out.write("            <h1 class=\"logo\">\n");
      out.write("                <a href=\"index.html\">\n");
      out.write("                    <div class=\"sprite_insta_icon\"></div>\n");
      out.write("                    <div class=\"sprite_write_logo\"></div>\n");
      out.write("                </a>\n");
      out.write("            </h1>\n");
      out.write("            <div class=\"search_box\">\n");
      out.write("                <input type=\"text\" placeholder=\"검색\" id=\"search-field\">\n");
      out.write("\n");
      out.write("                <div class=\"fake_field\">\n");
      out.write("                    <span class=\"sprite_small_search_icon\"></span>\n");
      out.write("                    <span>검색</span>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"right_icons\">\n");
      out.write("            <form enctype=\"multipart/form-data\" action=\"/image/imageUpload.do\" method=\"post\">\n");
      out.write("               <input type=\"file\" name=\"fileUpload\" style=\"display:none\" onchange=\"fileSelect()\">\n");
      out.write("                <div class=\"sprite_camera_icon\" onclick='document.all.fileUpload.click();' ></div>\n");
      out.write("                <input type=\"text\" id=\"one_title\" name=\"one_title\" style=\"display:none\"/>\n");
      out.write("               \t<input type=\"submit\" name=\"fileInsert\" style=\"display:none\"/>\n");
      out.write("           \t </form> <!-- prompt를 이용해 제목 값을 불러오기 -->\n");
      out.write("           \t    <script>\n");
      out.write("\t           \t\t\n");
      out.write("\t           \t\tfunction fileSelect(){\n");
      out.write("\t           \t\t\t\n");
      out.write("\t           \t\t\tvar ppt = prompt(\"15자 이내의 간단한 제목을 정해주세요!\",\"\");\n");
      out.write("\t           \t\t\t\n");
      out.write("\t           \t\t\tif (ppt.length > 0){\n");
      out.write("\t           \t\t\t\t\n");
      out.write("\t           \t\t\t\t$('input[name=one_title]').attr('value', ppt);\n");
      out.write("\t           \t\t\t\t\n");
      out.write("\t           \t\t\t\tconsole.log(one_title.value);\n");
      out.write("\t           \t\t\t\t\n");
      out.write("\t\t           \t\t\tdocument.all.fileInsert.click();\n");
      out.write("\t           \t\t\t}else {\n");
      out.write("\t           \t\t\t\talert(\" 제목을 지어 주셔야 합니다 !\");\n");
      out.write("\t           \t\t\t}\n");
      out.write("\t           \t\t}\n");
      out.write("\t           \t\t\n");
      out.write("\t           </script>\n");
      out.write("                <a onclick=\"location.href='../map/circle.do'\"><div class=\"sprite_compass_icon\"></div></a><!-- 카카오 지도 api연결 -->\n");
      out.write("                <a onclick=\"location.href='../user/MyPage.do'\" ><div class=\"sprite_user_icon_outline\" name=\"SS_USER_ID\" value=\"");
      out.print(user_id);
      out.write("\"></div></a>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("    </header>\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("    \n");
      out.write("    <form >\n");
      out.write("    <div id=\"main_container\">\n");
      out.write("\n");
      out.write("        <section class=\"b_inner\">\n");
      out.write("\n");
      out.write("            <div class=\"contents_box\">\n");
      out.write("\n");
      out.write("                <article class=\"contents cont01\">\n");
      out.write("\n");
      out.write("                    <div class=\"img_section\">\n");
      out.write("                        <div class=\"trans_inner\">\n");
      out.write("                            <div><img src=\"../resourceImg/Image/");
      out.print(rDTO.getSave_folder_name() );
      out.write('/');
      out.print(rDTO.getSave_file_name());
      out.write("\" alt=\"\"></div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"detail--right_box\">\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("                        <header class=\"top\">\n");
      out.write("                            <div class=\"user_container\">\n");
      out.write("                                <div class=\"profile_img\">\n");
      out.write("                                    <img src=\"../resourceImg/");
      out.print(uDTO.getUser_folder_name() );
      out.write('/');
      out.print(uDTO.getUser_profile_name() );
      out.write("\" alt=\"\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"user_name\">\n");
      out.write("                                    <div class=\"nick_name\">");
      out.print(rDTO.getReg_id() );
      out.write("</div>\n");
      out.write("                                    <!-- 입력한 date-->\n");
      out.write("                                    <div class=\"chg_dt\">");
      out.print(rDTO.getChg_dt() );
      out.write("</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </header>\n");
      out.write("                        <section class=\"scroll_section\">\n");
      out.write("                            <div class=\"admin_container\">\n");
      out.write("                                <div class=\"comment\">\n");
      out.write("                                    <span class=\"user_id\"></span>\n");
      out.write("                                    <input type=\"text\" name=\"one_title\" id=\"Update_one_title\" value=\"");
      out.print(rDTO.getOne_title() );
      out.write("\"  />                         \n");
      out.write("                             \t</div>\n");
      out.write("                             </div>\n");
      out.write("\t\t\t\t\t\t</section>\n");
      out.write("                        <div class=\"bottom_icons\">\n");
      out.write("                            <div class=\"left_icons\"></div>\n");
      out.write("                            <div class=\"right_icon\"></div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"commit_field\">\n");
      out.write("                            <div class=\"heart_btn\">\n");
      out.write("                                <div class=\"sprite_heart_icon_outline\" data-name=\"heartbeat\"></div>\n");
      out.write("                             </div>\n");
      out.write("                             <div class=\"count_likes\">\n");
      out.write("                                좋아요\n");
      out.write("                                <span class=\"like_cnt\"> </span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <input type=\"button\" value=\"수정\" onclick=\"javascript:updateImage(");
      out.print(rDTO.getImage_no());
      out.write(")\">\n");
      out.write("                        <input type=\"button\" value=\"삭제\" onclick=\"javascript:delImage(");
      out.print(rDTO.getImage_no());
      out.write(")\">\n");
      out.write("                </article>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("    </div>\n");
      out.write("   </form>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.4.1.min.js\"></script>\n");
      out.write("\n");
      out.write("<script >\n");
      out.write("\tfunction delImage(image_no) {\n");
      out.write("\t\t\n");
      out.write("\t\t // 게시글의 번호를 불러와 하이퍼링크로 컨트롤러로 넘기기\n");
      out.write("\t    console.log(\"게시글 번호 : \" + image_no);\n");
      out.write("\t\t \n");
      out.write("\t\tvar delConfirm = \"게시글을 삭제 하시겠습니까?\";\n");
      out.write("\t\t\n");
      out.write("\t\t\tif(confirm(delConfirm)){\n");
      out.write("\t\t\t\t$.ajax({\n");
      out.write("\t\t\t\t\turl : \"/image/delImage.do\",\n");
      out.write("\t\t\t\t\ttype : \"post\",\n");
      out.write("\t\t\t\t\tdata : \n");
      out.write("\t\t\t\t\t\t{\n");
      out.write("\t\t\t\t\t\t\"image_no\" : image_no\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\tsuccess : function(data){\n");
      out.write("\t\t\t\t\t\tif(data == 1){\n");
      out.write("\t\t\t\t\t\t\talert(\"삭제에 성공했습니다.\");\n");
      out.write("\t\t\t\t\t\t}else if(data == 0){\n");
      out.write("\t\t\t\t\t\t\talert(\"삭제에 실패했습니다.\");\n");
      out.write("\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t})\n");
      out.write("\t\t\t}\n");
      out.write("\t\t}\n");
      out.write("\tfunction updateImage(image_no){\n");
      out.write("\t\t\n");
      out.write("\t\tvar updateConfirm = \"수정 하겠습니까?\";\n");
      out.write("\t\t\n");
      out.write("\t\tvar title = '");
      out.print(rDTO.getOne_title());
      out.write("';\n");
      out.write("\t\t\n");
      out.write("\t\tvar one_title = document.getElementById('Update_one_title').value;\n");
      out.write("\t\t\n");
      out.write("\t\tif( title != one_title ){\n");
      out.write("\t\t\tif(confirm(updateConfirm)){\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\tconsole.log(\" load for DTO : \" + title);\n");
      out.write("\t\t\t\tconsole.log(\" load for JSP : \" + one_title);\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t$.ajax({\n");
      out.write("\t\t\t\t\turl : \"/image/updateImage.do\",\n");
      out.write("\t\t\t\t\ttype : \"post\",\n");
      out.write("\t\t\t\t\tdata : \n");
      out.write("\t\t\t\t\t\t{\n");
      out.write("\t\t\t\t\t\t\"image_no\" : image_no,\n");
      out.write("\t\t\t\t\t\t\"one_title\" : one_title\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\tsuccess : function(data){\n");
      out.write("\t\t\t\t\t\tif(data == 1){\n");
      out.write("\t\t\t\t\t\t\talert(\"수정에 성공했습니다.\");\n");
      out.write("\t\t\t\t\t\t}else if(data == 0){\n");
      out.write("\t\t\t\t\t\t\talert(\"수정에 실패했습니다.\");\n");
      out.write("\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t})\n");
      out.write("\t\t\t}\n");
      out.write("\t\t}\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t/* var one_title = document.getElementById(\"one_title\").value;\n");
      out.write("\t\n");
      out.write("\tfunction ChangeText(e){\n");
      out.write("\t\tone_title = e;\n");
      out.write("\t\t\n");
      out.write("\t\tconsole.log(\" load for TextOnchange event : \" + one_title);\n");
      out.write("\t} */\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\n");
      out.write("</script>\n");
      out.write("<!--<script src=\"js/detail.js\"></script>-->\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
