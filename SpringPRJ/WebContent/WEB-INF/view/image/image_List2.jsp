<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="poly.dto.ImageDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%
	String SS_USER_ID = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));

	List<ImageDTO> rList = (List<ImageDTO>)request.getAttribute("rList");
	
%>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Image_Borad</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resource/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">Circle</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Challenge</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">MyPage</a></li>
                        <!-- circle page Move -->
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">Circle</a></li>
						<!--<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>-->
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="resource/assets/img/avataaars.svg" alt="..." />
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">Circle Challenge</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">COVID_19 타파! - 동네 한바퀴 - 인증</p>
            </div>
        </header>
        <!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Images</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items (Start Ajax for Images -->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <!-- Image for문 시작 -->
                    <% for(ImageDTO Ch_Image : rList) {  %>
                    <div class="col-md-6 col-lg-4 mb-5">
                    <input type="text" style="display:none" name="user_no" value="<%=Ch_Image.getImage_no() %>"/>
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="resource/assets/image/<%=Ch_Image.getSave_folder_name() %>/<%=Ch_Image.getSave_file_name() %>" alt="..." />
                        </div>
                    </div>
                    <% } %>
                    <!--for문 끝  -->
                </div>
                <script>
                	function search(){
                		var img_no = $('#img_no').val();
            			//alert("제목 : " + post_title);
            			if ($('#img_no').val() == "") {
            				$('#img_no').focus();
            				return false;
            			}
            			console.log("img_no : " + img_no);
            			
            			$.ajax({
            				url : '/image/searchList.do', // 내가 설정한 controller의 url로 이동함 
            				type : 'post',
            				data : {
            					"img_no" : img_no
            				},
            				success : function(data) {
            					console.log("test");
            					console.log(data);
            					
            					var resHTML = ""; // 게시판 정보 들고오기
            					resHTML = '<div class="col-md-6 col-lg-4 mb-5">';
            					resHTML = '<input type="text" style="display:none" name="user_no" value="'+data.getImage_no()+'"/>';
            					resHTML = '<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">';
            					resHTML = '<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">';
            					resHTML = '<div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>';
            					resHTML = '</div>';
            					resHTML = '<img class="img-fluid" src="resource/assets/image/'+data.getSave_folder_name() %> +'/'+data.getSave_file_name()+'" alt="..." /></div></div>';
                              
            					
            					if(data.length == 0){
            						resHTML = '<div class="col-md-6 col-lg-4 mb-5">';
            						resHTML = '<input type="text" style="display:none" name="user_no" value="'+data.getImage_no()+'"/>';
                					resHTML = '<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">';
                					resHTML = '<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">';
                					resHTML = '<div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>';
                					resHTML = '</div>';
                					resHTML = '<img class="img-fluid" src="resource/assets/img/portfolio/circus.png" alt="..." /></div></div>';
            					}
            					else {
            						
            						for(var i = 0; i <= data.length(); i++){
	            						resHTML = '<div class="col-md-6 col-lg-4 mb-5">';
	                					resHTML = '<input type="text" style="display:none" name="user_no" value="'+data.getImage_no()+'"/>';
	                					resHTML = '<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">';
	                					resHTML = '<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">';
	                					resHTML = '<div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>';
	                					resHTML = '</div>';
	                					resHTML = '<img class="img-fluid" src="resource/assets/image/'+data.getSave_folder_name() %> +'/'+data.getSave_file_name()+'" alt="..." /></div></div>';
            						}
            						$(".col-md-6 col-lg-4 mb-5").html(resHTML); // contents밑으로 resHTML을 생성한다. 
            					}
            				}
            			});
                }
                </script>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Producer</h4>
                        <p class="lead mb-0">
                            2021 Solo Project
                            <br />
                            JiMin
                            <br>
                            <p>Email : hua4187@naver.com</p>
                            <p>Portfolio : <a href="https://rogue-chemistry-170.notion.site/Jr-bf825b49021843cd85f3bd2029a56552">https://rogue-chemistry-170.notion.site/Jr-bf825b49021843cd85f3bd2029a56552</a></p>
                    </div>
                   <!-- Footer Social Icons-->
<!--                    <div class="col-lg-4 mb-5 mb-lg-0">-->
<!--                        <h4 class="text-uppercase mb-4">Around the Web</h4>-->
<!--                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>-->
<!--                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>-->
<!--                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>-->
<!--                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>-->
<!--                    </div>-->
                    <!-- Footer About Text-->
                </div>
            </div>
        </footer>

        <!-- Portfolio Modal 1 ( Start for Image_Title, Images, Image_Context-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
            <div class="modal-dialog modal-xl">
            <% for(ImageDTO Detail_Image : rList) {%><!-- Detail Information 'for' Start -->
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                            <input type="text" style="display:none" name="user_no" value="<%=Detail_Image.getImage_no() %>"/>
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0"><%=Detail_Image.getOne_title() %></h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="resource/assets/image/<%=Detail_Image.getSave_folder_name() %>/<%=Detail_Image.getSave_file_name() %>" alt="..." />
                                    
                                    <button class="btn btn-primary" href="#!" data-bs-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %><!-- Detail Information 'for' End -->
            </div>
        </div>
        <script>
        	function Detail(){
        		var img_no = $('#img_no').val();
    			//alert("제목 : " + post_title);
    			if ($('#img_no').val() == "") {
    				$('#img_no').focus();
    				return false;
    			}
    			console.log("img_no : " + img_no);
    			
    			$.ajax({
    				url : '/image/searchList.do', // 내가 설정한 controller의 url로 이동함 
    				type : 'post',
    				data : {
    					"img_no" : img_no
    				},
    				success : function(data) {
    					console.log("test");
    					console.log(data);
    					
    					var detailHTML = "";
    					detailHTML = '<div class="container"><div class="row justify-content-center">';
    					detailHTML = '<input type="text" style="display:none" name="user_no" value="'+data.getImage_no()+'"/>';
    					detailHTML = '<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">'+data.getOne_title()+'</h2>';
    					detailHTML = '<div class="divider-custom"><div class="divider-custom-line"></div><div class="divider-custom-icon"><i class="fas fa-star"></i></div><div class="divider-custom-line"></div></div>';
    					detailHTML = '<img class="img-fluid rounded mb-5" src="resource/assets/image/'+data.getSave_folder_name() %>+'/'+data.getSave_file_name()+'" alt="..." />';
    					
    					if(data.length == 0){
    						
    						detailHTML = '<div class="container"><div class="row justify-content-center">';
        					detailHTML = '<input type="text" style="display:none" name="user_no" value=""/>';
        					detailHTML = '<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Not Title</h2>';
        					detailHTML = '<div class="divider-custom"><div class="divider-custom-line"></div><div class="divider-custom-icon"><i class="fas fa-star"></i></div><div class="divider-custom-line"></div></div>';
        					detailHTML = '<img class="img-fluid rounded mb-5" src="resource/assets/img/portfolio/circus.png" alt="..." />';
    					
    					}else{
    						for(var i = 0; i <= data.length; i++){
	    						detailHTML = '<div class="container"><div class="row justify-content-center">';
	        					detailHTML = '<input type="text" style="display:none" name="user_no" value="'+data.getImage_no()+'"/>';
	        					detailHTML = '<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">'+data.getOne_title()+'</h2>';
	        					detailHTML = '<div class="divider-custom"><div class="divider-custom-line"></div><div class="divider-custom-icon"><i class="fas fa-star"></i></div><div class="divider-custom-line"></div></div>';
	        					detailHTML = '<img class="img-fluid rounded mb-5" src="resource/assets/image/'+data.getSave_folder_name() %>+'/'+data.getSave_file_name()+'" alt="..." />';
    						}
    						
    						$(".modal-content").html(detailHTML);
    					}
    				}
    			});
        	}
        </script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>

</html>