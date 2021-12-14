<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ThemSanPham.aspx.cs" Inherits="DOAN_NQV.Admin.ThemSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/dist/sweetalert.css" rel="stylesheet" />
    <script src="../assets/dist/sweetalert.js"></script>
    <script src="../assets/dist/sweetalert.min.js"></script>
    <script>
        function messDone() {
            swal("Thành công!", "Đã cập nhật!", "success")
        };
        var object = { status: false, ele: null };
        function messExit(ev) {
            if (object.status) { return true; }
            swal({
                title: "Bạn có chắc không?",
                text: "Bạn có muốn thoát không?",
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
    <style type="text/css">
        .auto-style1 {
            width: 92px;
        }

        .auto-style2 {
            margin-left: 0px;
        }

        .auto-style3 {
            width: 92px;
            height: 26px;
        }

        .auto-style5 {
            width: 453px;
        }

        .auto-style6 {
            width: 453px;
            height: 26px;
        }

        .btnColor {
            background-color: white;
        }

        .auto-style7 {
            width: 169px;
        }

        .auto-style8 {
            width: 169px;
            height: 26px;
        }

        .auto-style9 {
            width: 262px;
        }

        .auto-style13 {
            width: 92px;
            height: 38px;
        }

        .auto-style14 {
            width: 169px;
            height: 38px;
        }

        .auto-style15 {
            width: 453px;
            height: 38px;
        }

        .auto-style16 {
            width: 92px;
            height: 40px;
        }

        .auto-style18 {
            width: 453px;
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
    <div class="row">
        <div class="col-md-4 pt-4">
            <div class="card card-user">
                <asp:Image ID="Image1" runat="server" Width="400px" Height="400px" />
            </div>
        </div>
        <div class="col-md-8">
            <div class="card card-user">
                <div class="card-header">
                    <h5 class="card-title">Sản phẩm</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-size: 14px">Tên sản phẩm</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập tên sản phẩm!" ControlToValidate="txtTENSP" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtTENSP" runat="server" Width="650px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-size: 14px">Mô tả</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập mô tả sản phẩm!" ControlToValidate="txtCHITIETSP" ForeColor="#ff3300"></asp:RequiredFieldValidator><br />
                                <asp:TextBox ID="txtCHITIETSP" runat="server" TextMode="MultiLine" Height="120px" Width="650px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 pr-1">
                            <div class="form-group">
                                <label style="font-size: 14px">Nhà cung cấp</label>
                                <asp:DropDownList ID="ddlNCC" runat="server" CssClass="txt" Width="320px"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6 pl-1">
                            <div class="form-group">
                                <label style="font-size: 14px">Loại hàng</label>
                                <asp:DropDownList ID="ddlDM" runat="server" CssClass="txt" Width="320px"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-size: 14px">Hình ảnh</label>
                                <asp:Label ID="lbAnh1" runat="server" Text="Chưa tải ảnh lên!" ForeColor="#ff3300"></asp:Label>
                            </div>
                            <div>
                                <asp:FileUpload ID="FileUpload1" CssClass="custom-file-upload" ViewStateMode="Enabled" runat="server" />
                                <asp:Button ID="btnView" runat="server" CausesValidation="false" Text="View" CssClass="btn" OnClick="btnView_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row pl-3" >
        <div class="card card-user" style="padding-left:5%">
            <div class="card-header">
                <h5 class="card-title">Thêm chi tiết</h5>
            </div>
            <div>
                <div class="row">
                    <div class="col pl-5">
                        <div class="form-group">
                            <div class="row">
                                <label style="font-size: 14px">Size</label>
                            </div>
                            <div class="row">
                                <asp:DropDownList ID="ddlSize" runat="server" Width="50px" Height="25px"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="col pl-5">
                        <div class="form-group">
                            <div class="row">
                                <label style="font-size: 14px">Màu sắc</label>
                            </div>
                            <div class="row">
                                <asp:DropDownList ID="ddlMauSac" runat="server" Width="60px" Height="25px"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="col pl-5">
                        <div class="form-group">
                            <div class="row">
                                <label style="font-size: 14px">Số lượng</label>
                            </div>
                            <div class="row">
                                <asp:TextBox ID="txtSOLUONG" runat="server" Width="80px" Height="25px"></asp:TextBox>
                                <br />
                                <asp:RangeValidator ID="RangeValidator1" runat="server" Width="220px" MinimumValue="0" MaximumValue="100000000" Type="Integer" ErrorMessage="Không được nhập giá trị âm!" ControlToValidate="txtSOLUONG" ForeColor="#ff3300"></asp:RangeValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col pl-5">
                        <div class="form-group">
                            <div class="row">
                                <label style="font-size: 14px">Đơn giá nhập</label>
                            </div>
                            <div class="row">
                                <asp:TextBox ID="txtDONGIANHAP" runat="server" Width="100px" Height="25px"></asp:TextBox>
                            </div>
                            <div class="row">
                                <asp:RangeValidator ID="RangeValidator2" runat="server" Width="220px" MinimumValue="0" MaximumValue="1000000000" Type="Integer" ErrorMessage="Không được nhập giá trị âm!" ControlToValidate="txtDONGIANHAP" ForeColor="#ff3300"></asp:RangeValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col pl-5" style="padding-right:5em">
                        <div class="form-group">
                            <div class="row">
                                <label style="font-size: 14px">Đơn giá bán</label>
                            </div>
                            <div class="row">
                                <asp:TextBox ID="txtDONGIABAN" runat="server" Width="100px" Height="25px"></asp:TextBox>
                            </div>
                            <div class="row">
                                <asp:RangeValidator ID="RangeValidator3" runat="server" Width="220px" MinimumValue="0" MaximumValue="1000000000" Type="Integer" ErrorMessage="Không được nhập giá trị âm!" ControlToValidate="txtDONGIABAN" ForeColor="#ff3300"></asp:RangeValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="update ml-auto mr-auto">
            <asp:LinkButton ID="btnDone" runat="server" Font-Underline="false" OnClick="btnDone_Click" CausesValidation="true" CssClass="linkBtnEditUpdate p-2">Lưu thông tin</asp:LinkButton>
            <asp:LinkButton ID="btnExit" runat="server" Font-Underline="false" CausesValidation="false" OnClientClick="return messExit(this);" OnClick="btnExit_Click" CssClass="linkBtnRemoveCancel p-2">Thoát</asp:LinkButton>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Bảng chi tiết sản phẩm</h4>
                </div>
                <div class="card-body">
                    <div class="table">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grd" GridLines="None" CellPadding="5" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="MACTSP" AllowSorting="True">
                            <Columns>
                                <asp:TemplateField HeaderText="Size">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TENSIZE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Màu sắc">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("TENMAU") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Số lượng">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SOLUONG") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giá bán">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("DONGIABAN") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giá nhập">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("DONGIANHAP") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
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
    </div>
</asp:Content>
