<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="TaiKhoan.aspx.cs" Inherits="DOAN_NQV.Admin.TaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/dist/sweetalert.css" rel="stylesheet" />
    <script src="../assets/dist/sweetalert.js"></script>
    <script src="../assets/dist/sweetalert.min.js"></script>
    <script>
        var object = { status: false, ele: null };
        function deleteRow(ev, mess) {
            if (object.status) { return true; }
            swal({
                title: "Bạn có chắc không?",
                text: "Bạn có muốn " + mess + " tài khoản này không?",
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <a class="navbar-brand">Tài khoản</a>
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
                    <a href="../Admin/ThongKe.aspx">
                        <i class="nc-icon nc-bank"></i>
                        <p>Thống kê</p>
                    </a>
                </li>
                <li>
                    <a href="../Admin/DonHang.aspx">
                        <i class="nc-icon nc-diamond"></i>
                        <p>Đơn hàng</p>
                    </a>
                </li>
                <li>
                    <a href="../Admin/SanPham.aspx">
                        <i class="nc-icon nc-pin-3"></i>
                        <p>Sản phẩm</p>
                    </a>
                </li>
                <li>
                    <a href="../Admin/NhaCungCap.aspx">
                        <i class="nc-icon nc-bell-55"></i>
                        <p>Nhà cung cấp</p>
                    </a>
                </li>
                <li>
                    <a href="../Admin/DanhMuc.aspx">
                        <i class="nc-icon nc-single-02"></i>
                        <p>Danh mục hàng</p>
                    </a>
                </li>
                <li class="active ">
                    <a href="../Admin/TaiKhoan.aspx">
                        <i class="nc-icon nc-tile-56"></i>
                        <p>Tài khoản</p>
                    </a>
                </li>
                <li>
                    <a href="../Admin/KhuyenMai.aspx">
                        <i class="nc-icon nc-caps-small"></i>
                        <p>Khuyến mãi</p>
                    </a>
                </li>
                <li class="active-pro">
                    <a href="../Admin/ThongTinCaNhan.aspx">
                        <i class="nc-icon nc-spaceship"></i>
                        <p>Thông tin cá nhân</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Tài khoản khách hàng</h4>
            </div>
            <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="MATK" GridLines="None" CssClass="grd" CellPadding="5" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">
                        <Columns>
                            <asp:TemplateField HeaderText="Họ tên" SortExpression="HOTEN">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("HOTEN") %>' Width="140px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Giới tính" SortExpression="GT">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("GT") %>' Width="70px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Địa chỉ" SortExpression="DIACHI">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DIACHI") %>' Width="310px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Số điện thoại" SortExpression="SDT">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("SDT") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Loại tài khoản" SortExpression="TENLOAI">
                                <ItemTemplate>
                                    <asp:Label ID="lbLOAITK" runat="server" Text='<%# Bind("TENLOAI") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" Visible='<%# ((bool)Eval("TRANGTHAI")) %>' Text="Hoạt động" OnClientClick="return deleteRow(this, 'vô hiệu hóa');" CssClass="linkBtnEditUpdate" Font-Underline="false" Width="100px" Height="20px"></asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Visible='<%# (!(bool)Eval("TRANGTHAI")) %>' Text="Vô hiệu" OnClientClick="return deleteRow(this, 'kích hoạt');" CssClass="linkBtnRemoveCancel" Font-Underline="false" Width="100px" Height="20px"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
