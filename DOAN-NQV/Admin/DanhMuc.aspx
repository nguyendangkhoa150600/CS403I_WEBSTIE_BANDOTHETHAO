<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="DanhMuc.aspx.cs" Inherits="DOAN_NQV.Admin.DanhMuc" %>

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
                text: "Bạn có muốn xóa danh mục này không?",
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
    <style type="text/css">
        .auto-style1 {
            width: 321px;
        }

        .auto-style2 {
            width: 417px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <a class="navbar-brand">Danh mục hàng</a>
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
                <li class="active ">
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
    <div style="padding: 10px" class="container">
        <table style="width: 100%;">
            <tr>
                <td style="width: 300px; text-align: right; padding-right: 5px">Tên danh mục</td>
                <td>
                    <asp:TextBox ID="txtTENDM" runat="server" CssClass="txt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTENNCC" runat="server" ForeColor="#ff3300" ErrorMessage="Chưa nhập tên danh mục" ControlToValidate="txtTENDM"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="text-align: center">
                <td colspan="2">
                    <br />
                    <asp:LinkButton ID="btnSave" runat="server" Font-Underline="false" OnClick="btnSave_Click" CausesValidation="true" CssClass="linkBtnEditUpdate" Width="60px" Height="20px">Lưu</asp:LinkButton>
                </td>
            </tr>
            <tr style="text-align: center">
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="col-md-12" style="padding-left:20%">
        <div class="card" style="width:500px">
            <div class="card-header">
                <h4 class="card-title">Danh mục hàng</h4>
            </div>
            <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MADM" GridLines="None" CssClass="grd" ShowFooter="True" CellPadding="5" OnRowDeleting="GridView1_RowDeleting " OnRowEditing="GridView1_RowEditing">
                        <Columns>
                            <asp:TemplateField HeaderText="Tên danh mục" SortExpression="TENDM">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TENDM") %>' Width="210px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Edit" Text="Sửa" CssClass="linkBtnEditUpdate" Width="60px" Height="20px"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Delete" OnClientClick="return deleteRow(this);" Text="Xóa" CssClass="linkBtnRemoveCancel" Width="60px" Height="20px"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle HorizontalAlign="Center" />
                        <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
