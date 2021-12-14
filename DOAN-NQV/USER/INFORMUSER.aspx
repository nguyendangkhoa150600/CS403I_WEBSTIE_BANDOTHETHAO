<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" AutoEventWireup="true" CodeBehind="INFORMUSER.aspx.cs" Inherits="DOAN_NQV.USER.INFORMUSER" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link href="../assets/dist/sweetalert.css" rel="stylesheet" />
      <script src="../assets/dist/sweetalert.js"></script>
     <script src="../assets/dist/sweetalert.min.js"></script>
     <link href="https://fonts.googleapis.com/css?family=Wallpoet&display=swap" rel="stylesheet">
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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
    </script>
     <style type="text/css">
        .auto-style2 {
            width: 270px;
        }

        .auto-style3 {
            width: 105%;
           
        }

        .auto-style4 {
            width: 104px;
        }

        .auto-style5 {
            width: 284px;
        }

        .auto-style6 {
            width: 272px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tab" style="margin-top:100px;text-align:center;font-family:Tahoma;font-size:25px;">
        TÀI KHOẢN
    </div>
    <div style="text-align: center;" class="container" >
        <table class="auto-style3">
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" style="vertical-align: bottom">Họ và tên</td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập họ tên!" ForeColor="#ff3300" ControlToValidate="txtHOTEN"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtHOTEN" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" style="vertical-align: bottom">Giới tính</td>
                <td class="auto-style5">
                    <br />
                    <asp:DropDownList ID="ddlGIOITINH" runat="server" CssClass="txt" Width="405px"></asp:DropDownList>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" style="vertical-align: bottom">Địa chỉ</td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập địa chỉ!" ForeColor="#ff3300" ControlToValidate="txtDIACHI"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtDIACHI" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" style="vertical-align: bottom">Số điện thoại</td>
                <td class="auto-style5">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorSDT" runat="server" ControlToValidate="txtSDT"
                        ValidationExpression="(0)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})"
                        ForeColor="#ff3300"
                        ErrorMessage="Số điện thoại không đúng định dạng"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtSDT" runat="server" CssClass="txt" Width="400px" MaxLength="10"></asp:TextBox>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" style="vertical-align: bottom">Gmail</td>
                <td class="auto-style5">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorGMAIL" runat="server" ControlToValidate="txtGMAIL"
                        ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                        ForeColor="#ff3300"
                        ErrorMessage="Gmail không đúng định dạng"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtGMAIL" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" style="vertical-align: bottom">Mật khẩu</td>
                <td class="auto-style5">
<%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập mật khẩu" ControlToValidate="txtMATKHAU" ForeColor="#ff3300"></asp:RequiredFieldValidator>--%>
                    <asp:TextBox ID="txtMATKHAU" runat="server" style="margin-top:26px;" CssClass="txt" Width="400px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
           <%-- <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" style="vertical-align: bottom">Loại tài khoản</td>
                <td class="auto-style5" style="vertical-align: bottom">
                    <br />
                    <asp:DropDownList ID="ddlLOAITK" runat="server" CssClass="txt" Width="405px"></asp:DropDownList>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>--%>
            <tr style="text-align: center;">
                <td class="auto-style6">&nbsp;</td>
                <td colspan="2">
                    <asp:LinkButton ID="btnDone" runat="server" Font-Underline="false" OnClick="btnDone_Click" CausesValidation="true" class="btn btn-warning" style="margin-top:15px;background-color:#ee4d2d;color:#fff;" >Lưu</asp:LinkButton>
                    <asp:LinkButton ID="btnExit" runat="server" Font-Underline="false" CausesValidation="false" OnClientClick="return messExit(this);" OnClick="btnExit_Click" class="btn btn-danger" style="margin-top:15px;">Thoát</asp:LinkButton>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
    </div>
    <br />
    <br />
</asp:Content>
