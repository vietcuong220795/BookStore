using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class thongtinUSER : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["makhachhang"] != null)
            {
                GetALL();
            }
        }
        if (Session["tenkhachhang"] != null)
        {

            //if ((bool)Session["dangnhap"] == true)
            {
                lbluser.Text = "Chào bạn " + Session["tenkhachhang"].ToString();
            }
        }
        else Response.Redirect("dangnhap.aspx");
    }
    public void GetALL()
    {
        DataSet sp = new DataSet();
        int ID = int.Parse(Session["makhachhang"].ToString());
        sp = new cls_trangchu().select_khachhangtheoma(ID);
        if (sp.Tables.Count > 0)
        {
            //PagedDataSource pg = new PagedDataSource();
            //pg.DataSource = dsSanPham.Tables;
            //pg.AllowPaging = true;
            //pg.PageSize = 1;
            //datalist.DataSource = pg;
            //datalist.DataBind();
            datalist.DataSource = sp.Tables[0];
            datalist.DataBind();
        }
    }
    protected void btnSua_Click(object sender, EventArgs e)
    {
        int ma_khach_hang = int.Parse(Session["makhachhang"].ToString());
        TextBox ten_khach_hang= datalist.Items[0].FindControl("txthoten") as TextBox;
        TextBox phai = datalist.Items[0].FindControl("txtphai") as TextBox;
        TextBox dia_chi = datalist.Items[0].FindControl("txtdiachi") as TextBox;
        TextBox dien_thoai = datalist.Items[0].FindControl("txtdienthoai") as TextBox;
        TextBox email = datalist.Items[0].FindControl("txtemail") as TextBox;
        TextBox ghi_chu = datalist.Items[0].FindControl("txtghichu") as TextBox;      

        string ten_khach_hang2 = ten_khach_hang.Text;
        int phai2 =int.Parse(phai.Text);
        string dia_chi2 = dia_chi.Text;
        string dien_thoai2 = dien_thoai.Text;
        string email2 = email.Text;
        string ghi_chu2 = ghi_chu.Text;
        string mat_khau2 = Session["matkhau"].ToString();


        int count = new cls_trangchu().update_khachang(ma_khach_hang,ten_khach_hang2, phai2, dia_chi2, dien_thoai2, email2, ghi_chu2, mat_khau2);
        if (count != 0)
        {
            hienthi.Text = "Update thành công!!";
           
        }
        else
        {
            hienthi.Text = "Update bị lỗi!!";
        }
    }
    protected void btndangki_Click(object sender, EventArgs e)
    {

    }
}