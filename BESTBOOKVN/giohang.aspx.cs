using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class giohang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         
        if (!IsPostBack)
        {
            
            DataTable cart = new DataTable();
            if (Session["cart"] == null)
            {
                //Nếu chưa có giỏ hàng, tạo giỏ hàng thông qua DataTable với 4 cột chính
                //ID (Mã sản phẩm), Name (Tên sản phẩm)
                //Price (Giá tiền), Quantity (Số lượng)

                cart.Columns.Add("ID");
                cart.Columns.Add("Name");
                cart.Columns.Add("Price");
                cart.Columns.Add("Quantity");
                //Sau khi tạo xong thì lưu lại vào session
                Session["cart"] = cart;
            }
            else
            {
                //Lấy thông tin giỏ hàng từ Session["cart"]
                cart = Session["cart"] as DataTable;
            }
            if (!String.IsNullOrEmpty(Request.QueryString["action"]))
            {
                if (Request.QueryString["action"] == "add")
                {
                    string id = Request.QueryString["id"];
                    string name = Request.QueryString["name"];
                    string price = Request.QueryString["price"];
                    //Kiểm tra xem đã có sản phẩm trong giỏ hàng chưa ?
                    //Nếu chưa thì thêm bản ghi mới vào giỏ hàng với số lượng Quantity là 1
                    //Nếu có thì tăng quantity lên 1
                    bool isExisted = false;
                    foreach (DataRow dr in cart.Rows)
                    {
                        if (dr["ID"].ToString() == id)
                        {
                            dr["Quantity"] = int.Parse(dr["Quantity"].ToString()) + 1;
                            isExisted = true;
                            break;
                        }
                    }
                    if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
                    {
                        DataRow dr = cart.NewRow();
                        dr["ID"] = id;
                        dr["Name"] = name;
                        dr["Price"] = price;
                        dr["Quantity"] = 1;
                        cart.Rows.Add(dr);
                    }
                    //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                    Session["cart"] = cart;
                    //Quay lai trang chu
                    //Response.Redirect(Session["URLChonNhaHang"].ToString());
                }
            }
           // Hiện thị thông tin giỏ hàng
            GridView1.DataSource = cart;
            GridView1.DataBind();
            tinhtong(cart);

        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Xóa sản phẩm khỏi giỏ hàng
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        //Duyệt qua Giỏ hàng và xóa sản phẩm phù hợp
        DataTable cart = Session["cart"] as DataTable;
        foreach (DataRow dr in cart.Rows)
        {
            //Kiểm tra mã sản phẩm phù hợp để tăng số lượng
            if (dr["ID"].ToString() == id)
            {
                dr.Delete();
                break;
            }
        }
        //Lưu lại vào Session
        Session["cart"] = cart;
        //Hiển thị giỏ hàng với thông tin mới
        GridView1.DataSource = cart;
        GridView1.DataBind();
        tinhtong(cart);
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //Sửa thông tin giỏ hàng
        string id = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
        TextBox quantity = GridView1.Rows[e.NewSelectedIndex].Cells[2].FindControl("txtQuantity")
            as TextBox;
        //Duyệt qua Giỏ hàng và tăng số lượng
        DataTable cart = Session["cart"] as DataTable;
        foreach (DataRow dr in cart.Rows)
        {
            //Kiểm tra mã sản phẩm phù hợp để gán số lượng khách hàng mua
            if (dr["ID"].ToString() == id)
            {
                dr["Quantity"] = int.Parse(quantity.Text);
                break;
            }
        }

        //Lưu lại vào Session
        Session["cart"] = cart;
        //Hiển thị giỏ hàng với thông tin mới
        GridView1.DataSource = cart;
        GridView1.DataBind();
        tinhtong(cart);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable cart = new DataTable();   
        cart = Session["cart"] as DataTable;
        tinhtong(cart);
    }
    private void tinhtong(DataTable cart)
    {
        int tong = 0;
        foreach (DataRow dr in cart.Rows)
        {

            tong = tong + (int.Parse(dr["Quantity"].ToString()) * int.Parse(dr["Price"].ToString()));


        }
        txtThongBao.Text = tong.ToString();
        Session["tongtien"] = txtThongBao.Text;
    }
    protected void cmdDathang_Click(object sender, EventArgs e)
    {
        
         DataTable cart = new DataTable();
         if (Session["cart"] != null && Session["makhachhang"]!=null)
         {
             cart = Session["cart"] as DataTable;
             foreach (DataRow dr in cart.Rows)
             {
                 int ma_hoa_don = int.Parse(Session["makhachhang"].ToString());
                 DateTime ngay_dat = DateTime.Today;
                 int so_luong = int.Parse(dr["Quantity"].ToString());
                 float tong_tien = float.Parse(dr["Price"].ToString());
                 int id_san_pham = int.Parse(dr["ID"].ToString());
                 int ma_khach_hang = int.Parse(Session["makhachhang"].ToString());
                 string ghi_chu = "";
                 int tinh_trang = 1;

                 int count = new cls_trangchu().insert_hoadon(ma_hoa_don, ngay_dat, so_luong, tong_tien, id_san_pham, ma_khach_hang, ghi_chu, tinh_trang);
                 if (count != 0)
                 {

                 }
             }
             Response.Redirect("dathang.aspx");
         }
         else
         { 
             Response.Write("<script>alert('Bạn chưa đăng nhập hoặc chưa có hàng trong giỏ!!!')</script>");
             Response.Redirect("dangnhap.aspx");
         }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        Session["makhachhang"] = null;       
        Response.Redirect("trangchu.aspx");
         
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("trangchu.aspx");
    }
}