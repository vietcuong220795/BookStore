<%@ Page Language="C#"  MasterPageFile="~/index.master"   AutoEventWireup="true" CodeFile="trangchu.aspx.cs" Inherits="trangchu"   %>

<asp:Content runat="server" ContentPlaceHolderID="ctpMain"> 
    <div id="duongdan" style="width:100%;height:50px;float:left;background-color:#68A4C4">
        <div style="margin-left:15%;margin-top:8px"><a href="trangchu.aspx"><asp:Image ID="Image13" ImageUrl="~/images/home.png" runat="server" /></a><asp:Label  ID="lbluser" runat="server" ></asp:Label></div>
        </div>
     <asp:DataList ID="datalist"  runat="server" RepeatColumns="4" OnItemCommand="datalist_ItemCommand">
        <ItemTemplate>
            <div id="hang1" style="float:left;width:100%;margin-left:2%;margin-left:65%">
        <div id="sp1" style="margin-right:2%;margin-bottom:2%;float:left;">
            <%--<asp:Image ID="Image1" ImageUrl="~/images/ <%# Eval("hinh") %>" runat="server" />--%>
            <a href=' <%# "chitietsach.aspx?"+string.Format("ID={0}", Eval("id_san_pham")) %> '><img src="images/<%# Eval("hinh") %>" id="Image1" /></a>
            <p>Đơn giá: <asp:Label  ID="lblgia" runat="server" Text='<%# Eval("don_gia") %>'>đ</asp:Label></p>
            <p></p>
            <div><asp:Label  ID="lblten" runat="server" Text='<%# Eval("ten_san_pham") %>'></asp:Label><%--Số lượng:<asp:TextBox ID="txtSoLuong" runat="server" Width="44px"></asp:TextBox>--%>              
                <asp:ImageButton ID="btndathang" runat="server" OnClick="btndathang_Click"   PostBackUrl='<%# "giohang.aspx?action=add&"+string.Format("id={0}&name={1}&price={2}", Eval("id_san_pham"),Eval("ten_san_pham"),Eval ("don_gia")) %>' CommandName="btndathang"  ImageUrl="~/images/bag.png" />
              <%-- <%# "chitietsach.aspx?"+string.Format("ID={0}", Eval("id_san_pham")) %> --%>                                     
           
            </div>           
        </div>      
         </div>       
        </ItemTemplate>     
    </asp:DataList>     
</asp:Content>