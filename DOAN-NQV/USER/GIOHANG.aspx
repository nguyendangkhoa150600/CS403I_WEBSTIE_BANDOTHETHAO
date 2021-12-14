<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="GIOHANG.aspx.cs" Inherits="DOAN_NQV.USER.GIOHANG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
          <div class="tgh" style="margin-top:120px;">
            <h2 style="text-align: center">
                <span style="color: forestgreen;font-size:40px;font-family:Tahoma;">GIỎ HÀNG</span>
                 <br />
                  <br />
  
            </h2>
        </div>
    <div class="text-center">
        <asp:Label ID="lb1" runat="server" Text="Không có sản phẩm nào trong giỏ hàng" style="font-size:19px;font-family:Tahoma;font-weight:bold;color:#FF0000;margin-top:50px;"></asp:Label>
    </div>

    <div class="text-center">
        <asp:Label ID="lbtbcdh" runat="server" Text="Bạn chưa chọn sản phẩm nào" style="font-size:19px;font-family:Tahoma;font-weight:bold;color:#FF0000;margin-top:50px;" Visible="false"></asp:Label>
    </div>
    

    <div class="text-center">
        <asp:Button ID="btn1" runat="server" Text="TIẾP TỤC MUA SẮM" OnClick="btnMuaSam_Click" style="margin-top:50px;"  class="btn btn-success" />
    </div>
    <div style="margin-top: 40px;">
       
        <div class="text-center" style="margin-top:-30px;">
            <asp:GridView ID="grdGioHang" runat="server" CssClass="stlGrd" AutoGenerateColumns="False" HorizontalAlign="Center" Width="100%" >
               
                <Columns>
                  <asp:BoundField DataField="MACTSP" HeaderText="Mã CT phẩm"  />
                    <%--<asp:BoundField DataField="MASP" HeaderText="Mã sản phẩm"  />--%>
                    <asp:BoundField DataField="TENSP" HeaderText="Tên sản phẩm" />
                    <asp:TemplateField HeaderText="Hình ảnh">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#"~/images/" + Eval("HINHANH")%>' Width="50px" Height="50px"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" />
                    <asp:TemplateField HeaderText="Số lượng" FooterText="Tổng :">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDecreate" runat="server" CommandName="DecreateQuantity"
                                        OnCommand="btnDecreateQuantity_Click" CommandArgument=<%# Eval("MACTSP") %> Text="-" class="btn btn-xs btn-danger"></asp:LinkButton>
                            <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("SOLUONG") %>' Width="52px"></asp:TextBox>
                            <asp:LinkButton ID="btnIncreate" runat="server" CommandName="IncreateQuantity"
                                        OnCommand="btnIncreateQuantity_Click" CommandArgument=<%# Eval("MACTSP") %> Text="+" class="btn btn-xs btn-danger"></asp:LinkButton>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtQuantity"
                                ErrorMessage="CompareValidator" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                        </ItemTemplate>
                        <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                 </asp:TemplateField>
                       <%--<asp:BoundField DataField="MASIZE" HeaderText="Mã Size"/>--%>
                    <asp:BoundField DataField="TENSIZE" HeaderText="Tên Size" />
                    <%--<asp:BoundField DataField="MAMAU" HeaderText="Mã Màu"/>--%>
                    <asp:BoundField DataField="TENMAU" HeaderText="Tên Màu" />
                    <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" />
                 

                    

                     <asp:TemplateField>
                        <ItemTemplate>
                            <div class="clears">
                              <asp:Button ID="btnRemove" runat="server" class="fas fa-times" style="color:red;border:none;background:white;width:80px;" CommandArgument=<%# Eval("MASP") %>  OnClick="btnRemove_Click1" Text="X"  />
                                </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField>
                        <ItemTemplate>

                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                       
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
        </div>
        <br />
        <div class="text-center" style="padding-bottom:70px;">
           <%-- <asp:Button ID="btnRemove" runat="server" OnClick="btnRemove_Click1" Text="Trả hàng" CssClass="stlBtn" />--%>
            <asp:Button ID="btnMuaSam1" runat="server" OnClick="btnMuaSam_Click1" Text="Tiếp tục mua sắm" class="btn btn-success" style="margin-top:50px;" />   
            <asp:Button ID="btnXacNhanGH" runat="server"  OnClick="btnXacNhanGH_Click" Text="Đặt Hàng"  class="btn btn-success confirm" style="background-color:#ee4d2d;width:150px;height:38px;border:1px solid #ee4d2d;margin-left:400px;margin-top:50px;" />
            
        </div>
    </div>
  
</asp:Content>
