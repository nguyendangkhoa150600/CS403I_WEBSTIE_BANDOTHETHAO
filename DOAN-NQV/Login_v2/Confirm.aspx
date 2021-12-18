<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="WebApplication1.Login_v2.Confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VKSPORTS</title>





     <%-- Tran Van Son--%>
    
   
   
  
   <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.6.0.slim.min.js"></script>
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.6.0.slim.js"></script>
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/jquery-3.6.0.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <script src="../Scripts/jquery-3.6.0.intellisense.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Wallpoet&display=swap" rel="stylesheet"/>
    <link href="css/confirm.css" rel="stylesheet" />
  

    <%-- MP--%>
    <style type="text/css">
        .auto-style1 {
            width: 1219px;
        }
        .border-btn{
            
        }
        .border-txt{
            border-radius : 10px;
            text-align: center;
        }
        .center{
            text-align: center;
            margin:5px;
        }
        .color{
            color:blueviolet
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">


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










<%--PHẦN XÁC NHẬN--%>


        <div class="center">
            <h2 class="color">Xác nhận tài khoản</h2>
        </div>
        <div class="center">
            <asp:Label ID="lb" runat="server" Text="" style="font-size:19px;color:#ffd400">CHÀO MỪNG ĐẾN VỚI VKSPORTS</asp:Label>
        </div>
        <div class="center"r>
            Vui lòng nhập mã xác thực để hoàn thành việc đăng ký!
        </div>
        <div class="center">
            <asp:TextBox ID="txt" CssClass="border-txt" runat="server" Height="20px"></asp:TextBox>
        </div>
         <div class="tb" >
             <asp:Label ID="tbns"  style="color:red;padding-left:650px;" runat="server" Text="Label" Visible="false">MÃ XÁC THỰC KHÔNG ĐÚNG</asp:Label>
        </div>
        <div class="center">
            <asp:Button ID="btn" CssClass="border-btn" runat="server" Text="Xác nhận" Width="126px" BackColor="#9933FF" Font-Bold="True" Font-Size="Medium" ForeColor="White" OnClick="btn_Click" />
        </div>

       

        
<%--PHẦN XÁC NHẬN--%>









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






    </form>









    
</body>
</html>
