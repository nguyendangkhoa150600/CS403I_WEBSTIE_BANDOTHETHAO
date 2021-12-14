<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" AutoEventWireup="true" CodeBehind="DMK.aspx.cs" Inherits="DOAN_NQV.USER.DMK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="height:380px;">
        <div class="row">
            <div class="col-md-12" style="margin-top:150px;font-size:20px;font-family:Tahoma;color:#440000;">
                <h2 style="text-align:center;">Vui lòng nhập mật khẩu để tiếp tục</h2>
                
                



                <asp:TextBox  ID="txtmk"  placeholder="Mật khẩu hiện tại" type="password" runat="server" style="margin-left:365px;margin-top:10px;width:400px;" ></asp:TextBox><br />
                <asp:Label ID="lbtb" runat="server" Text="" style="font-family:Tahoma;font-size:19px;margin-left:500px;position:relative;margin-top:10px;color:red;" Visible="false"></asp:Label>
                <asp:Button ID="btncontinue" runat="server" Text="Tiếp Tục" OnClick="btncontinue_Click" class="btn btn-danger" style="font-family:Tahoma;font-size:19px;margin-left:464px;margin-top:20px;width:200px;" />
            </div>
        </div>
    </div>
</asp:Content>
