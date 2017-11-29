<%@ Page Language="C#" MasterPageFile="~/index.master"  AutoEventWireup="true" CodeFile="dathang.aspx.cs" Inherits="dathang" %>
<asp:Content runat="server" ContentPlaceHolderID="ctpMain">

    <div style="margin:50px;font-weight:bold;">
<h2 style="font-family:Tahoma, Geneva, sans-serif;color:#F00;text-align:center">Chúng tôi xin cám ơn quí khách đã mua hàng tại website <span style="color:#090">BESTBOOKVN </span></h2><br />
        <asp:DataList ID="datalist" runat="server">
        <ItemTemplate>
           
<p>Nhân viên chúng tôi sẽ giao hàng tại địa chỉ: <asp:Label  ID="lbldiachi" runat="server" Text='<%# Eval("dia_chi") %>'></asp:Label> </p><br />
<p>Người nhận hàng Anh/Chị:<asp:Label  ID="Label1" runat="server" Text='<%# Eval("ten_khach_hang") %>'></asp:Label> </p><br />
<p>Điện thoại liên hệ:<asp:Label  ID="Label2" runat="server" Text='<%# Eval("dien_thoai") %>'></asp:Label> </p><br />
<p>Hình thức thanh toán: Tiền mặt </p><br />             
        </ItemTemplate>     
    </asp:DataList>
 <p>Tổng tiền thanh toán: <asp:Label  ID="lbltongtien" runat="server"></asp:Label> đồng</p><br />
        <h1>Đơn hàng của quí khách</h1><br />
<%--<table width="100%" border="1" cellspacing="0" cellpadding="2" style="border-collapse:collapse;">--%>

   
        <div style="width:100%;border=1">
    <div style="width:72%;float:left;">Sản phẩm</div>
     <div style="width:18%;float:left;">Đơn giá</div>
      <div style="width:6%;float:left;">Số lượng</div>
</div>
       
<%--</table>--%>
        <br />
        <asp:DataList ID="DataListdathang" runat="server"  width="100%" border="1">
       
            <ItemTemplate>         
                <asp:Label ID="lblsanpham" Text='<%#Eval("Name") %>' runat="server"></asp:Label>                            
                <td> <asp:Label  ID="lblgia" Text='<%#Eval("Price") %>' runat="server"></asp:Label></td>    
               <td><asp:Label  ID="lblsoluong" Text='<%#Eval("Quantity") %>' runat="server"></asp:Label></td>          
       </ItemTemplate>

        </asp:DataList>
<a href="trangchu.aspx">Tiếp tục mua hàng...</a>
</div>
</asp:Content>