<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/index.master" CodeFile="giohang.aspx.cs" Inherits="giohang" %>

<asp:Content runat="server" ContentPlaceHolderID="ctpMain"> 
  <div class="container">
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
        <div class="wapper-register">
            <div style="margin-bottom:25%;margin-top:10%">
                <div class="login-lable">
                    <asp:Label ID="Label6" runat="server" Text="Đơn đặt hàng" CssClass="login-lable register"></asp:Label>
                </div>                   
            
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="650px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" ShowFooter="True" CssClass="label-register register">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">          
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>'></asp:Label> 
                 </ItemTemplate>
             </asp:TemplateField>
                   <asp:TemplateField HeaderText="Tên sản phẩm">          
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label> 
                 </ItemTemplate>
             </asp:TemplateField>
                           <asp:TemplateField HeaderText="Số lượng">    
                <ItemTemplate>
                       <asp:TextBox ID="txtQuantity" Text='<%# Eval("Quantity") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>      
                  <EditItemTemplate>
                        <asp:TextBox ID="txtESoluong"  Text='<%# Eval("Quantity") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
             </asp:TemplateField>
                       <asp:TemplateField HeaderText="Đơn giá">          
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Price") %>'></asp:Label> 
                 </ItemTemplate>
             </asp:TemplateField>
                        <asp:TemplateField>

                            <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">Cập nhật</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="delete" OnClientClick="return confirm(&quot;Are u sure ?&quot;)">Xóa</asp:LinkButton>
                            </ItemTemplate>

                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#FAA61A" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#FAA61A" Font-Bold="True" ForeColor="White" Wrap="True" CssClass="label-register register" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" Height="30px" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:Label ID="Label7" runat="server" Font-Size="20px" ForeColor="Maroon" Text="Tổng thành tiền :   "></asp:Label>
                <asp:Label ID="txtThongBao"  runat="server" Font-Size="20px" ForeColor="Maroon"></asp:Label>
                &nbsp;
                <asp:Label ID="txtThongBao0" runat="server" Font-Size="20px" ForeColor="Maroon">đồng</asp:Label>
                
                    <div style="" >
                        <asp:Button ID="cmdDathang" runat="server" Text="Đặt hàng" BackColor="#FAA61A" OnClick="cmdDathang_Click" Width="289px" CssClass="button" Font-Bold="False" Font-Size="19px" />
                        <asp:Button ID="Button1" runat="server" Text="Xóa giỏ hàng" BackColor="#FAA61A" Width="289px" OnClick="Button1_Click" CssClass="button" Font-Size="19px" />
                         <asp:Button ID="Button2" runat="server" Text="Tiếp tục mua hàng" BackColor="#FAA61A" Width="289px" OnClick="Button2_Click" CssClass="button" Font-Size="19px" />
                    </div>
              
                <br />
                <asp:Label ID="lblThongBao" runat="server" CssClass="label-register register"></asp:Label>
                <br />

            </div>


        </div>
    </div>

</asp:Content>
