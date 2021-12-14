<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="NhaCungCap.aspx.cs" Inherits="DOAN_NQV.Admin.NhaCungCap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/dist/sweetalert.css" rel="stylesheet" />
    <script src="../assets/dist/sweetalert.js"></script>
    <script src="../assets/dist/sweetalert.min.js"></script>
    <script>
        var object = { status: false, ele: null };
        function messDone() {
            swal("Thành công!", "Đã cập nhật!", "success")
        };
        function deleteRow(ev) {
            if (object.status) { return true; }
            swal({
                title: "Bạn có chắc không?",
                text: "Bản có muốn xóa không?",
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
    <a class="navbar-brand">Nhà cung cấp</a>
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
                <li class="active ">
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
                <td style="width: 300px; text-align: right; padding-right: 5px">Tên nhà cung cấp</td>
                <td>
                    <asp:TextBox ID="txtTENNCC" runat="server" CssClass="txt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTENNCC" runat="server" ForeColor="Red" ErrorMessage="Chưa nhập tên nhà cung cấp!" ControlToValidate="txtTENNCC"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 310px; text-align: right; padding-right: 5px">Địa chỉ</td>
                <td>
                    <asp:TextBox ID="txtDIACHI" runat="server" CssClass="txt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDIACHI" runat="server" ForeColor="Red" ErrorMessage="Chưa nhập địa chỉ!" ControlToValidate="txtDIACHI"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 300px; text-align: right; padding-right: 5px">Số điện thoại</td>
                <td>
                    <asp:TextBox ID="txtSDT" runat="server" CssClass="txt" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSDT" runat="server" ForeColor="Red" ErrorMessage="Chưa nhập số điện thoại!" ControlToValidate="txtSDT"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 300px; text-align: right; padding-right: 5px">&nbsp;</td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorSDT" runat="server" ControlToValidate="txtSDT"
                        ValidationExpression="(0)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})"
                        ForeColor="Red"
                        ErrorMessage="Số điện thoại không đúng định dạng!"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr style="text-align: center">
                <td colspan="2">
                    <asp:LinkButton ID="btnSave" runat="server" Font-Underline="false" OnClick="btnSave_Click" CausesValidation="true" CssClass="linkBtnEditUpdate" Width="120px" Height="20px">Lưu thông tin</asp:LinkButton>
                </td>
            </tr>
            <tr style="text-align: center">
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="col-md-12" style="width:1120px">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Nhà cung cấp</h4>
            </div>
            <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridView1" runat="server" CssClass="grd" GridLines="None" AutoGenerateColumns="False" DataKeyNames="MANCC" CellPadding="5" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">
                        <Columns>
                            <asp:TemplateField HeaderText="Tên nhà cung cấp" SortExpression="TENNCC">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TENNCC") %>' Width="250px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Địa chỉ" SortExpression="DIACHI">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DIACHI") %>' Width="350px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Số điện thoại" SortExpression="SDT">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SDT") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Edit" Text="Sửa" CssClass="linkBtnEditUpdate" Width="60px" Height="20px"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Delete" OnClientClick="return deleteRow(this);" Text="Xóa" CssClass="linkBtnRemoveCancel" Width="60px" Height="20px"></asp:LinkButton>
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
