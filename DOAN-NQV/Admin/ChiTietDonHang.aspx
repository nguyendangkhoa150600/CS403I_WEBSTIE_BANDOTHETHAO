<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ChiTietDonHang.aspx.cs" Inherits="DOAN_NQV.Admin.ChiTietDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/dist/sweetalert.css" rel="stylesheet" />
    <script src="../assets/dist/sweetalert.js"></script>
    <script src="../assets/dist/sweetalert.min.js"></script>
    <script>
        function messDone() {
            swal("Thành công!", "Đã cập nhật!", "success")
        };
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 271px;
        }

        .auto-style2 {
            width: 635px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <a class="navbar-brand">Đơn hàng</a>
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
                <li class="active ">
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
                <td style="font-weight: bold" class="auto-style1">&nbsp;</td>
                <td style="font-weight: bold" class="auto-style2">
                    <br />
                    Thông tin người mua:</td>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
            </tr>
            <tr>
                <td style="font-weight: bold" class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lbHOTEN" runat="server" Text="hoten"></asp:Label>
                </td>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
            </tr>
            <tr>
                <td style="font-weight: bold" class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lbDIACHI" runat="server" Text="Địa chỉ: "></asp:Label>
                </td>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
            </tr>
            <tr>
                <td style="font-weight: bold" class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lbSDT" runat="server" Text="Số điện thoại: "></asp:Label>
                </td>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
            </tr>
            <tr>
                <td style="font-weight: bold" class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lbGMAIL" runat="server" Text="Gmail: "></asp:Label>
                </td>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
            </tr>
            <tr>
                <td style="font-weight: bold" class="auto-style1">&nbsp;</td>
                <td style="font-weight: bold" class="auto-style2">
                    <br />
                    Thông tin hàng hóa:</td>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="col-md-12"  style="padding-left:7%">
        <div class="card" style="width:970px">
            <div class="card-header">
                <h4 class="card-title">Chi tiết đơn hàng</h4>
            </div>
            <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridView1" runat="server" GridLines="None" CssClass="grd" AutoGenerateColumns="False" DataKeyNames="MACT" Width="623px" CellPadding="5" ShowFooter="True">
                        <Columns>
                            <asp:TemplateField HeaderText="Mã hóa đơn" SortExpression="MAHD">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MAHD") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sản phẩm" SortExpression="TENSP">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TENSP") %>' Width="350px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Số lượng" SortExpression="SOLUONG">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SOLUONG") %>' Width="120px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Đơn giá" SortExpression="DONGIABAN">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DONGIABAN") %>' Width="120px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Thành tiền" SortExpression="THANHTIEN">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("THANHTIEN") %>' Width="120px"></asp:Label>
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
    <div class="row" style="text-align:center">
        <div class="col-md-12" style="position:center">
                        <asp:LinkButton ID="btnOptions" runat="server" CausesValidation="False" Font-Underline="false" Text="Tùy Chọn" CssClass="linkBtnEditUpdate" Width="120px" Height="20px" OnClick="btnOptions_Click"></asp:LinkButton>
        </div>
    </div>
</asp:Content>
