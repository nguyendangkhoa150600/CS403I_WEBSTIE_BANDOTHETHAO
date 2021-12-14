<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" AutoEventWireup="true" CodeBehind="DSDATHANG.aspx.cs" Inherits="DOAN_NQV.USER.DSDATHANG" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/dist/sweetalert.css" rel="stylesheet" />
    <script src="../assets/dist/sweetalert.js"></script>
    <script src="../assets/dist/sweetalert.min.js"></script>


    <script>
        var object = { status: false, ele: null };
        function deleteRow(ev) {
            if (object.status) { return true; }
            swal({
                title: "Hủy đơn hàng?",
                text: "Bạn có muốn hủy đơn hàng này không?",
                type: "warning",
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Có!",
                showCancelButton: true,
                cancelButtonText: "Không",
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

              
   
    <div style="margin-top: 100px;">
                   
         
         <div class="statusDH" style="width:100%;display:inline;">
            <div class="statusNAME" style="font-family:Tahoma;font-size:19px;text-decoration:none;margin-left:250px;height:40px;background-color:rgba(0, 0, 0, 0.26);width:950px;">
                  
                
                <asp:LinkButton ID="LinkButton1" runat="server" href="DSDATHANG.aspx" class="tenTT" style="padding-right:100px;padding-left:38px;color:#111111;color:#FFCC66;">Chờ duyệt</asp:LinkButton>
                <asp:LinkButton ID="LinkButton6" runat="server"  href="SECONDSTATUS.aspx" class="tenTT" style="padding-right:100px;color:#111111;">Đã duyệt</asp:LinkButton>
                 <asp:LinkButton ID="LinkButton2" runat="server" href="THIRDSTATUS.aspx" class="tenTT" style="padding-right:100px;color:#111111;">Đang vận chuyển</asp:LinkButton>
<%--                <asp:LinkButton ID="LinkButton3" runat="server"  class="tenTT" style="padding-right:100px;color:#111111;">Thanh toán</asp:LinkButton>--%>
                <asp:LinkButton ID="LinkButton4" runat="server"  href="FOURTHSTATUS.aspx" class="tenTT" style="padding-right:100px;color:#111111;">Đã thanh toán</asp:LinkButton>
                <asp:LinkButton ID="LinkButton5" runat="server"  href="FINALSTATUS.aspx" class="tenTT" style="padding-right:10px;color:#111111;">Hủy</asp:LinkButton>
         


                
                
                
                <%--<a href="#" class="ttt" style="padding-right:100px;padding-left:38px;color:#111111;">Chờ duyệt</a>--%>

                   <%-- <a href="#" class="ttt" style="padding-right:100px;color:#111111;">Đã duyệt</a>
                    <a href="#" class="ttt" style="padding-right:100px;color:#111111;">Đang vận chuyển</a>
                    <a href="#" class="ttt" style="padding-right:100px;color:#111111;">Thanh toán</a>
                    <a href="#" class="ttt" style="padding-right:100px;color:#111111;">Hoàn tất</a>
                 <a href="#" class="ttt" style="padding-right:100px;color:#111111;">Hủy</a>--%>
            </div>
          
              

        </div>
        <div>
            <h2 style="text-align: center;margin-top:35px;" >
                <span style="color: forestgreen;font-size:40px;font-family:Tahoma;">Đơn Hàng Của Bạn</span>
            </h2>
        </div>

         <div class="text-center" style="margin-top:35px;">
                     <asp:Label ID="lb1" runat="server" Text="Không có sản phẩm nào trong giỏ hàng" style="font-size:19px;font-family:Tahoma;font-weight:bold;color:#FF0000;margin-top:50px;" Visible="false"></asp:Label>
             </div>   
       
        <div class="text-center"style="margin-top: 35px;" >
            <asp:GridView ID="grpHoaDon" runat="server" CssClass="stlGrd" AutoGenerateColumns="false"  GridLines="None" ShowFooter="false" HorizontalAlign="Center" Width="100%" OnSelectedIndexChanging="grpHoaDon_SelectedIndexChanging" OnRowDeleting="grpHoaDon_RowDeleting" Height="200px">
                <Columns>
                    
                     <asp:BoundField DataField="MAHD" HeaderText="Mã Hóa Đơn"/>
                    <%--<asp:TemplateField HeaderText="Hình ảnh">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#"~/images/" + Eval("HINHANH")%>' Width="50px" Height="50px"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>    --%>
                     <asp:BoundField DataField="NGAYHD" HeaderText="Ngày lập"  DataFormatString="{0:dd/MM/yyyy}"  />
                    <asp:BoundField DataField="TENTT" HeaderText="Trạng Thái" />
                        <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" />
                     <%--<asp:BoundField DataField="DONGIA" HeaderText="Đơn Giá" />--%>
                   
                    <%--<asp:BoundField DataField="MATT" HeaderText="Trạng thái" />--%>
                   
                 <%--   <asp:BoundField DataField="SODIENTHOAI" HeaderText="Số điện thoại" />
                    <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
                    <asp:BoundField DataField="TENTT" HeaderText="Trạng Thái" />--%>

                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btxemdh" runat="server" CommandName="select" Text="Xem Đơn Hàng" class="btn btn-success "  />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnhuy" runat="server" CommandName="delete" OnClientClick="return deleteRow(this);"   Text="Hủy Đơn Hàng" class="btn btn-danger "   />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
               <%--<FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />--%>
            </asp:GridView>
          </div>



        <div class="text-center"style="margin-top:20px;" >
            <asp:GridView ID="grxdh" runat="server" CssClass="stlGrdnew" AutoGenerateColumns="false" CellPadding="10"  GridLines="None" ShowFooter="false" HorizontalAlign="Center" Width="100%" OnSelectedIndexChanging="grpHoaDon_SelectedIndexChanging" Height="100px">
                <Columns>
                    
                     <asp:BoundField DataField="TENSP" HeaderText="Tên Sản Phẩm"/>
                    <asp:TemplateField HeaderText="Hình ảnh">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#"~/images/" + Eval("HINHANH")%>' Width="50px" Height="50px"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>    
                     <asp:BoundField DataField="NGAYHD" HeaderText="Ngày lập"  DataFormatString="{0:dd/MM/yyyy}"  />
                     <asp:BoundField DataField="SODIENTHOAI" HeaderText="Số điện thoại" />
                    <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
                    <asp:BoundField DataField="SOLUONG" HeaderText="Số Lượng" />
                     <asp:BoundField DataField="TENSIZE" HeaderText="Tên Size" />
                     <asp:BoundField DataField="TENMAU" HeaderText="Tên màu" />
                     <asp:BoundField DataField="DONGIA" HeaderText="Đơn Giá" />
                        <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" />
                     <%--<asp:BoundField DataField="DONGIA" HeaderText="Đơn Giá" />--%>
                   
                    <%--<asp:BoundField DataField="MATT" HeaderText="Trạng thái" />--%>
                   
                  <%--  <asp:BoundField DataField="SODIENTHOAI" HeaderText="Số điện thoại" />
                    <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />--%>
                    <%--<asp:BoundField DataField="TENTT" HeaderText="Trạng Thái" />--%>

                   

                    
                </Columns>
               <%--<FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />--%>
            </asp:GridView>
          </div>
        <br /><br />


          <div class="text-center">
   
            <asp:Button ID="btnMuaSam1" runat="server" OnClick="btnMuaSam_Click1" Text="Tiếp tục mua sắm" class="btn btn-success "  />
        </div>
        </div>
      <br /><br />
</asp:Content>
