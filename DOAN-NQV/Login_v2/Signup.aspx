<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication1.Login_v2.Signup" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>VKSPORTS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   <%-- MP--%>
    
   
   
  
    <script src="../Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <script src="../Scripts/jquery-3.6.0.slim.js"></script>
    <script src="../Scripts/jquery-3.6.0.slim.min.js"></script>
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
    <link href="css/siginup.css" rel="stylesheet"  type="text/css" />

    <!--===============================================================================================-->
    <style type="text/css">
        .auto-style1 {
            width: 370px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
            -moz-box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
            -webkit-box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
            -o-box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
            -ms-box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 77px;
            padding-bottom: 33px;
            background: #fff;
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
       <a class="gt"  href="../USER/DSSP.aspx" style="text-decoration:none; color: #ffd400; font-size: 45px;">VKSPORTS</a>
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


    <%--PHAN DANGKY--%>
    <div class="limiter" style="margin-top:180px;margin-bottom:50px; padding:0 420px;">
                  <span class="login100-form-title">Đăng Ký
                    </span>
                    <form class="row g-3" runat="server" style="margin-top:20px;">
                   
                    
                  <div class="col-md-6">
                    <div class="tb" >
                          <asp:Label ID="tbemail"  style="color:red;padding-left:200px;position:absolute;margin-top:16px;" runat="server" Text="Label" Visible="false">EMAIL ĐÃ TỒN TẠI</asp:Label>
                     </div>
                    <div class="wrap-input100 validate-input" data-validate="Valid email is: a@b.c">
                        <input class="input100" type="text" name="email" runat="server" id="email">
                        <span class="focus-input100" data-placeholder="Email"></span>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  runat="server" ErrorMessage="chưa nhập email" style="float:right;" ForeColor="Red" ControlToValidate="email"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorGMAIL" runat="server" ControlToValidate="email"
                                ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                ForeColor="#ff3300"
                                ErrorMessage="Gmail không đúng định dạng" style="float:right;padding-left:20px;position:relative;font-size:18px;"></asp:RegularExpressionValidator>
                  </div>
                      </div>
                  <div class="col-md-6">
                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                        <span class="btn-show-pass">
                            <i class="zmdi zmdi-eye"></i>
                        </span>
                        <input class="input100" type="password" name="pass" runat="server" id="pass">
                        <span class="focus-input100" data-placeholder="Password"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ErrorMessage="chưa nhập mật khẩu" style="float:right;" ForeColor="Red" ControlToValidate="pass"></asp:RequiredFieldValidator>
                    </div>       
                  </div>
                  <div class="col-12">
                      <div class="wrap-input100 validate-input" data-validate="Nguyen Van A">
                        <input class="input100" type="text" name="hoten" runat="server" id="hoten">
                        <span class="focus-input100" data-placeholder="Họ Tên"></span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  runat="server" ErrorMessage="chưa nhập họ tên" style="float:right;" ForeColor="Red" ControlToValidate="hoten"></asp:RequiredFieldValidator>

                    </div>
                  </div>
                  <div class="col-12">
                       <div class="wrap-input100 validate-input" data-validate="Đà Nẵng">
                        <input class="input100" type="text" name="dc" runat="server" id="dc">
                        <span class="focus-input100" data-placeholder="Địa chỉ"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  runat="server" ErrorMessage="chưa nhập địa chỉ" style="float:right;" ForeColor="Red" ControlToValidate="dc"></asp:RequiredFieldValidator>
                    </div>
                  </div>
                  <div class="col-md-6">
              <div class="wrap-input100 validate-input" data-validate="0334567890">
                        <input class="input100" type="text" name="sdt" runat="server" id="sdt" maxlength="10">
                        <span class="focus-input100" data-placeholder="Số điện thoại"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ErrorMessage="chưa nhập số điện thoại" style="float:right;" ForeColor="Red" ControlToValidate="sdt"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="(0)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})"
                                    style="float:right;" ForeColor="Red" ErrorMessage="Số điện thoại không đúng định dạng" ControlToValidate="sdt"></asp:RegularExpressionValidator>
                    </div>

                  </div>
                  <div class="col-md-4">
                     <div class="wrap-input100 validate-input" data-validate="Nam">
                        <asp:DropDownList ID="drgt" runat="server" style="width:100%;   border:none;position:relative;" ForeColor="#555555" class="drgt">
                            <asp:ListItem Value="0">Giới Tính....</asp:ListItem>
                            <asp:ListItem Value="1">NAM</asp:ListItem>
                            <asp:ListItem Value="2">NỮ</asp:ListItem>
                        
                        </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  InitialValue="0" ErrorMessage="chưa chọn giới tính" runat="server"  style="float:right;" ForeColor="Red" ControlToValidate="drgt"></asp:RequiredFieldValidator>
                      
                    </div>
                  </div>
                
               
                  <div class="col-5" style="margin:0 auto;">
                       <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn"  runat="server" onserverclick="btnSignUp_Click">
                                Đăng Ký</button>
                        </div>
                    </div>

                    <div class="text-center pt-2" >
                        <span class="txt1">Đã Có Tài Khoản?
                        </span>

                        <a class="txt2" href="Login.aspx">Đăng Nhập
                        </a>
                    </div>
                  </div>
                </form>
       
    </div>

    <%--PHAN DANGKY--%>



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

    <div id="dropDownSelect1"></div>

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
