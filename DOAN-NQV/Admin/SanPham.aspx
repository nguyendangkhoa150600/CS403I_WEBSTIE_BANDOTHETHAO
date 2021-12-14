<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="DOAN_NQV.Admin.SanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/dist/sweetalert.css" rel="stylesheet" />
    <script src="../assets/dist/sweetalert.js"></script>
    <script src="../assets/dist/sweetalert.min.js"></script>
    <script>
        var object = { status: false, ele: null };
        function deleteRow(ev) {
            if (object.status) { return true; }
            swal({
                title: "Bạn có chắc không?",
                text: "Bạn có muốn xóa sản phẩm này không?",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "Không",
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Có",
                closeOnConfirm: true
            },
                function () {
                    object.status = true;
                    object.ele = ev;
                    object.ele.click();
                });
            return false;
        };
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <a class="navbar-brand">Sản phẩm</a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <li class="active ">
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
                <li class="active-pro">
                    <a href="/Admin/ThongTinCaNhan.aspx">
                        <i class="nc-icon nc-spaceship"></i>
                        <p>Thông tin cá nhân</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <br />
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <ul class="list-inline m-0">
                    <li class="list-inline-item">
                        <h4 class="card-title">Sản phẩm</h4>
                    </li>
                    <li class="list-inline-item" style="float: right">
                        <asp:LinkButton ID="btnUpdate" runat="server" Font-Underline="false" CssClass="linkBtnAdd" OnClick="btnUpdate_Click">
                            <img src="../assets/img/add.png" width="20" height="20" />
                            <span>Thêm mới</span>
                        </asp:LinkButton>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grd" GridLines="None" CellPadding="5" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="MASP" AllowSorting="true">
                        <Columns>
                            <asp:ImageField DataImageUrlField="HINHANH" DataImageUrlFormatString="~/images/{0}" HeaderText="Ảnh" ControlStyle-Width="70px" ControlStyle-Height="70px">
                                <ControlStyle Height="70px" Width="70px"></ControlStyle>
                            </asp:ImageField>
                            <asp:BoundField DataField="TENSP" HeaderText="Tên sản phẩm" ItemStyle-Width="200px" />
                            <asp:BoundField DataField="CHITIETSP" HeaderText="Mô tả" ItemStyle-Width="250px" />
                            <asp:BoundField DataField="TENNCC" HeaderText="Nhà cung cấp" ItemStyle-Width="200px" />
                            <asp:BoundField DataField="TENDM" HeaderText="Loại hàng" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" Text="Sửa" CssClass="linkBtnEditUpdate" Font-Underline="false" Width="60px" Height="20px"></asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Xóa" OnClientClick="return deleteRow(this);" CssClass="linkBtnRemoveCancel" Font-Underline="false" Width="60px" Height="20px"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle HorizontalAlign="Center" />
                        <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
