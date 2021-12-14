<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" AutoEventWireup="true" CodeBehind="CTSP.aspx.cs" Inherits="DOAN_NQV.USER.CTSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #main-content{
            overflow:hidden!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"  >
    <br />
    <br />
    <br />

    <div style="text-align: center">
        <asp:Label ID="tbDangNhap" runat="server" Text="BẠN CẦN PHẢI ĐĂNG NHẬP TRƯỚC KHI MUA HÀNG" CssClass="stLb" Visible="false" Style="font-size: 20px; color: red;"></asp:Label>
    </div>
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row" style="height: 300px;">
            <div class="col-md-4" style="border: 1px solid #808080; text-align: center; vertical-align: middle">
                <asp:Image ID="Image1" runat="server" Width="300px" Height="300px" />
            </div>

            <div class="col-md-5" style="padding-left: 50px">
                <br />
                <br />
                <div>
                    <h1 class="card-title" style="font-size: 23px; margin-top: -50px; text-align: center;"><%= TenSP %> </h1>
                    <p class="card-text" style="font-size: 19px; font-family: Tahoma; text-align: left; margin-top: 5px;"><span style=" padding-right: 5px;color:rgb(142, 142, 142);">Đơn Giá:</span> <%= ThanhTien %> đ </p>
                    <div class="row" style="margin-left: -2px; margin-top: -12px;">
                        <span class="card-text" style="text-decoration: line-through; color: gray; padding-right: 5px;"><%= DonGia %></span>
                        <span class="card-text" style="color: black; font-weight: bold;"><%= Tyle %></span>
                    </div>
                    <p12 style="font-size: 19px; font-family: Tahoma; margin-top: 45px; margin-top: 45px;"><span style="color:rgb(142, 142, 142);">Mô Tả Sản Phẩm: </span> <%= ChiTietSP %> </p12>
                </div>

            </div>

        </div>
    </div>

      <div class="size-bar" style="position:absolute; top:66%;left:41%;font-size: 17px; font-family: Tahoma;text-decoration:none;">
                 <asp:Label ID="Label2" runat="server" Text="" style="color:rgb(142, 142, 142);font-size:19px;">Size:<span style="color:#212529;"> </span></asp:Label>
             <%--   <asp:Repeater ID="rpsize" runat="server">
                <ItemTemplate>                 
           
            
                <asp:LinkButton ID="LinkButton3" class="link-size link-item" runat="server" style="color:#000000;font-size:18px;">           
                    <%# Eval("TENSIZE") %> 
                  </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>--%>
                 <asp:DropDownList ID="listSize" runat="server" DataTextField="TenSize" DataValueField="MaSize" AutoPostBack="true" OnSelectedIndexChanged="listSize_SelectedIndexChanged"></asp:DropDownList>
            </div>
   

            <div class="color-bar" style="position:absolute; top:66%;left:56%;font-size: 17px; font-family: Tahoma;text-decoration:none;">
                   <asp:Label ID="Label1" runat="server" Text="" style="color:rgb(142, 142, 142);font-size:19px;">Màu sắc: <span style="color:#212529;"></span></asp:Label>
              <%--  <asp:Repeater ID="rpcolor" runat="server">
                <ItemTemplate>       
                      <asp:LinkButton ID="LinkButton5" runat="server" class="link-color link-item"  style="color:#000000;font-size:18px;">    
                                 <%# Eval("TENMAU") %> 
                    </asp:LinkButton>
               </ItemTemplate>
            </asp:Repeater>--%>
                <asp:DropDownList ID="listMau" runat="server" DataTextField="TenMau" DataValueField="MaMau" AutoPostBack="true" OnSelectedIndexChanged="listMau_SelectedIndexChanged"></asp:DropDownList>

    </div>
    <asp:Repeater ID="rpChiTiet" runat="server">

        <ItemTemplate>
            <br />
          
            <br />
            <br />
        </ItemTemplate>
    </asp:Repeater>

    

   
    <%--padding-left: 620px; margin-top: -100px; --%>

    <div style="position: absolute; top:510px;left:620px;">
        <span style="font-size: 19px;color:rgb(142, 142, 142);">Số lượng: 
        </span>
        <asp:DropDownList ID="ddlSoLuong" runat="server" DataTextField="Số lượng"></asp:DropDownList>
    </div>

    <div class="function_ctsp" style="display:flex;width: 200px; border-radius: 20px;gap:100px;position:absolute;top:77%;left:41%;" >
        <%--margin-top: -400px; width: 200px; border-radius: 20px; margin-left: 600px;--%>
        <div class="btn btn-danger nut1" style=" border-radius: 20px;">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="gioHang_Click" Style="text-decoration: none;"><span style="color:aqua;text-decoration:none;"><i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng </span></asp:LinkButton>
        </div>
      <%--  margin-top: -450px; width: 200px; border-radius: 20px; margin-left: 900px;--%>
        <div class="btn btn-danger nut1" style=" border-radius: 20px;">
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="muaNgay_Click" Style="text-decoration: none;"><span style="color:aqua;text-decoration:none;">Mua ngay</span></asp:LinkButton>
        </div>
    </div>



</asp:Content>
