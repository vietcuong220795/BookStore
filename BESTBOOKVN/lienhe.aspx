<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="lienhe.aspx.cs" Inherits="lienhe" %>

<asp:Content runat="server" ContentPlaceHolderID="ctpMain">
    <div id="duongdan" style="width:100%;height:50px;float:left;background-color:#68A4C4;margin-bottom:10px">
        <div style="margin-left:15%;margin-top:8px;color:white"><asp:Image ID="Image13" ImageUrl="~/images/home.png" runat="server" />
            <label>/Liên hệ</label>
        </div>
        </div>
    
    <div style="height:500px;width:49%;float:left;margin:0.5%">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.7752544716514!2d106.66481601294817!3d10.751796892338238!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752ef99952cd31%3A0x73679b1efa95d84e!2zMjgtMzAgTmfDtCBRdXnhu4FuLCBwaMaw4budbmcgNiwgUXXhuq1uIDUsIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1478359718927" frameborder="0" style="border:0;height:95%;width:95%" allowfullscreen></iframe>

    </div>
    <div style="height:100%;width:49%;float:left">
        <fieldset>
            <legend>Xin nhập thông tin của bạn vào mẫu bên dưới</legend>
        <p><label style="width:100px">Họ tên:</label><asp:TextBox ID="txthoten" runat="server" Width="275px"></asp:TextBox></p>
        <br />
        <p><label style="width:100px">Email:</label><asp:TextBox ID="txtemail" runat="server" Width="275px"></asp:TextBox></p>
         <br />
        <p><label style="width:100px">Điện thoại:</label><asp:TextBox ID="TextBox6" runat="server" Width="275px"></asp:TextBox></p>
        <br />
        <p><label style="width:100px">LỜi nhắn:</label><asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Width="275px"></asp:TextBox></p>
           
             <asp:Button ID="btnloinhan" runat="server" Text="Gửi tin nhắn" />
        
        </fieldset>
        <br />
    </div>
</asp:Content>