<%@ Page Title="" Language="C#" MasterPageFile="~/SHARED/MP.Master" AutoEventWireup="true" CodeBehind="DSSP.aspx.cs" Inherits="DOAN_NQV.USER.DSSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .lb{
            text-decoration:line-through;
            color:lightgrey;
        }
        .lb1{
            color:gray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- SLIDE--%>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="../images/slide5.png" alt="First slide" style="width: 100%; margin-top: 4.6%;">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="../images/slide6.png" alt="Second slide" style="width: 100%; margin-top: 4.6%;">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="../images/slide4.jpg" alt="Third slide" style="width: 100%; margin-top: 4.6%;">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="../images/slide1.jpg" alt="Third slide" style="width: 100%; margin-top: 4.6%;">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <%-- SLIDE--%>

    <br />

    <%--PRODUCTS--%>
    <%-- 1 --%>

    <asp:Repeater ID="td1" runat="server">
        <ItemTemplate>
            <%--   <asp:Label ID="Label1" style="border-top: none;" class="tsp text-center" runat="server" Text=""><%# Eval("TENDM") %></asp:Label>--%>
            <div class="tsp text-center" style="border-top: none;"><%# Eval("TENDM") %></div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:DataList ID="dssp1" runat="server" RepeatColumns="5" OnSelectedIndexChanged="dssp1_SelectedIndexChanged">

        <ItemTemplate>

            <div class="nen">

                <asp:HyperLink ID="btnxct" NavigateUrl='<%# "~/USER/CTSP.aspx?MASP=" + Eval("MASP") %>' runat="server" class="btn btn-info nut">Xem chi tiết</asp:HyperLink>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/" + Eval("HINHANH")%>' Width="200px"/>
                <div class="card-body">
                    <h4 class="card-title"><%# Eval("TENSP") %> </h4>
                    <p class="card-text"><%# Eval("THANHTIEN") %> đ</p>
                    <div class="row" style="text-align:center">
                        <span class="card-text" style="text-decoration: line-through;color:gray;margin-left:95px"><%# Eval("DONGIA") %></span>
                        <span class="card-text" style="margin-left:10px;color:black"><%# Eval("TYLE") %></span>
<%--                        <span class="card-text" style="margin-left:10px;color:black"><%# Eval("TENSIZE") %></span>
                        <span class="card-text" style="margin-left:10px;color:black"><%# Eval("TENMAU") %></span>--%>
                    </div>
                </div>
                <br />
                <div class="layer"></div>
            </div>
            </div>

        </div>
            
        </ItemTemplate>
    </asp:DataList>
    <%-- 1 --%>
    <br />

    <%-- 2 --%>
    <asp:Repeater ID="td2" runat="server">
        <ItemTemplate>
            <%--  <asp:Label ID="lbdm2" style="border-top: none;" class="tsp text-center" runat="server" Text=""><%# Eval("TENDM") %></asp:Label>--%>
            <div class="tsp text-center" style="border-top: none;"><%# Eval("TENDM") %></div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:DataList ID="dssp2" runat="server" RepeatColumns="5" OnSelectedIndexChanged="dssp2_SelectedIndexChanged">

        <ItemTemplate>

            <div class="nen">
                <asp:HyperLink ID="btnxct" NavigateUrl='<%# "~/USER/CTSP.aspx?MASP=" + Eval("MASP") %>' runat="server" class="btn btn-info nut">Xem chi tiết</asp:HyperLink>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/" + Eval("HINHANH")%>' Width="200px" />
                <div class="card-body">
                     <h4 class="card-title"><%# Eval("TENSP") %> </h4>
                    <p class="card-text"><%# Eval("THANHTIEN") %> đ</p>
                    <div class="row" style="text-align:center">
                        <span class="card-text" style="text-decoration: line-through;color:gray;margin-left:95px"><%# Eval("DONGIA") %></span>
                        <span class="card-text" style="margin-left:10px;color:black"><%# Eval("TYLE") %></span>
<%--                        <span class="card-text" style="margin-left:10px;color:black"><%# Eval("TENSIZE") %></span>
                        <span class="card-text" style="margin-left:10px;color:black"><%# Eval("TENMAU") %></span>--%>
                    </div>
                </div>
                <br />
                <div class="layer"></div>
            </div>

            </div>
           
        </div>
          
            
        </ItemTemplate>
    </asp:DataList>
    <%--2--%>


    <br />



    <%-- 3 --%>
    <asp:Repeater ID="td3" runat="server">
        <ItemTemplate>
            <div class="tsp text-center" style="border-top: none;"><%# Eval("TENDM") %></div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:DataList ID="dssp3" runat="server" RepeatColumns="5">

        <ItemTemplate>

            <div class="nen">

                <asp:HyperLink ID="btnxct" NavigateUrl='<%# "~/USER/CTSP.aspx?MASP=" + Eval("MASP") %>' runat="server" class="btn btn-info nut">Xem chi tiết</asp:HyperLink>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/" + Eval("HINHANH")%>' Width="200px" />
                <div class="card-body">
                    <h4 class="card-title"><%# Eval("TENSP") %> </h4>
                    <p class="card-text"><%# Eval("THANHTIEN") %> đ</p>
                    <div class="row" style="text-align:center">
                        <span class="card-text" style="text-decoration: line-through;color:gray;margin-left:95px"><%# Eval("DONGIA") %></span>
                        <span class="card-text" style="margin-left:10px;color:black"><%# Eval("TYLE") %></span>
                    </div>
                </div>
                <br />
                <div class="layer"></div>
            </div>
            </div>

        </div>
            
        </ItemTemplate>
    </asp:DataList>
    <%--3--%>
    <br />

    <%--4 --%>
    <asp:Repeater ID="td4" runat="server">
        <ItemTemplate>
            <div class="tsp text-center" style="border-top: none;"><%# Eval("TENDM") %></div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:DataList ID="dssp4" runat="server" RepeatColumns="5">

        <ItemTemplate>

            <div class="nen">
                <asp:HyperLink ID="btnxct" NavigateUrl='<%# "~/USER/CTSP.aspx?MASP=" + Eval("MASP") %>' runat="server" class="btn btn-info nut">Xem chi tiết</asp:HyperLink>

                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/" + Eval("HINHANH")%>' Width="200px" />
                <div class="card-body">
                    <h4 class="card-title"><%# Eval("TENSP") %> </h4>
                    <p class="card-text"><%# Eval("THANHTIEN") %> đ</p>
                    <div class="row" style="text-align:center">
                        <span class="card-text" style="text-decoration: line-through;color:gray;margin-left:95px"><%# Eval("DONGIA") %></span>
                        <span class="card-text" style="margin-left:10px;color:black"><%# Eval("TYLE") %></span>
                    </div>
                </div>
                <br />
                <div class="layer"></div>
            </div>
            </div>

        </div>
            
        </ItemTemplate>
    </asp:DataList>
    <%--4--%>
    <br />
    <%--PRODUCTS--%>
    <script src="../SHARED/mp.js"></script>


</asp:Content>
