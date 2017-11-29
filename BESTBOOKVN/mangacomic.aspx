<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="mangacomic.aspx.cs" Inherits="mangacomic" %>

<asp:Content runat="server" ContentPlaceHolderID="ctpMain"> 
    <div id="duongdan" style="width:100%;height:50px;float:left;background-color:#68A4C4">
        <div style="margin-left:15%;margin-top:8px"><a href="trangchu.aspx"><asp:Image ID="Image13" ImageUrl="~/images/home.png" runat="server" /></a><asp:Label  ID="lbluser" runat="server" ></asp:Label></div>
        </div>
     <asp:DataList ID="datalist" runat="server" RepeatColumns="4">
        <ItemTemplate>
            <div id="hang1" style="float:left;width:100%;margin-left:2%;margin-left:65%">
        <div id="sp1" style="margin-right:2%;margin-bottom:2%;float:left;">
           
            <a href=' <%# "chitietsach.aspx?"+string.Format("ID={0}", Eval("id_san_pham")) %> '><img src="images/<%# Eval("hinh") %>" id="Image1" /></a>
            <p>Đơn giá: <asp:Label  ID="lblgia" runat="server" Text='<%# Eval("don_gia") %>'>đ</asp:Label></p>
            <p></p>
            <div><asp:Label  ID="lblten" runat="server" Text='<%# Eval("ten_san_pham") %>'></asp:Label>              
                <asp:ImageButton ID="btndathang" runat="server"  PostBackUrl='<%# "giohang.aspx?action=add&"+string.Format("id={0}&name={1}&price={2}", Eval("id_san_pham"),Eval("ten_san_pham"),Eval ("don_gia")) %>'  ImageUrl="~/images/bag.png" />                                                      
            </div>           
        </div>      
         </div>       
        </ItemTemplate>     
    </asp:DataList>     
</asp:Content>