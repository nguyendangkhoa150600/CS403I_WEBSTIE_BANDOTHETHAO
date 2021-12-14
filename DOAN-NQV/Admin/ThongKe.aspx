<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="DOAN_NQV.Admin.ThongKe" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 70px;
            height: 35px;
        }

        .auto-style7 {
            width: 231px;
            height: 35px;
        }

        .auto-style10 {
            width: 127px;
            height: 35px;
        }

        .auto-style12 {
            width: 157px;
            height: 35px;
        }

        .auto-style13 {
            width: 105px;
            height: 35px;
        }

        .auto-style14 {
            height: 35px;
        }

        .cornerChart {
            border: 1px solid green;
            -moz-border-radius: 8px;
            border-radius: 25px;
            overflow: hidden;
            -webkit-border-radius: 8px;
            border-color: transparent;
        }

        .auto-style15 {
            width: 70px;
        }

        .auto-style18 {
            width: 75px;
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <a class="navbar-brand">Thống kê</a>
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
                <li class="active ">
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
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-body ">
                    <div class="row">
                        <div class="col-5 col-md-4">
                            <div class="icon-big text-center icon-warning">
                                <i class="nc-icon nc-globe text-warning"></i>
                            </div>
                        </div>
                        <div class="col-7 col-md-8">
                            <div class="numbers">
                                <p class="card-category">Doanh số</p>
                                <p class="card-title">
                                    <asp:Label ID="lbDoanhSo" runat="server" Text="0"></asp:Label>
                                <p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer ">
                    <hr>
                    <div class="stats">
                        <i class="fa fa-refresh"></i>
                        <a href="DonHang.aspx">Chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-body ">
                    <div class="row">
                        <div class="col-5 col-md-4">
                            <div class="icon-big text-center icon-warning">
                                <i class="nc-icon nc-money-coins text-success"></i>
                            </div>
                        </div>
                        <div class="col-7 col-md-8">
                            <div class="numbers">
                                <p class="card-category">Lãi</p>
                                <p class="card-title">
                                    <asp:Label ID="lbDoanhThu" runat="server" Text="0"></asp:Label>
                                <p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer ">
                    <hr>
                    <div class="stats">
                        <i class="fa fa-calendar-o"></i>
                        <a href="DonHang.aspx">Chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-body ">
                    <div class="row">
                        <div class="col-5 col-md-4">
                            <div class="icon-big text-center icon-warning">
                                <i class="nc-icon nc-vector text-danger"></i>
                            </div>
                        </div>
                        <div class="col-7 col-md-8">
                            <div class="numbers">
                                <p class="card-category">Tồn kho</p>
                                <p class="card-title">
                                    <asp:Label ID="lbTonKho" runat="server" Text="Label"></asp:Label>
                                <p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer ">
                    <hr>
                    <div class="stats">
                        <i class="fa fa-clock-o"></i>
                        <a href="SanPham.aspx">Sản phẩm</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-body ">
                    <div class="row">
                        <div class="col-5 col-md-4">
                            <div class="icon-big text-center icon-warning">
                                <i class="nc-icon nc-favourite-28 text-primary"></i>
                            </div>
                        </div>
                        <div class="col-7 col-md-8">
                            <div class="numbers">
                                <p class="card-category">Khách hàng</p>
                                <p class="card-title">
                                    <asp:Label ID="lbKhachHang" runat="server" Text="Label"></asp:Label>
                                <p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer ">
                    <hr>
                    <div class="stats">
                        <i class="fa fa-refresh"></i>
                        <a href="TaiKhoan.aspx">Tài khoản</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table style="width: 100%;">
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style1" style="text-align: right; margin-right: 3px">Từ ngày  </td>
            <td class="auto-style12">
                <asp:TextBox ID="txtNGAYBD" runat="server" CssClass="txt" TextMode="Date" Width="250px"></asp:TextBox>
            </td>
            <td class="auto-style10"></td>
            <td class="auto-style18" style="text-align: right; margin-right: 3px">Đến ngày  </td>
            <td class="auto-style7">
                <asp:TextBox ID="txtNGAYKT" runat="server" CssClass="txt" TextMode="Date" Width="250px"></asp:TextBox>
            </td>
            <td class="auto-style14"></td>
        </tr>
        <tr>
            <td style="text-align: center; vertical-align: middle">&nbsp;</td>
            <td style="text-align: center; vertical-align: middle" class="auto-style15">&nbsp;</td>
            <td style="text-align: center; vertical-align: middle">&nbsp;</td>
            <td style="text-align: center; vertical-align: middle">
                <asp:LinkButton ID="btnDone" runat="server" Font-Underline="false" OnClick="btnDone_Click" CausesValidation="true" CssClass="linkBtnEditUpdate marginLeft" Width="100px" Height="22px" Text="Thống kê"></asp:LinkButton>
            </td>
            <td style="padding-left: 10px; vertical-align: middle; color: orangered" colspan="3">
                <asp:Label ID="lbMess" runat="server" Text="Từ ngày <= Đến ngày" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <%--    <div class="row">--%>
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
        <div class="row">
            <div class="col-md-6 pr-1">
                <div class="form-group">
                    <span>Doanh số</span>
                    <br />
                    <asp:Chart ID="ctl00" runat="server" BackGradientStyle="LeftRight"
                        BorderlineWidth="0" Height="360px" Width="340px">
                        <Titles>
                            <asp:Title ShadowOffset="10" Name="Items" />
                        </Titles>
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                LegendStyle="Row" />
                        </Legends>
                        <Series>
                            <asp:Series Name="Default" />
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
            <div class="col-md-6 pl-1">
                <div class="form-group">
                    <span>Doanh thu</span>
                    <br />
                    <asp:Chart ID="ctl01" runat="server" BackGradientStyle="LeftRight"
                        BorderlineWidth="0" Height="360px" Width="340px">
                        <Titles>
                            <asp:Title ShadowOffset="10" Name="Items" />
                        </Titles>
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                LegendStyle="Row" />
                        </Legends>
                        <Series>
                            <asp:Series Name="Default" />
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
        </div>
                </div></div></div>
    <div class="row">
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem>Cột</asp:ListItem>
            <asp:ListItem>Tròn</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class="col-md-12"  style="padding-left:15%">
        <div class="card" style="width:700px">
            <div class="card-body">
                <div class="table">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass="grd" DataKeyNames="MAHD" CellPadding="5" Width="543px" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" ShowFooter="True" FooterStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:TemplateField HeaderText="Mã hóa đơn" InsertVisible="False" SortExpression="MAHD">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MAHD") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngày lập hóa đơn" SortExpression="NGAYHD">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("NGAYHD") %>' Width="180px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tài khoản" SortExpression="MATK">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MATK") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tổng thanh toán">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="False" Font-Underline="false" CommandName="Select" Text="Xem" CssClass="linkBtnEditUpdate" Width="60px" Height="20px"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle ForeColor="Orange" HorizontalAlign="Center" Font-Size="Medium" />
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
