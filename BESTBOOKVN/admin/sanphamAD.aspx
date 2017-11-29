<%@ Page Language="C#" MasterPageFile="~/indexAD.master" AutoEventWireup="true" CodeFile="sanphamAD.aspx.cs" Inherits="admin_sanphamAD" %>

<asp:Content runat="server" ContentPlaceHolderID="ctpMain"> 

    <div style="width:100%;margin-bottom:18%;margin-left:1%">
<asp:GridView ID="gvsanpham" OnRowDataBound="gvsanpham_RowDataBound" OnRowEditing="gvsanpham_RowEditing"
             ShowFooter="True"  OnRowDeleting="gvsanpham_RowDeleting" OnRowCommand="gvsanpham_RowCommand" OnRowCancelingEdit="gvsanpham_RowCancelingEdit" OnRowUpdating="gvsanpham_RowUpdating" runat="server" AutoGenerateColumns="False" Height="136px" Width="361px" style="margin-right: 31px">
            <Columns>
                <asp:TemplateField HeaderText="Mã khách hàng">  
                      <EditItemTemplate>
                        <asp:TextBox ID="txtEidsanpham" Text='<%# Eval("id_san_pham") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>                 
                    <ItemTemplate>
                         <a runat="server" id="aIdsanpham"><%# Eval("id_san_pham") %></a>
                 </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtidsanpham" runat="server"></asp:TextBox>
                    </FooterTemplate>                 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mã sản phẩm">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmasanpham" Text='<%# Eval("ma_san_pham") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                     <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ma_san_pham") %>'></asp:Label>
                         </ItemTemplate>
                   <FooterTemplate>
                        <asp:TextBox ID="txtmasanpham" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên sản phẩm">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEtensanpham" runat="server" Text='<%# Eval("ten_san_pham") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ten_san_pham") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txttensanpham" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mã loại">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmaloai" runat="server" Text='<%# Eval("ma_loai") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ma_loai") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtmaloai" runat="server"></asp:TextBox>

                    </FooterTemplate>
                    
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Mô tả chi tiết">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmotachitiet" runat="server" Text='<%# Eval("mo_ta_chi_tiet") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("mo_ta_chi_tiet") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtmotachitiet" runat="server"></asp:TextBox>

                    </FooterTemplate>

                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Đơn giá">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEdongia" runat="server" Text='<%# Eval("don_gia") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("don_gia") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtdongia" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Đơn vị tính">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEdvt" runat="server" Text='<%# Eval("dvt") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("dvt") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtdvt" runat="server"></asp:TextBox>

                    </FooterTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tình trạng">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEtinhtrang" runat="server" Text='<%# Eval("tinh_trang") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("tinh_trang") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txttinhtrang" runat="server"></asp:TextBox>
                    </FooterTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hình">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEhinh" runat="server" Text='<%# Eval("hinh") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("hinh") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txthinh" runat="server"></asp:TextBox>
                    </FooterTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sản phẩm mới">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEsanphammoi" runat="server" Text='<%# Eval("san_pham_moi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("san_pham_moi") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtsanphammoi" runat="server"></asp:TextBox>
                    </FooterTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tác giả">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEtacgia" runat="server" Text='<%# Eval("tac_gia") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("tac_gia") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txttacgia" runat="server"></asp:TextBox>
                    </FooterTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nhà xuất bản">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEnxb" runat="server" Text='<%# Eval("nxb") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("nxb") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtnxb" runat="server"></asp:TextBox>
                    </FooterTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày xuất bản">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEngayxuatban" runat="server" Text='<%# Eval("ngay_xuat_ban") %>'></asp:TextBox>                                              
                    </EditItemTemplate>
                    <ItemTemplate>             
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ngay_xuat_ban","{0:d/M/y}") %>'></asp:Label>                                      
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtngayxuatban" runat="server"></asp:TextBox>
                    </FooterTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Số trang">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEsotrang" runat="server" Text='<%# Eval("so_trang") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("so_trang") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtsotrang" runat="server"></asp:TextBox>
                    </FooterTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Danh mục">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEdanhmuc" runat="server" Text='<%# Eval("danh_muc") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("danh_muc") %>'></asp:Label>
                        </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtdanhmuc" runat="server"></asp:TextBox>
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
                            ="Them_moi_sanpham" />
                         
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