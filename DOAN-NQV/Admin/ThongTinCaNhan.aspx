<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ThongTinCaNhan.aspx.cs" Inherits="DOAN_NQV.Admin.ThongTinCaNhan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <link href="../assets/dist/sweetalert.css" rel="stylesheet" />
    <script src="../assets/dist/sweetalert.js"></script>
    <script src="../assets/dist/sweetalert.min.js"></script>
    <script>
        function messDone() {
            swal("Thành công!", "Đã cập nhật!", "success")
        };
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <a class="navbar-brand">Thông tin cá nhân</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sidebar" data-color="white" data-active-color="danger">
        <div class="logo">
            <a class="simple-text logo-mini">
                <div class="logo-image-small">
                    <img src="assets/img/logo-small.png" />
                </div>
                <!-- <p>CT</p> -->
            </a>
            <a class="simple-text logo-normal">VKSPORTS
        </a>
        </div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li>
                    <a href="/Admin/ThongKe.aspx">
                        <i class="nc-icon nc-bank"></i>
                        <p>Thống kê</p>
                    </a>
                </li>
                <li>
                    <a href="/Admin/DonHang.aspx">
                        <i class="nc-icon nc-diamond"></i>
                        <p>Đơn hàng</p>
                    </a>
                </li>
                <li>
                    <a href="/Admin/SanPham.aspx">
                        <i class="nc-icon nc-pin-3"></i>
                        <p>Sản phẩm</p>
                    </a>
                </li>
                <li>
                    <a href="/Admin/NhaCungCap.aspx">
                        <i class="nc-icon nc-bell-55"></i>
                        <p>Nhà cung cấp</p>
                    </a>
                </li>
                <li>
                    <a href="/Admin/DanhMuc.aspx">
                        <i class="nc-icon nc-single-02"></i>
                        <p>Danh mục hàng</p>
                    </a>
                </li>
                <li>
                    <a href="/Admin/TaiKhoan.aspx">
                        <i class="nc-icon nc-tile-56"></i>
                        <p>Tài khoản</p>
                    </a>
                </li>
                <li>
                    <a href="/Admin/KhuyenMai.aspx">
                        <i class="nc-icon nc-caps-small"></i>
                        <p>Khuyến mãi</p>
                    </a>
                </li>
                <li class="active active-pro">
                    <a href="/Admin/ThongTinCaNhan.aspx">
                        <i class="nc-icon nc-spaceship"></i>
                        <p>Thông tin cá nhân</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="card card-user" style="width: 900px">
                <div class="card-header">
                    <h5 class="card-title">Thay đổi thông tin</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập họ tên!" ForeColor="#ff3300" ControlToValidate="txtHOTEN"></asp:RequiredFieldValidator>
                                <br />
                                <label>Họ và tên</label>
                                <asp:TextBox ID="txtHOTEN" runat="server" Width="600px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 pr-1">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Chưa nhập số điện thoại" ControlToValidate="txtSDT" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorSDT" runat="server" ControlToValidate="txtSDT"
                                    ValidationExpression="(0)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})"
                                    ForeColor="#ff3300"
                                    ErrorMessage="Số điện thoại không đúng định dạng"></asp:RegularExpressionValidator>
                                <br />
                                <label>Số điện thoại</label>
                                <asp:TextBox ID="txtSDT" runat="server" MaxLength="10"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3 px-1">
                            <div class="form-group">
                                <br />
                                <br />
                                <label>Giới tính</label>
                                <asp:DropDownList ID="ddlGIOITINH" runat="server">
                                    <asp:ListItem Text="Nam" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Nữ" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4 pl-1">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập email" ControlToValidate="txtGMAIL" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorGMAIL" runat="server" ControlToValidate="txtGMAIL"
                                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                    ForeColor="#ff3300"
                                    ErrorMessage="Email không đúng định dạng"></asp:RegularExpressionValidator>
                                <br />
                                <label>Email</label>
                                <asp:TextBox ID="txtGMAIL" runat="server" style="width:75%;"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 pr-1">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập mật khẩu" ControlToValidate="txtMATKHAU" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                <br />
                                <label>Mật khẩu</label>
                                <asp:TextBox ID="txtMATKHAU" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6 pl-1">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập mật khẩu" ControlToValidate="txtXACNHAN" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                <br />
                                <label>Xác nhận mật khẩu</label>
                                <asp:TextBox ID="txtXACNHAN" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập địa chỉ!" ForeColor="#ff3300" ControlToValidate="txtDIACHI"></asp:RequiredFieldValidator>
                                <br />
                                <label>Địa chỉ</label>
                                <asp:TextBox ID="txtDIACHI" runat="server" Width="600px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="update ml-auto mr-auto">
                            <asp:Button ID="btnCapNhat" runat="server" class="btn btn-primary btn-round" Text="Cập nhật" OnClick="btnCapNhat_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
