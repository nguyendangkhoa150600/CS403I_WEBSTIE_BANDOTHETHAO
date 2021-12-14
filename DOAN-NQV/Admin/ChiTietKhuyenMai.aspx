<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ChiTietKhuyenMai.aspx.cs" Inherits="DOAN_NQV.Admin.ChiTietKhuyenMai" %>

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
                text: "Bạn có muốn xóa khuyến mãi này không?",
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
            width: 260px;
        }

        .auto-style3 {
            width: 831px;
        }

        .auto-style4 {
            width: 452px;
        }

        .auto-style6 {
            width: 100%;
            height: 124px;
        }

        .auto-style7 {
            width: 400px;
        }

        .auto-style8 {
            background-color: white;
            margin-left: 0px;
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
        <a class="simple-text logo-normal">
          VKSPORTS
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
    <div style="text-align: center">
        <asp:Label ID="lbKM" runat="server" Text="Khuyến mãi"></asp:Label>
    </div>
    <div style="padding: 10px" class="container">
        <table style="width: 100%;">
            <tr>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
                <td style="font-weight: bold" class="auto-style7">Giá trị khuyến mãi (%)</td>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtTYLEKM" runat="server" CssClass="txt"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" MinimumValue="0" MaximumValue="100" Type="Integer" ErrorMessage="0 <= Giá trị khuyến mãi <= 100" ControlToValidate="txtTYLEKM" ForeColor="#ff3300"></asp:RangeValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
                <td style="font-weight: bold" class="auto-style7">Ghi chú</td>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtGHICHU_TC" runat="server" TextMode="MultiLine" Height="50px" Width="400px"></asp:TextBox>
                    <br />
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
                <td style="font-weight: bold" class="auto-style7">Áp dụng với</td>
                <td style="width: 300px; font-weight: bold">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>

                <td class="auto-style7">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Selected="True">Tất cả sản phẩm</asp:ListItem>
                        <asp:ListItem>Danh mục sản phẩm</asp:ListItem>
                        <asp:ListItem>Sản phẩm</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                </td>

                <td>&nbsp;</td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style7" style="text-align: center">
                    <asp:LinkButton ID="btnDone" runat="server" Font-Underline="false" OnClick="btnDone_Click" CausesValidation="true" CssClass="linkBtnEditUpdate" Width="60px" Height="20px">Lưu</asp:LinkButton>
                    <asp:LinkButton ID="btnExit" runat="server" Font-Underline="false" OnClientClick="return messExit(this);" OnClick="btnExit_Click" CssClass="linkBtnRemoveCancel" Width="60px" Height="20px">Thoát</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>

     <div class="col-md-12" style="padding-left:10%">
        <div class="card" style="width:850px">
            <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridViewSP" runat="server" AutoGenerateColumns="False" CssClass="auto-style8" GridLines="None" Visible="False" DataKeyNames="MASP" CellPadding="5" AllowPaging="True" OnPageIndexChanging="GridViewSP_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSP" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ImageField DataImageUrlField="HINHANH" DataImageUrlFormatString="~/images/{0}" HeaderText="Ảnh" ControlStyle-Width="70px" ControlStyle-Height="70px">
                                <ControlStyle Height="70px" Width="70px"></ControlStyle>
                            </asp:ImageField>
                            <asp:TemplateField HeaderText="Tên sản phẩm" SortExpression="TENSP">
                                <ItemTemplate>
                                    <asp:Label ID="LabelTENSP" runat="server" Text='<%# Bind("TENSP") %>' Width="200px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nhà cung cấp" SortExpression="TENNCC">
                                <ItemTemplate>
                                    <asp:Label ID="LabelNCC" runat="server" Text='<%# Bind("TENNCC") %>' Width="200px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Loại hàng" SortExpression="TENDM">
                                <ItemTemplate>
                                    <asp:Label ID="LabelDM" runat="server" Text='<%# Bind("TENDM") %>' Width="200px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium"/>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

     <div class="col-md-12" style="padding-left:40%">
        <div class="card" style="width:250px">
            <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridViewDM" runat="server" AutoGenerateColumns="False" CssClass="auto-style8" GridLines="None" Visible="false" DataKeyNames="MADM">
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkDM" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TENDM" HeaderText="Loại sản phẩm" SortExpression="TENDM" />
                        </Columns>
                        <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium"/>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
