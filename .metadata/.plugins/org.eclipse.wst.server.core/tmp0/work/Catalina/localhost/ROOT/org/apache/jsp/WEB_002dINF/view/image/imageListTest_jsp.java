/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.58
 * Generated at: 2021-06-07 08:22:39 UTC
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

public final class imageListTest_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	List<ImageDTO> rList = (List<ImageDTO>)request.getAttribute("rList");
	
	List<UserDTO> uList = (List<UserDTO>)request.getAttribute("uList");

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<meta name=\"viewport\"\n");
      out.write("          content=\"width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0\">\n");
      out.write("\n");
      out.write("    <link rel=\"stylesheet\" href=\"../resourceImg/css/reset.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"../resourceImg/css/common.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"../resourceImg/css/style.css\">\n");
      out.write("    \n");
      out.write("    \n");
      out.write("<title>안녕 디지몬</title>\n");
      out.write("<script src=\"http://code.jquery.com/jquery-1.11.0.min.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<section id=\"container\">\n");
      out.write(" \t ");
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
      out.write("    \n");
      out.write("\t\t<div class=\"hidden_menu\" id=\"hidden_menu\">\n");
      out.write("\t\t\t    <div class=\"scroll_inner\">\n");
      out.write("\t\t\t    ");
 for (UserDTO userId : uList) {
      out.write("\n");
      out.write("\t\t\t    \t<div class=\"user\">\n");
      out.write("\t\t\t    \t<input type=\"text\" style=\"display:none\" name=\"user_no\" value=\"");
      out.print(userId.getUser_no() );
      out.write("\"/>\n");
      out.write("\t\t\t    \t\t<div class=\"thumb_img\">\n");
      out.write("\t\t\t    \t\t\t<img src=\"../resourceImg/");
      out.print(userId.getUser_folder_name());
      out.write('/');
      out.print(userId.getUser_profile_name());
      out.write("\"/> <!-- 프로필 사진 경로 -->\n");
      out.write("\t\t\t    \t\t</div>\n");
      out.write("\t\t\t    \t\t");
      out.print(userId.getUser_id());
      out.write("\n");
      out.write("\t\t\t    \t</div>\n");
      out.write("\t\t\t    \t ");
 } 
      out.write("\n");
      out.write("\t\t\t    </div>\n");
      out.write("\t\t\t </div>\n");
      out.write("\t<script>\n");
      out.write("\t\tfunction userList(){\n");
      out.write("\t\t\tvar user_no = $('#user_no').val();\n");
      out.write("\t\t\t\n");
      out.write("\t\t\tif($('#user_no').val() == \"\"){\n");
      out.write("\t\t\t\t$('#user_no').focus();\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t\n");
      out.write("\t\t\tconsole.log(\"user_no : \" + user_no);\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t$.ajax({\n");
      out.write("\t\t\t\turl : '/image/userListAll.do',\n");
      out.write("\t\t\t\ttype : 'post',\n");
      out.write("\t\t\t\tdata : {\n");
      out.write("\t\t\t\t\t\"user_no\" : user_no\n");
      out.write("\t\t\t\t},\n");
      out.write("\t\t\t\tsuccess : function(data) { \n");
      out.write("\t\t\t\t\tconsole.log(\"test\");\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\tvar userHTML = \"\"; // 게시판위의 나타내어 줄 userId, userProfile 정보 들고오기\n");
      out.write("\t\t\t\t\tuserHTML = 'div class=\"user\">';\n");
      out.write("\t\t\t\t\tuserHTML = '<div style=\"display:none\" name=\"user_no\">'+data.getUser_no()+'</div>';\n");
      out.write("\t\t\t\t\tuserHTML = '<div class=\"thumb_img\"> <img src=\"../resourceImg/'+data.getUser_folder_name()+'/'+data.getUser_profile_name()+'\"/></div>';\n");
      out.write("\t\t\t\t\tuserHTML = data.getReg_id()+'</div> ';\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\tif(data.length == 0){\n");
      out.write("\t\t\t\t\t\tuserHTML = 'div class=\"user\">';\n");
      out.write("\t\t\t\t\t\tuserHTML = '<div style=\"display:none\" name=\"user_no\"></div>';\n");
      out.write("\t\t\t\t\t\tuserHTML = '<div class=\"thumb_img\"> <img src=\"../resourceImg/imgs/thumb.jpeg\"/></div>';\n");
      out.write("\t\t\t\t\t\tuserHTML = '</div> '\n");
      out.write("\t\t\t\t\t}else{\n");
      out.write("\t\t\t\t\t\tfor(var i = 0;  i < data.lenth(); i++){\n");
      out.write("\t\t\t\t\t\t\tuserHTML = 'div class=\"user\">';\n");
      out.write("\t\t\t\t\t\t\tuserHTML = '<div style=\"display:none\" name=\"user_no\">'+data.getUser_no()+'</div>';\n");
      out.write("\t\t\t\t\t\t\tuserHTML = '<div class=\"thumb_img\"> <img src=\"../resourceImg/'+data.getUser_folder_name()+'/'+data.getUser_profile_name()+'\"/></div>';\n");
      out.write("\t\t\t\t\t\t\tuserHTML = data.getReg_id()+'</div>';\t\n");
      out.write("\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t$(\"#scroll_inner\").html(userHTML);\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t});\n");
      out.write("\t\t}\n");
      out.write("\t</script>\n");
      out.write("\t<section id=\"main_container\">\n");
      out.write("\t\t<div class=\"inner\">\n");
      out.write("\t\t");
 for(ImageDTO userInfo : rList) { 
      out.write("\n");
      out.write("            <div class=\"contents_box\">\n");
      out.write("                <article class=\"contents\" id=\"contents\">\n");
      out.write("                    <header class=\"top\">\n");
      out.write("                        <div class=\"user_container\">\n");
      out.write("                            <div class=\"profile_img\">\n");
      out.write("                                <img src=\"../resourceImg/imgs/thumb.jpeg\" alt=\"프로필이미지\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"user_name\">\n");
      out.write("                            \t<div class=\"board_number\" name=\"img_no\" id=\"img_no\" style=\"display:none\"> ");
      out.print(userInfo.getImage_no() );
      out.write("</div>\n");
      out.write("                                <div class=\"nick_name m_text\" name=\"user_id\"> ");
      out.print(userInfo.getReg_id());
      out.write("</div>\n");
      out.write("                                <div class=\"country s_text\" name=\"LastEdit_DT\">");
      out.print(userInfo.getChg_dt() );
      out.write("</div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"sprite_more_icon\" data-name=\"more\">\n");
      out.write("                            <ul class=\"toggle_box\">\n");
      out.write("                               <li><input type=\"submit\" class=\"follow\" value=\"팔로우\" data-name=\"follow\"></li>\n");
      out.write("                               <li>수정</li>\n");
      out.write("                               <li>삭제</li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                 </header>\n");
      out.write("                  <div class=\"img_section\">\n");
      out.write("                    <div class=\"trans_inner\">\n");
      out.write("                            <div><img src=\"../resourceImg/Image/");
      out.print(userInfo.getSave_folder_name() );
      out.write('/');
      out.print(userInfo.getSave_file_name() );
      out.write("\" alt=\"visual01\"></div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"bottom_icons\">\n");
      out.write("                        <div class=\"left_icons\">\n");
      out.write("                            <div class=\"heart_btn\">\n");
      out.write("                                <div class=\"sprite_heart_icon_outline\" name=\"39\" data-name=\"heartbeat\" onclick=\"location.href='image/LikeCnt.do'\"></div>\n");
      out.write("                            </div>                            \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\t\t\t\t\t<div class=\"likes m_text\">\n");
      out.write("                        좋아요\n");
      out.write("                        <span id=\"like-count-39\">");
      out.print(userInfo.getLike_cnt());
      out.write("</span> <span id=\"bookmark-count-39\"></span>\n");
      out.write("                        개\n");
      out.write("                    </div>\n");
      out.write("\t\t\t\t\t<div class=\"comment_container\">\n");
      out.write("                        <div class=\"comment\" id=\"comment-list-ajax-post37\">\n");
      out.write("                            <div class=\"comment-detail\">\n");
      out.write("                                <div class=\"nick_name m_text\" name=\"user_id\" ></div>\n");
      out.write("                                <div><h1>");
      out.print(userInfo.getOne_title() );
      out.write("</h1></div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <input type=\"hidden\" id=\"page\" value=\"1\">\n");
      out.write("\t\t\t\t</article>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\t\t");

     }

      out.write("\n");
      out.write("\t\t</div>\n");
      out.write("\t</section>\n");
      out.write("</section>\n");
      out.write("</body>\n");
      out.write("<script>\n");
      out.write("\t\tfunction search() {\n");
      out.write("\t\t\t//alert(\"test\");\n");
      out.write("\t\t\tvar img_no = $('#img_no').val();\n");
      out.write("\t\t\t//alert(\"제목 : \" + post_title);\n");
      out.write("\t\t\tif ($('#img_no').val() == \"\") {\n");
      out.write("\t\t\t\t$('#img_no').focus();\n");
      out.write("\t\t\t\treturn false;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\n");
      out.write("\t\t\tconsole.log(\"img_no : \" + img_no);\n");
      out.write("\t\n");
      out.write("\t\t\t$.ajax({\n");
      out.write("\t\t\t\turl : '/image/searchList.do', // 내가 설정한 controller의 url로 이동함 \n");
      out.write("\t\t\t\ttype : 'post',\n");
      out.write("\t\t\t\tdata : {\n");
      out.write("\t\t\t\t\t\"img_no\" : img_no\n");
      out.write("\t\t\t\t},\n");
      out.write("\t\t\t\tsuccess : function(data) {\n");
      out.write("\t\t\t\t\tconsole.log(\"test\");\n");
      out.write("\t\t\t\t\tconsole.log(data);\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\tvar resHTML = \"\"; // 게시판 정보 들고오기\n");
      out.write("\t\t\t\t\tresHTML += '<div class=\"board_number\" name=\"img_no\" id=\"img_no\" style=\"display:none\">'+ data.getImage_no() + '</div>';\n");
      out.write("\t\t\t\t\tresHTML += '<div class=\"nick_name m_text\" name=\"user_id\">'+ data.getReg_id() + '</div>';\n");
      out.write("\t\t\t\t\tresHTML += '<div class=\"country s_text\" name=\"LastEdit_DT\">'+ data.getChg_dt() + '</div>';\n");
      out.write("\t\t\t\t\tresHTML += '<div><img src=\"/../resourceImg/Image/' + data.getSave_folder_name() + '/' + data.getSave_file_name() +'\" alt=\"visual01\"></div>';\n");
      out.write("\t\t\t\t\tresHTML += '<div class=\"likes m_text\"> 좋아요 <span id=\"like-count-39\">' + userInfo.getLike_cnt() +'</span> <span id=\"bookmark-count-39\"></span> 개 </div>';\n");
      out.write("\t\t\t\t\tresHTML += '<div class=\"comment_container\"><div class=\"comment\" id=\"comment-list-ajax-post37\"><div class=\"comment-detail\"><div class=\"nick_name m_text\" name=\"user_id\" ></div><div><h1>' +data.getOne_title()+'</h1></div></div></div></div>';\n");
      out.write("\t\t\n");
      out.write("\t\t\t\t\tif (data.length == 0) {\n");
      out.write("\t\t\n");
      out.write("\t\t\t\t\t\tresHTML += '<div class=\"board_number\" name=\"img_no\" id=\"img_no\" style=\"display:none\"></div>';\n");
      out.write("\t\t\t\t\t\tresHTML += '<div class=\"nick_name m_text\" name=\"user_id\"></div>';\n");
      out.write("\t\t\t\t\t\tresHTML += '<div class=\"country s_text\" name=\"LastEdit_DT\"></div>';\n");
      out.write("\t\t\t\t\t\tresHTML += '<div><img src=\"../resourceImg/imgs/thumb.jepg\" alt=\"visual01\"></div>';\n");
      out.write("\t\t\t\t\t\tresHTML += '<div class=\"likes m_text\"> 좋아요 <span id=\"like-count-39\"></span> <span id=\"bookmark-count-39\"></span> 개 </div>';\n");
      out.write("\t\t\t\t\t\tresHTML += '<div class=\"comment_container\"><div class=\"comment\" id=\"comment-list-ajax-post37\"><div class=\"comment-detail\"><div class=\"nick_name m_text\" name=\"user_id\" ></div><div><h1></h1></div></div></div></div>';\n");
      out.write("\t\t\t\t\t\tuserHTML = '<div style=\"display:none\" name=\"user_no\"></div>';\n");
      out.write("\t\t\t\t\t\tuserHTML = '<div class=\"thumb_img\"> <img src=\"../resourceImg/imgs/thumb.jpeg\"/></div>';\n");
      out.write("\t\t\t\t\t\tuserHTML = '</div> </div> </div>';\n");
      out.write("\t\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t\t\t\t} else {\n");
      out.write("\t\t\n");
      out.write("\t\t\t\t\t\tfor (var i = 0; i < data.length; i++) {\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\tresHTML += '<div class=\"board_number\" name=\"img_no\" id=\"img_no\" style=\"display:none\">'+ data.getImage_no() + '</div>';\n");
      out.write("\t\t\t\t\t\t\tresHTML += '<div class=\"nick_name m_text\" name=\"user_id\">'+ data.getReg_id() + '</div>';\n");
      out.write("\t\t\t\t\t\t\tresHTML += '<div class=\"country s_text\" name=\"LastEdit_DT\">'+ data.getChg_dt() + '</div>';\n");
      out.write("\t\t\t\t\t\t\tresHTML += '<div><img src=\"/../resourceImg/Image/' + data.getSave_folder_name() + '/' + data.getSave_file_name() +'\" alt=\"visual01\"></div>';\n");
      out.write("\t\t\t\t\t\t\tresHTML += '<div class=\"likes m_text\"> 좋아요 <span id=\"like-count-39\">' + userInfo.getLike_cnt() +'</span> <span id=\"bookmark-count-39\"></span> 개 </div>';\n");
      out.write("\t\t\t\t\t\t\tresHTML += '<div class=\"comment_container\"><div class=\"comment\" id=\"comment-list-ajax-post37\"><div class=\"comment-detail\"><div class=\"nick_name m_text\" name=\"user_id\" ></div><div><h1>' +data.getOne_title()+'</h1></div></div></div></div>';\n");
      out.write("\t\t\t\t\t\t\tuserHTML = '<div class=\"scroll_inner\"><div class=\"user\">';\n");
      out.write("\t\t\t\t\t\t\tuserHTML = '<div class=\"thumb_img\"> <img src=\"../resourceImg/imgs/thumb.jpeg\"/></div>';\n");
      out.write("\t\t\t\t\t\t\tuserHTML = data.getReg_id()+'</div> </div> </div>';\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t// 게시판의 대한 정보 들고오기 \n");
      out.write("\t\t\t\t\t$(\"#contents\").html(resHTML); // 설정된 div, span, selection 등의 contents id값 밑으로 html을 생성한다. \n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t}\n");
      out.write("\t\t});\n");
      out.write("\t}\n");
      out.write("\t\t\n");
      out.write("</script>\n");
      out.write("\n");
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
