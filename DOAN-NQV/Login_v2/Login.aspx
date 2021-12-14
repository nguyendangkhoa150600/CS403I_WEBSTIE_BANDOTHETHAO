<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.fLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>VKSPORTS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


      <%-- MP--%>
    
   
   
  
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
   
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 

  

    <%-- MP--%>
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link href="css/login.css" rel="stylesheet"   type="text/css"/>
    <!--===============================================================================================-->
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            display: block;
            position: relative;
            z-index: 1;
            border-radius: 25px;
            overflow: hidden;
            margin: 0 auto;
            left: 0px;
            top: 0px;
        }
    </style>
</head>
<body>


     <%--  PHẦN MỞ ĐẦU--%>


       <%-- TOP1--%>
        <div class="topmenup">

    <nav class="navbar navbar-expand-sm fixed-top menutopp">
     
                <%-- <div class="lh" style="font-size: 19px;color: whitesmoke;">Liên hệ</div>
                    <div class="lh2">:0931 936 079</div>--%>
           
          <a class="navbar-brand" href="#" style="  padding-right: 840px;color:whitesmoke;">Liên hệ:<span style="color:#f64c72;padding-left:5px;" >0931 936 079</span></a>
 
  


      <div class="collapse navbar-collapse" id="">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0 ">

            

          <li class="nav-item ">
            <a class="nav-link menu2" href="#" style="padding-right: 5px;">Giới thiệu <span
                class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link menu2" href="../Login_v2/Signup.aspx" style="padding-right: 5px;">Đăng Ký</a>
          </li>
          <li class="nav-item">
            <a class="nav-link menu2" href="../Login_v2/Login.aspx">Đăng nhập</a>
          </li>


       


        </ul>

      </div>


    </nav>
            
  </div>
<%-- TOP1--%>
      <%--TOP2--%>

        <div class="topmenu">
    <nav class="navbar navbar-expand-sm fixed-top menutop">
      <a class="gt"  href="../USER/DSSP.aspx" style="text-decoration:none; font-size: 45px;">VKSPORTS</a>
      <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
        aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse task" id="collapsibleNavId">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0 text1">
          <li class="nav-item active">
            <a class="nav-link menu1" href="../USER/DSSP.aspx">Trang Chủ<span class="sr-only">(current)</span></a>
          </li>


          <li class="nav-item ">
            <a class="nav-link menu1 1 " href="#">Áo đấu câu lạc bộ </a>

          </li>
          <li class="nav-item ">
            <a class="nav-link menu1  2" href="#">Thiết bị tập</a>

          </li>
          <li class="nav-item ">
            <a class="nav-link menu1 3 " href="#">Giày thể thao nam</a>

          </li>
          <li class="nav-item ">
            <a class="nav-link menu1 4 " href="#">Áo khoác </a>

          </li>



        </ul>

      </div>
    </nav>
    
  </div>


        <%--TOP2--%>

    <%--  PHẦN MỞ ĐẦU--%>














    <%--PHẦN ĐĂNG NHẬP--%>


    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <form class="login100-form validate-form" runat="server">
                    <span class="login100-form-title p-b-26">Đăng Nhập
                    </span>
                     

                    <div class="wrap-input100 validate-input" data-validate="Valid email is: a@b.c">
                        <input class="input100" type="text" name="email" id="gmail" runat="server">
                        <span class="focus-input100" data-placeholder="Email"></span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập Email" style="float:right;" ForeColor="Red" ControlToValidate="gmail"></asp:RequiredFieldValidator>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
                        <span class="btn-show-pass">
                            <i class="zmdi zmdi-eye"></i>
                        </span>
                        <input class="input100" type="password" name="pass" id="pass" runat="server">
                        <span class="focus-input100" data-placeholder="Password"></span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập mật khẩu" style="float:right;" ForeColor="Red" ControlToValidate="pass"></asp:RequiredFieldValidator>

                    </div>
                
           
                        <asp:Image ID="imcap" runat="server" />
                            <asp:LinkButton ID="lpca" runat="server" OnClick="lpca_Click" class="fas fa-sync" style="margin-left:250px;font-size:20px;color:#0099FF	"></asp:LinkButton>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập mã Captcha" style="float:right;" ForeColor="Red" ControlToValidate="txtcap"></asp:RequiredFieldValidator>

                             <asp:TextBox ID="txtcap" runat="server" class="captcha" placeholder="Captcha"></asp:TextBox>
                                 <asp:Label ID="lbc" runat="server" Text="Label" Visible="false" style="color:red;text-align:center;"></asp:Label>
                            
                     

            
                    <span>
                        <asp:Label ID="Label1" runat="server" Text="" style="margin-top:50px;"></asp:Label>
                    </span>
                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn" onserverclick="btnLogin_Click" runat="server" id="btnLogin" >
                                Đăng Nhập
                            </button>
                        </div>
                    </div>

                    <div class="text-center p-t-115" style="margin-top:-80px;">
                        <span class="txt1">Chưa Có Tài Khoản?
                        </span>

                        <a class="txt2" href="Signup.aspx">Đăng Ký
                        </a>
                        <br />
                        <a class="txt2" href="QMK.aspx">Quên mật khẩu
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div id="dropDownSelect1"></div>


    <%--PHẦN ĐĂNG NHẬP-%>    












    
       <%--PHẦN CUỐI--%>

<!-- Footer -->
<footer class="bg-dark">
 
    <div class="phancuoi">
        <div class="container">
          <h1 style="text-align: center;font-size: 40px;color:#f64c72;border-top: solid 2px  #222222;">VKSports</h1>
          <div class="row">
            <div class="col-md-4">

              <h3>Giới thiệu:</h3>
              <p0 style="font-size: 16px;">Thương hiệu quần áo, dụng cụ thể thao VKSports tự hào giới
                thiệu và phục
                vụ đến mọi đối tượng khách hàng. Sự tôn trọng đối với mọi người
                (khách hàng, nhân viên, nhà cung cấp)
                là kim chỉ nam trong kinh doanh của chúng tôi,
                chúng tôi mong muốn củng cố các mối quan hệ đối tác lâu dài.</p0>


            </div>
            <div class="col-md-4">

              <h3>Hỗ trợ khách hàng:</h3>
              <p class="c">Chính sách đổi trả </p>
              <p class="c">Chính sách giao hàng</p>
              <p class="c">Chính sách vận chuyển</p>
              <p class="c">Chính sách khuyến mãi</p>

            </div>

            <div class="col-md-4">

              <h3>Liên Hệ:</h3>
              <p>Địa Chỉ shop:55 Thái Phiên,Tam Kỳ,Quảng Nam </p>
              <p><i class="fas fa-phone"></i>Hotline:0931.936.069-0903.565.020</p>
              <p><i class="fas fa-globe-americas"></i>website:VKSports.com</p>
              <p>Tài khoản: </p>
              <div class="icon"><i class="fab fa-facebook" 
                  <link href="https://www.facebook.com/profile.php?id=100026217303860"> </i> <i
                  class="fab fa-twitter-square"></i> <i class="fab fa-google-plus"></i> <i
                  class="fab fa-youtube-square"></i></div>

            </div>


          </div>

        </div>
        </div>
    </footer>
    <!-- Footer -->

    <%--PHẦN CUỐI--%>

    <!--===============================================================================================-->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/daterangepicker/moment.min.js"></script>
    <script src="vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="js/main.js"></script>
</body>
</html>
