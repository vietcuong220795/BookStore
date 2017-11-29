<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/admin/dangnhap.aspx.cs" Inherits="admin_dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BestBookVN</title>
  
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery.min.js"></script>
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'/>

<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'/>

<!-- animation-effect -->
<link href="css/animate.min.css" rel="stylesheet"/> 
<script src="js/wow.min.js"></script>

<!-- //animation-effect -->
<link href="css/css.css" rel="stylesheet" />
</head>
<body style="height:100%">   
     <form style="width:100%;height:100%;" runat="server">
    <div class="clearfix"></div>
    <div style="height:100%;width:100%;margin-left:34%;margin-bottom:15%;margin-top:5%">
        <p><label>Tài khoản:</label><asp:TextBox runat="server" ID="txtUserName" ></asp:TextBox></p>
        <br />
        <p><label>Mật khẩu:</label><asp:TextBox runat="server" ID="txtPass" ></asp:TextBox></p>
        <asp:CheckBox ID="chkghinho" runat="server" Text="Lưu thông tin" />
        <p> <asp:Button ID="btndangnhap" runat="server" Text="Đăng nhập" OnClick="btndangnhap_Click" />
            <asp:Button ID="btnnhaplai" runat="server" Text="Nhập lại" />
            <asp:Button ID="btndangki" runat="server" Text="Đăng kí" />    
        </p>        
    </div>
          </form>
</body>
    </html>
