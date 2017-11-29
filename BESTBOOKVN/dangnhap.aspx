<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="dangnhap.aspx.cs" Inherits="dangnhap" %>


<asp:Content runat="server" ContentPlaceHolderID="ctpMain">

    <div id="duongdan" style="width:100%;height:50px;float:left;background-color:#68A4C4;margin-bottom:10px">
        <div style="margin-left:15%;margin-top:8px;color:white"><asp:Image ID="Image13" ImageUrl="~/images/home.png" runat="server" />
            <label>/Đăng nhập</label>
        </div>
        </div>
    <div class="clearfix"></div>
    <div style="height:100%;width:100%;margin-left:34%;margin-bottom:15%;margin-top:5%">
        <p><label>Tài khoản:</label><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></p>
        <br />
        <p><label>Mật khẩu:</label><asp:TextBox ID="txtPass" runat="server"></asp:TextBox></p>
        <asp:CheckBox ID="chkghinho" runat="server" Text="Lưu thông tin" />
        <p> <asp:Button ID="btndangnhap" runat="server" Text="Đăng nhập" OnClick="btndangnhap_Click" />
            <asp:Button ID="btnnhaplai" runat="server" Text="Nhập lại" />
            <asp:Button ID="btndangki" runat="server" Text="Đăng kí" />    
        </p>        
    </div>
</asp:Content>