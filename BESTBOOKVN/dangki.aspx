<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="dangki.aspx.cs" Inherits="dangki" %>

<asp:Content runat="server" ContentPlaceHolderID="ctpMain">
    <div id="duongdan" style="width:100%;height:50px;float:left;background-color:#68A4C4;margin-bottom:10px">
        <div style="margin-left:15%;margin-top:8px;color:white"><asp:Image ID="Image13" ImageUrl="~/images/home.png" runat="server" />
            <label>/Đăng kí</label>
        </div>
        </div>
    <div class="clearfix"></div>
    <div style="height:100%;width:100%;margin-left:34%">
        <p><label style="width:100px">Họ tên:</label><asp:TextBox ID="txthoten" runat="server" Width="275px"></asp:TextBox></p>
        <br />
        <p><label style="width:100px">Email:</label><asp:TextBox ID="txtemail" runat="server" Width="275px"></asp:TextBox></p>
         <br />
        
         
        <p><label style="width:100px">Mật khẩu:</label><asp:TextBox ID="txtmatkhau" runat="server" Width="275px"></asp:TextBox></p>
         <br />
        <p><label style="width:100px">Nhập lại mật khẩu:</label><asp:TextBox ID="txtmatkhauRE" runat="server" Width="275px"></asp:TextBox></p>          
         <br />
        <p><label style="width:100px">Địa chỉ:</label><asp:TextBox ID="txtdiachi" runat="server" Width="275px"></asp:TextBox></p>
         <br />
        <p><label style="width:100px">Phái:</label><asp:TextBox ID="txtphai" runat="server" Width="275px"></asp:TextBox></p>
         <br />
        <p><label style="width:100px">Ghi chú:</label><asp:TextBox ID="txtghichu" runat="server" Width="275px"></asp:TextBox></p>
         <br />
        <p><label style="width:100px">Điện thoại:</label><asp:TextBox ID="txtdienthoai" runat="server" Width="275px"></asp:TextBox></p>

       <br />
        <p  style="margin-left:5%;margin-bottom:5px"> 
            <asp:Button ID="btnnhaplai" runat="server" Text="Nhập lại" />
            <asp:Button ID="btndangki" runat="server" Text="Đăng kí" OnClick="btndangki_Click" />    
        </p>
        
    </div>
    <<asp:Label ID="hienthi" runat="server" Text=""></asp:Label>


</asp:Content>