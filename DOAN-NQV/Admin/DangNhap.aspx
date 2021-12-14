<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="DOAN_NQV.Admin.DangNhap" %>

<!doctype html>
<html lang="en">
<head>
    <title>Admin</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="assets/assetlogin/css/style.css" rel="stylesheet" />
</head>
<body>
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">Welcome to VKSHOP</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="login-wrap p-4 p-md-5">
                        <div class="icon d-flex align-items-center justify-content-center">
                            <span class="fa fa-user-o"></span>
                        </div>
                        <form action="#" class="login-form" runat="server">
                            <div class="form-group">
                                <asp:TextBox ID="txtEMAIL" placeholder="Email" CssClass="form-control rounded-left" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group d-flex">
                                <asp:TextBox ID="txtPASS" placeholder="Mật khẩu" CssClass="form-control rounded-left" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group d-md-flex">
                            </div>
                            <div class="form-group">
                                <asp:Button runat="server" class="btn btn-primary rounded submit p-3 px-5" Text="Đăng nhập" OnClick="btnDangNhap_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>


