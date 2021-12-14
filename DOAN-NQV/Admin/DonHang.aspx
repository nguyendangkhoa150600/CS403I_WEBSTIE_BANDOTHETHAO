<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="DonHang.aspx.cs" Inherits="DOAN_NQV.Admin.DonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <div class="col-md-12" style="padding-left: 5%">
        <div class="card" style="width: 1000px">
            <div class="card-header">
                <h4 class="card-title">Đơn hàng</h4>
                <%-- TAB TRANG THAI --%>
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Chờ duyệt</button>
                        <button class="nav-link" id="nav-first-tab" data-bs-toggle="tab" data-bs-target="#nav-first" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Đã duyệt</button>
                        <button class="nav-link" id="nav-second-tab" data-bs-toggle="tab" data-bs-target="#nav-second" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Đang vận chuyển</button>
                        <button class="nav-link" id="nav-third-tab" data-bs-toggle="tab" data-bs-target="#nav-third" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Đã thanh toán</button>
                        <button class="nav-link" id="nav-final-tab" data-bs-toggle="tab" data-bs-target="#nav-final" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Hủy</button>
                    </div>
                </nav>

                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <div class="card-body">
                            <div class="table">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass="grd" DataKeyNames="MAHD" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" CellPadding="5" Width="543px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Mã hóa đơn" InsertVisible="False" SortExpression="MAHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbMAHD" runat="server" Text='<%# Bind("MAHD") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày lập hóa đơn" SortExpression="NGAYHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbNGAYHD" runat="server" Text='<%# Bind("NGAYHD") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tài khoản" SortExpression="HOTEN">
                                            <ItemTemplate>
                                                <asp:Label ID="lbHOTEN" runat="server" Text='<%# Bind("HOTEN") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Số điện thoại" SortExpression="SDT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbSDT" runat="server" Text='<%# Bind("SODIENTHOAI") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Trạng thái" SortExpression="TENTT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbTENTT" runat="server" Text='<%# Bind("TENTT") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Select" Text="Tùy Chọn" CssClass="linkBtnEditUpdate" Width="80px" Height="25px"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <%--home status--%>
                    <div class="tab-pane fade" id="nav-first" role="tabpanel" aria-labelledby="nav-first-tab">
                        <div class="card-body">
                            <div class="table">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass="grd" DataKeyNames="MAHD" OnSelectedIndexChanging="GridView2_SelectedIndexChanging" CellPadding="5" Width="543px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Mã hóa đơn" InsertVisible="False" SortExpression="MAHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbMAHD" runat="server" Text='<%# Bind("MAHD") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày lập hóa đơn" SortExpression="NGAYHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbNGAYHD" runat="server" Text='<%# Bind("NGAYHD") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tài khoản" SortExpression="HOTEN">
                                            <ItemTemplate>
                                                <asp:Label ID="lbHOTEN" runat="server" Text='<%# Bind("HOTEN") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Số điện thoại" SortExpression="SDT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbSDT" runat="server" Text='<%# Bind("SODIENTHOAI") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Trạng thái" SortExpression="TENTT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbTENTT" runat="server" Text='<%# Bind("TENTT") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Select" Text="Tùy Chọn" CssClass="linkBtnEditUpdate" Width="80px" Height="25px"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <%--first status--%>
                    <div class="tab-pane fade" id="nav-second" role="tabpanel" aria-labelledby="nav-second-tab">
                        <div class="card-body">
                            <div class="table">
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass="grd" DataKeyNames="MAHD" OnSelectedIndexChanging="GridView3_SelectedIndexChanging" CellPadding="5" Width="543px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Mã hóa đơn" InsertVisible="False" SortExpression="MAHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbMAHD" runat="server" Text='<%# Bind("MAHD") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày lập hóa đơn" SortExpression="NGAYHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbNGAYHD" runat="server" Text='<%# Bind("NGAYHD") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tài khoản" SortExpression="HOTEN">
                                            <ItemTemplate>
                                                <asp:Label ID="lbHOTEN" runat="server" Text='<%# Bind("HOTEN") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Số điện thoại" SortExpression="SDT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbSDT" runat="server" Text='<%# Bind("SODIENTHOAI") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Trạng thái" SortExpression="TENTT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbTENTT" runat="server" Text='<%# Bind("TENTT") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Select" Text="Tùy Chọn" CssClass="linkBtnEditUpdate" Width="80px" Height="25px"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <%--second status--%>
                    <div class="tab-pane fade" id="nav-third" role="tabpanel" aria-labelledby="nav-third-tab">
                        <div class="card-body">
                            <div class="table">
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass="grd" DataKeyNames="MAHD" OnSelectedIndexChanging="GridView4_SelectedIndexChanging" CellPadding="5" Width="543px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Mã hóa đơn" InsertVisible="False" SortExpression="MAHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbMAHD" runat="server" Text='<%# Bind("MAHD") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày lập hóa đơn" SortExpression="NGAYHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbNGAYHD" runat="server" Text='<%# Bind("NGAYHD") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tài khoản" SortExpression="HOTEN">
                                            <ItemTemplate>
                                                <asp:Label ID="lbHOTEN" runat="server" Text='<%# Bind("HOTEN") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Số điện thoại" SortExpression="SDT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbSDT" runat="server" Text='<%# Bind("SODIENTHOAI") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Trạng thái" SortExpression="TENTT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbTENTT" runat="server" Text='<%# Bind("TENTT") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Select" Text="Tùy Chọn" CssClass="linkBtnEditUpdate" Width="80px" Height="25px"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <%--third status--%>
                    <div class="tab-pane fade" id="nav-final" role="tabpanel" aria-labelledby="nav-final-tab">
                        <div class="card-body">
                            <div class="table">
                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass="grd" DataKeyNames="MAHD" OnSelectedIndexChanging="GridView5_SelectedIndexChanging" CellPadding="5" Width="543px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Mã hóa đơn" InsertVisible="False" SortExpression="MAHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbMAHD" runat="server" Text='<%# Bind("MAHD") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày lập hóa đơn" SortExpression="NGAYHD">
                                            <ItemTemplate>
                                                <asp:Label ID="lbNGAYHD" runat="server" Text='<%# Bind("NGAYHD") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tài khoản" SortExpression="HOTEN">
                                            <ItemTemplate>
                                                <asp:Label ID="lbHOTEN" runat="server" Text='<%# Bind("HOTEN") %>' Width="180px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Số điện thoại" SortExpression="SDT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbSDT" runat="server" Text='<%# Bind("SODIENTHOAI") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Trạng thái" SortExpression="TENTT">
                                            <ItemTemplate>
                                                <asp:Label ID="lbTENTT" runat="server" Text='<%# Bind("TENTT") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Select" Text="Tùy Chọn" CssClass="linkBtnEditUpdate" Width="80px" Height="25px"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <%--final status--%>
                </div>
                <%-- END TAB TRANG THAI --%>
            </div>
            <%-- <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass="grd" DataKeyNames="MAHD" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" CellPadding="5" Width="543px">
                        <Columns>
                            <asp:TemplateField HeaderText="Mã hóa đơn" InsertVisible="False" SortExpression="MAHD">
                                <ItemTemplate>
                                    <asp:Label ID="lbMAHD" runat="server" Text='<%# Bind("MAHD") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngày lập hóa đơn" SortExpression="NGAYHD">
                                <ItemTemplate>
                                    <asp:Label ID="lbNGAYHD" runat="server" Text='<%# Bind("NGAYHD") %>' Width="180px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tài khoản" SortExpression="HOTEN">
                                <ItemTemplate>
                                    <asp:Label ID="lbHOTEN" runat="server" Text='<%# Bind("HOTEN") %>' Width="180px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Số điện thoại" SortExpression="SDT">
                                <ItemTemplate>
                                    <asp:Label ID="lbSDT" runat="server" Text='<%# Bind("SODIENTHOAI") %>' Width="120px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng thái" SortExpression="TENTT">
                                <ItemTemplate>
                                    <asp:Label ID="lbTENTT" runat="server" Text='<%# Bind("TENTT") %>' Width="120px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Select" Text="Tùy Chọn" CssClass="linkBtnEditUpdate" Width="80px" Height="25px"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>
