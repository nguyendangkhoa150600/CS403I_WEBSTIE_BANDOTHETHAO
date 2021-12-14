<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" AutoEventWireup="true" CodeBehind="HTTHANHTOAN.aspx.cs" Inherits="DOAN_NQV.USER.HTTHANHTOAN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <div style="text-align: center">
        <span style="font-size:19px;color:limegreen;font-family:Tahoma;font-weight:bold;">
            MUA HÀNG THÀNH CÔNG
        </span>
    </div>
    
    <div style="text-align: center;margin-top:100px;">
        <asp:Button ID="btnMuaSam1" runat="server" OnClick="btnMuaSam_Click1" Text="Tiếp tục mua sắm" class="btn btn-success" />
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
