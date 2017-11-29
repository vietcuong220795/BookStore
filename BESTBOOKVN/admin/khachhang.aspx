<%@ Page Language="C#" MasterPageFile="~/indexAD.master" AutoEventWireup="true" CodeFile="~/admin/khachhang.aspx.cs" Inherits="admin_khachhang" %>

<asp:Content runat="server" ContentPlaceHolderID="ctpMain"> 

    <div style="width:100%;margin-bottom:18%;margin-left:1%">
<asp:GridView ID="gvkhachhang" OnRowDataBound="gvkhachhang_RowDataBound" OnRowEditing="gvkhachhang_RowEditing"
             ShowFooter="True" OnRowDeleting="gvkhachhang_RowDeleting" OnRowCommand="gvkhachhang_RowCommand" OnRowCancelingEdit="gvkhachhang_RowCancelingEdit" OnRowUpdating="gvkhachhang_RowUpdating" runat="server" AutoGenerateColumns="False" Height="136px" Width="361px" style="margin-right: 31px">
            <Columns>
                <asp:TemplateField HeaderText="Mã khách hàng">                   
                    <ItemTemplate>
                         <a runat="server" id="aMakhachhang"><%# Eval("ma_khach_hang") %></a>
                 </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtmakhachhang" runat="server"></asp:TextBox>
                    </FooterTemplate>                 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên khách hàng">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEtenkhachhang" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                     <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ten_khach_hang") %>'></asp:Label>
                         </ItemTemplate>
                   <FooterTemplate>
                        <asp:TextBox ID="txttenkhachhang" runat="server"></asp:TextBox>

                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phái">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEphai" runat="server" Text='<%# Eval("phai") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("phai") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtphai" runat="server" TextMode="Number"></asp:TextBox>

                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Địa chỉ">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEdiachi" runat="server" Text='<%# Eval("dia_chi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("dia_chi") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtdiachi" runat="server"></asp:TextBox>

                    </FooterTemplate>
                    
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Điện thoại">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEdienthoai" runat="server" Text='<%# Eval("dien_thoai") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("dien_thoai") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtdienthoai" runat="server"></asp:TextBox>

                    </FooterTemplate>

                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEemail" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ghi chú">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEghichu" runat="server" Text='<%# Eval("ghi_chu") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ghi_chu") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtghichu" runat="server"></asp:TextBox>

                    </FooterTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mật khẩu">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmatkhau" runat="server" Text='<%# Eval("mat_khau") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("mat_khau") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtmatkhau" runat="server"></asp:TextBox>

                    </FooterTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <EditItemTemplate>
                        <p><asp:ImageButton ID="Image1" ImageUrl="~/images/check.png" CommandName="Update" ToolTip="Update" runat="server" Height="20px" Width="20px" />
                        <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/close_1.png" CommandName="Cancel" ToolTip="Cancel" runat="server" Height="20px" Width="20px" /></p>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="Image1" ImageUrl="~/images/edit-16.png" CommandName="Edit" ToolTip="Edit" runat="server" Height="20px" Width="20px" />
                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/delete-16.png" CommandName="Delete" ToolTip="Delete" runat="server" Height="20px" Width="20px"/>
                        
                    </ItemTemplate>


                    <FooterTemplate>
                        <asp:ImageButton ID="imgSave" ImageUrl="~/Images/save-16.png" runat="server" CommandName
                            ="Them_moi_khachhang" />
                         
                    </FooterTemplate>
                    
                </asp:TemplateField>
                 <asp:TemplateField>
                     <HeaderTemplate><asp:CheckBox ID="chkall" runat="server" AutoPostBack="true" ></asp:CheckBox></HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkdel" runat="server" AutoPostBack="true"></asp:CheckBox>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ID="btnXoa" ImageUrl="~/Images/delete-16.png" CommandName="Delete"  ToolTip="Delete" runat="server" Height="20px" Width="20px"/>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    <asp:Label ID="lblerr" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>