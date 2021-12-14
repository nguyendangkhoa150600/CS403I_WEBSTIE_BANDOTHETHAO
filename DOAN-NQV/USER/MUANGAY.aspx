<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" AutoEventWireup="true" CodeBehind="MUANGAY.aspx.cs" Inherits="DOAN_NQV.USER.MUANGAY" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }

        .btnMua {
            background-color: orangered;
            color: white;
            width: 200px
        }

        .ddlPTTT {
            border-radius: 5px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <div>
        <h2 style="text-align: center">
            <span style="color: forestgreen">XÁC NHẬN ĐƠN HÀNG</span>
        </h2>
    </div>
    <div class="tb-payment" style="margin-left: 50px;">
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:GridView ID="grdGioHang" runat="server" CssClass="stlGrd" AutoGenerateColumns="False" ShowFooter="True" HorizontalAlign="Center" Width="850px">
                        <Columns>
                            <asp:BoundField DataField="MASP" HeaderText="Mã sản phẩm" Visible="false" />
                            <asp:BoundField DataField="TENSP" HeaderText="Tên sản phẩm" ItemStyle-Width="400px">
                                <ItemStyle Width="400px"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Hình ảnh" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Image runat="server" ImageUrl='<%#"~/images/" + Eval("HINHANH")%>' Width="50px" Height="50px"></asp:Image>
                                </ItemTemplate>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" ItemStyle-Width="100px">

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="TENSIZE" HeaderText="Tên Size" ItemStyle-Width="100px">

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="TENMAU" HeaderText="Tên màu" ItemStyle-Width="100px">

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" ItemStyle-Width="100px">
                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>


                            <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" ItemStyle-Width="150px">
                                <ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Visible="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </td>
                <td>
                    <table style="width: 400px;">
                        <tr>
                            <td colspan="4" style="text-align: center; background-color: lightgray">
                                <span style="color: #FF3300;">ĐỊA CHỈ NHẬN HÀNG
                                </span>
                            </td>
                        </tr>

                        <tr>
                            <td>Tên Người Mua</td>

                            <td colspan="5">
                                <asp:Label ID="tennd" runat="server" Text="" Style="font-weight: bold; color: #33CC66; font-family: Tahoma; font-size: 19px;"> </asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Địa chỉ</td>
                            <td colspan="5">


                                <asp:TextBox ID="txtDiaChi" runat="server" Text=""></asp:TextBox>

                            </td>



                        </tr>
                        <tr>
                            <td colspan="8">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập địa chỉ" Style="float: right" ForeColor="Red" ControlToValidate="txtDiaChi"></asp:RequiredFieldValidator></td>

                        </tr>
                        <tr>
                            <td>Số điện thoại</td>
                            <td colspan="5">
                                <asp:TextBox ID="txtSoDienThoai" runat="server" Text="" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập số điện thoại" Style="float: right" ForeColor="Red" ControlToValidate="txtSoDienThoai"></asp:RequiredFieldValidator>
                                <%--                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="(0)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})"
                                    style="float:right;" ForeColor="Red" ErrorMessage="Số điện thoại không đúng định dạng" ControlToValidate="txtSoDienThoai"></asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>

                        <tr>
                            <td>Gmail</td>
                            <td>
                                <asp:Label ID="gmail" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; background-color: lightgray">
                                <span style="color: #FF3300;">THÔNG TIN ĐƠN HÀNG
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>Tạm tính</td>
                            <td>
                                <asp:Label ID="tamtinh" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Phí giao hàng</td>
                            <td>
                                <asp:Label ID="phigh" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Tổng cộng</td>
                            <td>
                                <asp:Label ID="tongcong" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; background-color: lightgray">
                                <span style="color: #FF3300;">PHƯƠNG THỨC THANH TOÁN
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; width: 100%;">
                                <asp:DropDownList ID="ddlPTTT" runat="server" CssClass="ddlPTTT">
                                    <asp:ListItem>Thanh toán khi nhận hàng</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; width: 100%">
                                <asp:LinkButton ID="btnMua" runat="server" class="btn btn-success " Style="background-color: #ee4d2d; width: 150px; height: 38px; border: 1px solid #ee4d2d;" OnClick="btnMua_Click" Font-Underline="false">
                                    ĐẶT HÀNG
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <br />
    <br />
</asp:Content>
