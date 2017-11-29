using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls; //Thẻ a cho runat="sever"

public partial class trangchu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GetALL();                 
        }
        if (Session["tenkhachhang"] != null)
        {

            //if ((bool)Session["dangnhap"] == true)
            {
                lbluser.Text ="Chào bạn "+ Session["tenkhachhang"].ToString();
            }
        }
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
                }
            }


        }
    }
    public void GetALL()
    {
        DataSet dsSanPham = new DataSet();
        dsSanPham = new cls_trangchu().select_sanpham();
        if (dsSanPham.Tables.Count > 0)
        {
            //PagedDataSource pg = new PagedDataSource();
            //pg.DataSource = dsSanPham.Tables;
            //pg.AllowPaging = true;
            //pg.PageSize = 1;
            //datalist.DataSource = pg;
            //datalist.DataBind();
            datalist.DataSource = dsSanPham.Tables[0];
            datalist.DataBind();
        }            
    }
    protected void btndathang_Click(object sender, ImageClickEventArgs e)
    {
        //if (Session["makhachhang"] == null)
        //{

        //    Response.Redirect("dangnhap.aspx");          
        //}
        //else 
        //{           
        //    string id = Eval("id_san_pham").ToString();
        //    string name = Eval("ten_san_pham").ToString();
        //    string price = Eval("don_gia").ToString();
        //    Response.Redirect("giohang.aspx?action=add&" +id+"&"+name+"&"+price );
        //}                  
    }
    protected void datalist_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //int id_san_pham = int.Parse(datalist.DataKeys[e.Item.ItemIndex].ToString());
        //string price = ((Label)e.Item.FindControl("lblgia")).Text;
        //string ten_san_pham = ((Label)e.Item.FindControl("lblten")).Text;

    }
}