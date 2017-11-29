<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="chitietsach.aspx.cs" Inherits="chitietsach" %>

<asp:Content runat="server" ContentPlaceHolderID="ctpMain"> 
    <div id="duongdan" style="width:100%;height:50px;float:left;background-color:#68A4C4">
        <div style="margin-left:15%;margin-top:8px"><asp:Image ID="Image13" ImageUrl="~/images/home.png" runat="server" /><asp:Label  ID="lbluser" runat="server" ></asp:Label></div>
        </div>
     <asp:DataList ID="datalist"  runat="server" RepeatColumns="4" >
        <ItemTemplate>
            <div id="hang1" style="float:left;width:100%;margin-left:200%">
       
            <%--<asp:Image ID="Image1" ImageUrl="~/images/ <%# Eval("hinh") %>" runat="server" />--%>
            
            <div style="float:left"><img src="images/<%# Eval("hinh") %>" id="Image1" /></div>
         
            <p>Đơn giá: <asp:Label  ID="lblgia" runat="server" Text='<%# Eval("don_gia") %>'>đ</asp:Label></p>
            <p>ID sản phẩm: <asp:Label  ID="Label1" runat="server" Text='<%# Eval("id_san_pham") %>'></asp:Label></p>
            <p>Mã sản phẩm: <asp:Label  ID="Label2" runat="server" Text='<%# Eval("ma_san_pham") %>'></asp:Label></p>
            <p>Tên sản phẩm: <asp:Label  ID="Label3" runat="server" Text='<%# Eval("ten_san_pham") %>'></asp:Label></p>
            <p>Mã loại: <asp:Label  ID="Label4" runat="server" Text='<%# Eval("ma_loai") %>'></asp:Label></p>
              <p>Mô tả chi tiết: <asp:Label  ID="Label5" runat="server" Text='<%# Eval("mo_ta_chi_tiet") %>'></asp:Label></p>
              <p>Đơn giá: <asp:Label  ID="Label6" runat="server" Text='<%# Eval("don_gia") %>'></asp:Label></p>
              <p>Đơn vị tính: <asp:Label  ID="Label7" runat="server" Text='<%# Eval("dvt") %>'></asp:Label></p>
              <p>Tình trạng: <asp:Label  ID="Label8" runat="server" Text='<%# Eval("tinh_trang") %>'></asp:Label></p>
              <p>Tác giả: <asp:Label  ID="Label9" runat="server" Text='<%# Eval("tac_gia") %>'></asp:Label></p>
              <p>Nhà xuất bản: <asp:Label  ID="Label10" runat="server" Text='<%# Eval("nxb") %>'></asp:Label></p>
              <p>Số trang: <asp:Label  ID="Label11" runat="server" Text='<%# Eval("so_trang") %>'></asp:Label></p>                   
         
         </div>       
        </ItemTemplate>     
    </asp:DataList>     
</asp:Content>