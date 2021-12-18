<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" AutoEventWireup="true" CodeBehind="DMKLOGIN.aspx.cs" Inherits="DOAN_NQV.Login_v2.DMKLOGIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Tran Van Son--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="height:420px;">
        <div class="row">
            <div class="col-md-12" style="margin-top:150px;font-size:20px;font-family:Tahoma;color:#440000;">
                <h2 style="text-align:center;">Nhập mật khẩu mới</h2>
            <asp:TextBox  ID="txtmkm" placeholder="Mật khẩu mới" type="password" runat="server" style="margin-left:365px;margin-top:10px;width:400px;" ></asp:TextBox><br />
            <asp:TextBox  ID="txtmkm2" placeholder="Xác nhận mật khẩu" type="password" runat="server" style="margin-left:365px;margin-top:10px;width:400px;" ></asp:TextBox><br />
           <asp:Label ID="lbtb" runat="server" Text="" style="font-family:Tahoma;font-size:19px;margin-left:430px;text-align:center;position:relative;margin-top:10px;color:red;" Visible="false"></asp:Label>

             <asp:Button ID="btnfconfirm" runat="server" OnClick="btnfconfirm_Click" Text="Xác nhận" class="btn btn-danger" style="font-family:Tahoma;font-size:19px;margin-left:464px;margin-top:20px;width:200px;"/>
            </div>
        </div>
    </div>
</asp:Content>
