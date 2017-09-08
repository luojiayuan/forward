<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/jquery.fullPage.css" />
    <!--竖屏切换css-->
    <link rel="stylesheet" href="css/index.css" />
    <script type="text/javascript" src="js/lib/jquery.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.form.js"></script>
    <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.fullPage.js"></script>
    <!--竖屏切换js-->
    <script type="text/javascript" src="js/index.js"></script>
    <script src="../js/show-detect.js"></script>
    <script src="../js/show-verify.js"></script>
    <script src="../js/show-search.js"></script>
</head>

<body>
<div id="fullpage">

    <!--第一屏(主页)-->
    <div class="section" id="section1">
        <div class="container-fluid fluid_one">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#target-menu">
                        <span class="sr-only"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-brand"><img src="img/index/one/logo.png"></div>
                </div>
                <div class="collapse navbar-collapse navbar-right" id="target-menu">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#">主页</a>
                        </li>
                        <li class="class-dropdown">
                            <a href="#" class="dropdown-toggle click_css" data-toggle="dropdown">核心技术<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="click_css" href="#page2">人脸检测</a>
                                </li>
                                <li>
                                    <a class="click_css" href="#page3">人脸对比</a>
                                </li>
                                <li>
                                    <a class="click_css" href="#page4">人脸搜索</a>
                                </li>
                                <li>
                                    <a class="click_css" href="#page5">人脸属性</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="click_css" href="#page6">联系我们</a>
                        </li>
                        <li>
                            <a class="click_css" href="/customer/register">注册</a>
                        </li>
                        <li>
                            <a class="click_css" href="/customer/login">登录</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="text-img">
                <img class="img-responsive center-block" src="img/index/one/text_img.png" />
            </div>
            <div class="prospect">
                <img class="img-responsive center-block" src="img/index/one/prospect.png" />
            </div>
        </div>
    </div>
    <!--第二屏(人脸检测)-->
    <div class="section">
        <div class="container-fluid fluid_two" id="fluid_two">
            <!--右侧倒三角背景以及文字-->
            <div class="title_bg2">
                <img class="img-responsive center-block" src="img/index/two/title_img1.png" />
                <div class="title_text2">人脸检测</div>
                <div class="introduce_text2">检测并定位图片中的人脸，返回<br/>高精度的人脸<br/>框坐标。</div>
            </div>
            <div class="formal_box2">
                <div class="left_formal2">
                    <!--左侧代码框-->
                    <div class="code_box2">
                        <div class="code_title2">
                            <span><img class="code_img2" src="img/index/two/icon-bottom.png"></span>&nbsp;&nbsp;Response JSON
                        </div>
                        <div class="code_text2">
									<textarea id="responseDetect" disabled="disabled">

                                    </textarea>
                        </div>
                    </div>
                    <!--左侧人脸属性框-->
                    <div class="attribute_box2">
                        <div class="attribute_title2">
                            <span><img class="attribute_img2" src="http://192.168.10.212:8080/img/index/two/icon-right.png"></span>&nbsp;&nbsp;人脸属性
                        </div>
                        <div class="attribute_text2"></div>
                    </div>
                </div>
                <div class="middle_formal2">
                    <div class="select_box2">
                        <div class="select_text2">请勾选您需要展示的属性:</div>
                        <form>
                            <label>
                                <div class="checkbox_box2"><img class="checkbox_img2" src="img/index/two/no.png"/></div>
                                <input name="attribute" value="age" class="attribute2" type="checkbox" />
                                年龄
                            </label>
                            <label>
                                <div class="checkbox_box2"><img class="checkbox_img2" src="img/index/two/no.png"/></div>
                                <input name="attribute" value="gender" class="attribute2" type="checkbox" />
                                性别
                            </label>
                            <label>
                                <div class="checkbox_box2"><img class="checkbox_img2" src="img/index/two/no.png"/></div>
                                <input name="attribute" value="emotions" class="attribute2" type="checkbox" />
                                情绪
                            </label>
                        </form>
                    </div>
                    <div class="maximg_box2">
                        <div class="img_bgbox2" reveal_sign="width">
                            <div  class="detect_img2">
                                <div id="imgShowDetectDiv" style="position: relative;height: 100%;width: 100%;border: 1px black solid">
                                <img id="imgShowDetect" src="http://192.168.10.212:8080/images/1.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right_formal2">
                    <div class="bottom_left_f2">
                        <div class="upload2-1">
                            <%--<div><button id="testBtn" onclick="testBtnEvent()">testBtn</button></div>--%>
                            <div class="upload_btn2">
                                本地上传
                                <input accept="image/png,image/jpeg" onchange="uploadPicDetect(this)" class="upload_file2" type="file" value="本地上传">
                            </div>
                        </div>
                        <div class="upload2-2">
                            <div class="upload_text2">
                                <input id="inputUrlDetect"  class="upload_mintext2"  type="text" placeholder="请输入图片URL"/>
                                <div class="detect_btn2"  onclick="detectUrl()" id="checkInputUrlDetect" >检测</div>
                            </div>
                        </div>
                        <div class="upload2-3">
                            <div class="upload2-3img">
                                <div id="" class="detect_fiveimg2" reveal_sign="width"><img onclick="detectReq(this.src)" class="img_active" src="http://192.168.10.212:8080/images/1.jpg"></div>
                                <div class="detect_fiveimg2" reveal_sign="width"><img onclick="detectReq(this.src)"src="http://192.168.10.212:8080/img/index/two/max_img2.png"></div>
                                <div class="detect_fiveimg2" reveal_sign="width"><img onclick="detectReq(this.src)" src="http://192.168.10.212:8080/img/index/two/max_img3.png"></div>
                                <div class="detect_fiveimg2" reveal_sign="width"><img onclick="detectReq(this.src)" src="http://192.168.10.212:8080/img/index/two/max_img4.png"></div>
                                <div class="detect_fiveimg2" reveal_sign="width"><img onclick="detectReq(this.src)" src="http://192.168.10.212:8080/img/index/two/max_img5.png"></div>
                                <br style="clear:both;"/><!--清除浮动-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--第三屏(人脸对比)-->
    <div class="section">
        <div class="container-fluid fluid_three">
            <!--左侧倒三角背景以及文字-->
            <div class="title_bg3">
                <img class="img-responsive center-block" src="img/index/three/title_img2.png">
                <div class="title_text3">人脸对比</div>
                <div class="introduce_text3">分析两张人脸属<br/>于同一个人的<br/>可能性大小</div>
            </div>
            <div class="formal_box3">
                <div class="left_formal3">
                    <!--左侧代码框-->
                    <div class="code_box3">
                        <div class="code_title3">
                            <span><img class="code_img3" src="img/index/two/icon-right.png"></span>&nbsp;&nbsp;Response JSON
                        </div>
                        <div class="code_text3">
										<textarea id="reponseVerify" disabled="disabled">{
	  "image_id": "O2alrpeRIXFejHWe6WlRqw==",
	  "request_id": "1504752872,78700459-3630-4cbb-9e2b-f23404a6df16",
	  "time_used": 875,
	  "faces": [
	    {
	      "landmark": {
	        "mouth_upper_lip_left_contour2": {
	          "y": 489,
	          "x": 519
	        },
	        "mouth_upper_lip_top": {
	          "y": 484,
	          "x": 527
	        },
	        "mouth_upper_lip_left_contour1": {
	          "y": 483,
	          "x": 521
	        },
	        "left_eye_upper_left_quarter": {
	          "y": 408,
	          "x": 511
	        },
	        "left_eyebrow_lower_middle": {
	          "y": 395,
	          "x": 512
	        },
	        "mouth_upper_lip_left_contour3": {
	          "y": 494,
	          "x": 524
	        },
	        "left_eyebrow_lower_left_quarter": {
	          "y": 394,
	          "x": 505
	        },</textarea>
                        </div>
                    </div>
                    <!--左侧人脸属性框-->
                    <div class="attribute_box3">
                        <div class="attribute_title3">
                            <span><img class="attribute_img3" src="img/index/two/icon-bottom.png"></span>&nbsp;&nbsp;比对结果
                        </div>
                        <div id="resultVerify"  class="attribute_text3">

                        </div>
                    </div>
                </div>
                <!--右侧人脸对比演示-->
                <div class="middle_formal3">
                    <!--左侧图片上传区-->
                    <div class="results_gightimg3">
                        <div class="results_maxbox3" reveal_sign="width">
                            <div class="results_maximg3" reveal_sign="width">
                                <div id="picDiv1" style="position: relative;height: 100%;width: 100%;border: 1px black solid">
                                    <img id="imgShow1" class="showcasing_img3" src="http://192.168.10.212:8080/img/index/two/max_img5.png">
                                </div>
                            </div>
                        </div>
                        <div class="upload_box3">

                            <div class="contrast_btn3">
                                本地上传
                                <input onchange="uploadPicVerify(this,1)" class="contrast_file3" type="file" value="本地上传">
                            </div>
                            <div class="upload_text3">
                                <input class="upload_mintext3" id="inputUrl1"  type="text" placeholder="请输入图片URL"/>
                                <div class="detect_btn3" onclick="verifyUrl(1)">检测</div>
                            </div>
                            <div class="detect_minimg3">
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,1)" src="http://192.168.10.212:8080/img/index/two/max_img1.png"></div>
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,1)" src="http://192.168.10.212:8080/img/index/two/max_img2.png"></div>
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,1)" src="http://192.168.10.212:8080/img/index/two/max_img3.png"></div>
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,1)" src="http://192.168.10.212:8080/img/index/two/max_img4.png"></div>
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,1)" class="img_active"  src="http://192.168.10.212:8080/img/index/two/max_img5.png"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right_formal3">
                    <!--右侧图片上传区-->
                    <div class="results_gightimg3">
                        <div class="results_maxbox3" reveal_sign="width">
                            <div class="results_maximg3" reveal_sign="width">
                                <div id="picDiv2" style="position: relative;height: 100%;width: 100%;border: 1px black solid">
                                    <img id="imgShow2" class="showcasing_img3" src="http://192.168.10.212:8080/img/index/two/max_img5.png">
                                </div>
                                <%--<img class="showcasing_img3" src="img/index/two/max_img5.png" />--%>
                            </div>
                        </div>
                        <div class="upload_box3">
                            <div class="contrast_btn3">
                                本地上传
                                <input onchange="uploadPicVerify(this,2)" class="contrast_file3" type="file" value="本地上传">
                            </div>
                            <div class="upload_text3">
                                <input class="upload_mintext3" id="inputUrl2" type="text" placeholder="请输入图片URL"/>
                                <div class="detect_btn3"  onclick="verifyUrl(2)">检测</div>
                            </div>
                            <div class="detect_minimg3">
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,2)" src="http://192.168.10.212:8080/img/index/two/max_img1.png"></div>
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,2)" src="http://192.168.10.212:8080/img/index/two/max_img2.png"></div>
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,2)" src="http://192.168.10.212:8080/img/index/two/max_img3.png"></div>
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,2)" src="http://192.168.10.212:8080/img/index/two/max_img4.png"></div>
                                <div class="detect_fiveimg3" reveal_sign="width"><img onclick="verifyReq(this,2)" class="img_active" src="http://192.168.10.212:8080/img/index/two/max_img5.png"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--第四屏(人脸搜索)-->
    <div class="section">
        <div class="container-fluid fluid_four">
            <!--顶部倒三角背景以及文字-->
            <div class="title_bg4">
                <img class="img-responsive center-block" src="img/index/four/title_img3.png" />
                <div class="title_text4">人脸搜索</div>
                <div class="introduce_text4">针对一个新的人脸，在一个已有的人脸<br/>集合中搜索相似的人脸。</div>
            </div>
            <div class="formal_box4">
                <div class="left_formal4">
                    <!--左侧搜索框-->
                    <div class="results_gightimg4">
                        <div class="results_maxbox4" reveal_sign="width">
                            <div id="imgShowSearchDemoDiv" class="results_maximg4">
                                <img id="imgShowSearchDemo" class="showcasing_img4" src="img/index/two/max_img2.png" />
                            </div>
                        </div>
                        <div class="contrast_btn4">
                            本地上传
                            <input class="contrast_file4" onchange="uploadImgSearcheDemo(this)" type="file" value="本地上传">
                        </div>
                        <div class="upload_text4">
                            <input class="upload_mintext4" id="inputUrlSearchDemo" type="text" placeholder="请输入图片URL"/>
                            <div onclick="searchUrlDemo(this)" class="detect_btn4">检测</div>
                        </div>
                        <div class="detect_minimg4">
                            <div class="detect_fiveimg4"><img onclick="searchReqDemo(this)" src="http://192.168.10.212:8080/img/index/two/max_img1.png"></div>
                            <div class="detect_fiveimg4"><img onclick="searchReqDemo(this)" class="img_active" src="http://192.168.10.212:8080/img/index/two/max_img2.png"></div>
                            <div class="detect_fiveimg4"><img onclick="searchReqDemo(this)" src="http://192.168.10.212:8080/img/index/two/max_img3.png"></div>
                            <div class="detect_fiveimg4"><img onclick="searchReqDemo(this)" src="http://192.168.10.212:8080/img/index/two/max_img4.png"></div>
                            <div class="detect_fiveimg4"><img onclick="searchReqDemo(this)" src="http://192.168.10.212:8080/img/index/two/max_img5.png"></div>
                        </div>
                    </div>
                </div>
                <div class="middle_formal4">
                    <!--中间搜索结果-->
                    <!--左侧结果图片-->
                    <div class="code_box4">
                        <div class="code_title4">
                            &nbsp;&nbsp;搜索结果
                        </div>
                        <div id="resultShowSearchDemo" class="code_text4">
                            <%--<div class="results_graphic4">--%>
                                <%--<div class="graphic_img4" reveal_sign="width"><img src="img/index/four/results_img1.png"></div>--%>
                                <%--<div class="graphic_text">结果1</div>--%>
                            <%--</div>--%>
                            <%--<div class="results_graphic4">--%>
                                <%--<div class="graphic_img4" reveal_sign="width"><img src="img/index/four/results_img2.png"></div>--%>
                                <%--<div class="graphic_text">结果2</div>--%>
                            <%--</div>--%>
                            <%--<div class="results_graphic4">--%>
                                <%--<div class="graphic_img4" reveal_sign="width"><img src="img/index/four/results_img3.png"></div>--%>
                                <%--<div class="graphic_text">结果3</div>--%>
                            <%--</div>--%>
                            <%--<div class="results_graphic4">--%>
                                <%--<div class="graphic_img4" reveal_sign="width"><img src="img/index/four/results_img4.png"></div>--%>
                                <%--<div class="graphic_text">结果4</div>--%>
                            <%--</div>--%>
                            <%--<div class="results_graphic4">--%>
                                <%--<div class="graphic_img4" reveal_sign="width"><img src="img/index/four/results_img5.png"></div>--%>
                                <%--<div class="graphic_text">结果5</div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <!--左侧结果文字-->
                    <div class="results_box4">
                        <div class="results_title4">
                            &nbsp;&nbsp;搜索结果
                        </div>
                        <div id="searchResultDemo" class="results_text4">
                            <%--<p>结果1：是同一个人可能性很高</p>--%>
                            <%--<p>结果2：是同一个人可能性高</p>--%>
                            <%--<p>结果3：是同一个人可能性低</p>--%>
                            <%--<p>结果4：是同一个人可能性低</p>--%>
                            <%--<p>结果5：是同一个人可能性低</p>--%>
                        </div>
                    </div>
                </div>
                <div class="right_formal4">
                    <!--右边代码展示-->
                    <div class="results_gightimg4_2">
                        <!--上边代码框-->
                        <div class="code_box4_2">
                            <div class="code_title4">
                                <span><img class="code_img4" src="img/index/two/icon-bottom.png"></span>&nbsp;&nbsp;Response JSON
                            </div>
                            <div class="code_text4-2">
									<textarea id="reponseSearchDemo" disabled="disabled">

        							</textarea>
                            </div>
                        </div>
                        <!--下边图片集合框-->
                        <div class="attribute_box4">
                            <div class="attribute_title4">
                                <span><img class="attribute_img4" src="img/index/two/icon-right.png"></span>&nbsp;&nbsp;管理您的人脸图片集合
                            </div>
                            <div class="attribute_text4">
                                请先<a href="/customer/login">登录</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>
    <!--第六屏(联系我们)-->
    <div class="section">
        <div class="container-fluid fluid_six">555555555</div>
    </div>

</div>
</body>

</html>