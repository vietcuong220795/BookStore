<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="lichsumuahang.aspx.cs" Inherits="lichsumuahang" %>

<asp:Content runat="server" ContentPlaceHolderID="ctpMain"> 
    <div id="duongdan" style="width:100%;height:50px;float:left;background-color:#68A4C4">
        <div style="margin-left:15%;margin-top:8px"><asp:Image ID="Image13" ImageUrl="~/images/home.png" runat="server" /><asp:Label  ID="lbluser" runat="server" ></asp:Label></div>
        </div>
     <asp:DataList ID="datalist"  runat="server" RepeatColumns="4" >
        <ItemTemplate>
            <div id="hang1" style="float:left;width:100%;margin-left:2%;margin-left:65%">
        <div id="sp1" style="margin-right:2%;margin-bottom:2%;float:left;">      
            <p>Mã hoá đơn: <asp:Label  ID="lblgia" runat="server" Text='<%# Eval("ma_hoa_don") %>'></asp:Label></p>
            <p>Ngày đặt: <asp:Label  ID="Label1" runat="server" Text='<%# Eval("ngay_dat") %>'></asp:Label></p>
             <p>Số lượng: <asp:Label  ID="Label2" runat="server" Text='<%# Eval("so_luong") %>'></asp:Label></p>
             <p>Tổng tiền: <asp:Label  ID="Label3" runat="server" Text='<%# Eval("tong_tien") %>'></asp:Label></p>
             <p>ID sản phẩm: <asp:Label  ID="Label4" runat="server" Text='<%# Eval("id_san_pham") %>'></asp:Label></p>
             <p>Mã khách hàng: <asp:Label  ID="Label5" runat="server" Text='<%# Eval("ma_khach_hang") %>'></asp:Label></p>
             <p>Ghi chú: <asp:Label  ID="Label6" runat="server" Text='<%# Eval("ghi_chu") %>'></asp:Label></p>
             <p>Tình trạng: <asp:Label  ID="Label7" runat="server" Text='<%# Eval("tinh_trang") %>'></asp:Label></p>       
            </div>           
        </div>      
         </div>       
        </ItemTemplate>     
    </asp:DataList>     
</asp:Content>