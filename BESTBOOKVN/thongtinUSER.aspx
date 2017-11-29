<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="thongtinUSER.aspx.cs" Inherits="thongtinUSER" %>


<asp:Content runat="server" ContentPlaceHolderID="ctpMain">
    <div id="duongdan" style="width:100%;height:50px;float:left;background-color:#68A4C4;margin-bottom:10px">
      
            
            <div style="margin-left:15%;margin-top:8px"><asp:Image ID="Image1" ImageUrl="~/images/home.png" runat="server" /><label>/Đăng kí</label><asp:Label  ID="lbluser" runat="server" ></asp:Label></div>
   
        </div>
    <div class="clearfix"></div>
    <div style="height:100%;width:100%;margin-left:34%">
        <asp:DataList ID="datalist"  runat="server" RepeatColumns="4">
        <ItemTemplate>
        <p><label style="width:100px">Họ tên:</label><asp:TextBox ID="txthoten" Text='<%# Eval("ten_khach_hang") %>' runat="server" Width="275px"></asp:TextBox></p>
        <br />
        <p><label style="width:100px">Email:</label><asp:TextBox ID="txtemail"  Text='<%# Eval("email") %>' runat="server" Width="275px"></asp:TextBox></p>
         <br />
        <p><label style="width:100px">Địa chỉ:</label><asp:TextBox ID="txtdiachi"  Text='<%# Eval("dia_chi") %>' runat="server" Width="275px"></asp:TextBox></p>
         <br />
        <p><label style="width:100px">Phái:</label><asp:TextBox ID="txtphai"  Text='<%# Eval("phai") %>' runat="server" Width="275px"></asp:TextBox></p>
         <br />
        <p><label style="width:100px">Ghi chú:</label><asp:TextBox ID="txtghichu"  Text='<%# Eval("ghi_chu") %>' runat="server" Width="275px"></asp:TextBox></p>
         <br />
        <p><label style="width:100px">Điện thoại:</label><asp:TextBox ID="txtdienthoai"  Text='<%# Eval("dien_thoai") %>' runat="server" Width="275px"></asp:TextBox></p>
 </ItemTemplate>
            </asp:DataList>
       <br />
        <p  style="margin-left:5%;margin-bottom:5px"> 
            <asp:Button ID="btnnhaplai" runat="server" Text="Nhập lại" />
            <asp:Button ID="btnSua" runat="server" Text="Sửa thông tin" OnClick="btnSua_Click" />    
        </p>
       
    </div>
    <<asp:Label ID="hienthi" runat="server" Text=""></asp:Label>


</asp:Content>