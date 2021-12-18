<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" AutoEventWireup="true" CodeBehind="confirm2.aspx.cs" Inherits="DOAN_NQV.Login_v2.confirm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Tran Van Son--%>
     <%--<link href="../assets/assets/dist/sweetalert.css" rel="stylesheet" />
    <script src="../assets/assets/dist/sweetalert.js"></script>
    <script src="../assets/assets/dist/sweetalert.min.js"></script>
    <script>
     
        
       
      

    </script>--%>
    


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="height:380px;">
        <div class="row">
            <div class="col-md-12" style="margin-top:150px;font-size:20px;font-family:Tahoma;color:#440000;">
                <h2 style="text-align:center;">Vui lòng nhập mã xác thực </h2>    
                <asp:TextBox  ID="txtmxt"  placeholder="Mã xác thực" type="text" runat="server" style="margin-left:365px;margin-top:10px;width:400px;" ></asp:TextBox><br />
                <asp:Label ID="lbtb" runat="server" Text="" style="font-family:Tahoma;font-size:19px;margin-left:450px;position:relative;margin-top:10px;color:red;" Visible="false"></asp:Label>
                <asp:Button ID="btncontinue" runat="server" Text="Tiếp Tục" OnClick="btncontinue_Click" OnClientClick="return inform(this,event)" class="btn btn-danger" style="font-family:Tahoma;font-size:19px;margin-left:464px;margin-top:20px;width:200px;" />
            </div>
        </div>
    </div>
</asp:Content>
