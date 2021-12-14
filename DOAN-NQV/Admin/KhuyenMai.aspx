<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="KhuyenMai.aspx.cs" Inherits="DOAN_NQV.Admin.KhuyenMai" %>

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
                text: "Bạn có muốn xóa đợt khuyến mãi này không?",
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
            width: 128px;
        }

        .auto-style2 {
            width: 273px;
        }

        .auto-style3 {
            width: 96px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <a class="navbar-brand">Khuyến mãi</a>
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
                <li class="active ">
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
                <td style="text-align: right; padding-right: 5px; vertical-align: bottom" class="auto-style1">Tên khuyến mãi</td>
                <td colspan="3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập tên khuyến mãi" ControlToValidate="txtTENKM" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTENKM" runat="server" CssClass="txt" Width="100%"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 5px; vertical-align: bottom" class="auto-style1">Ngày bắt đầu</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa chọn ngày bắt đầu" ControlToValidate="txtNGAYBD" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtNGAYBD" runat="server" CssClass="txt" TextMode="Date" Width="300px"></asp:TextBox>

                </td>
                <td style="width: 210px; text-align: right; padding-right: 5px; vertical-align: bottom">Thời điểm</td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa chọn thời điểm" ControlToValidate="txtTDBD" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTDBD" runat="server" CssClass="txt" TextMode="Time" Width="300px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 5px; vertical-align: bottom" class="auto-style1">Ngày kết thúc</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa chọn ngày kết thúc" ControlToValidate="txtNGAYKT" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtNGAYKT" runat="server" CssClass="txt" TextMode="Date" Width="300px"></asp:TextBox>
                </td>
                <td style="width: 210px; text-align: right; padding-right: 5px; vertical-align: bottom">Thời điểm</td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa chọn thời điểm" ControlToValidate="txtTDKT" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTDKT" runat="server" CssClass="txt" TextMode="Time" Width="300px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr style="text-align: center">
                <td colspan="4" style="color: orangered">
                    <asp:Label ID="Label6" runat="server" Text="Thời gian kết thúc phải lớn hơn thời gian bắt đầu" Visible="false"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr style="text-align: center">
                <td colspan="4">
                    <br />
                    <asp:LinkButton ID="btnSave" runat="server" Font-Underline="false" OnClick="btnSave_Click" CausesValidation="true" CssClass="linkBtnEditUpdate" Width="120px" Height="20px">Lưu thông tin</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Khuyến mãi</h4>
            </div>
            <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridView1" runat="server" GridLines="None" CssClass="grd" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="MAKM" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">
                        <Columns>
                            <asp:TemplateField HeaderText="Tên khuyến mãi" SortExpression="TENKM">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TENKM") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="180px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngày bắt đầu" SortExpression="NGAYBD">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("NGAYBD") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngày kết thúc" SortExpression="NGAYKT">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("NGAYKT") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng thái" SortExpression="TENTT">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TENTT") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="false" CssClass="linkBtnEditUpdate" Visible='<%# ((int)Eval("MATT")==1?true:false) %>' CausesValidation="False" CommandName="Edit" Text="Sửa" Width="60px" Height="20px"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" Font-Underline="false" CssClass="linkBtnEditUpdate" CausesValidation="False" CommandName="Select" Text="Chi tiết" Width="80px" Height="20px"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" Font-Underline="false" CssClass="linkBtnRemoveCancel" Visible='<%# ((int)Eval("MATT")==1?true:false) %>' OnClientClick="return deleteRow(this);" CausesValidation="False" CommandName="Delete" Text="Xóa" Width="60px" Height="20px"></asp:LinkButton>
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
