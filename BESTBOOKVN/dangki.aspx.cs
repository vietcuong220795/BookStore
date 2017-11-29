using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class dangki : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void Getsalary()
    {
        //DataSet dskhachhang = new DataSet();
        //dskhachhang = new cls_trangchu().select_khachhang();
        //if (dskhachhang.Tables.Count > 0)
        //{
        //    datalist.DataSource = dsSanPham.Tables[0];
        //    datalist.DataBind();
        //}
    }
    protected void btndangki_Click(object sender, EventArgs e)
    {
        string ten_khach_hang = txthoten.Text;
        int phai = int.Parse(txtphai.Text);
        string dia_chi = txtdiachi.Text;
        string dien_thoai = txtdienthoai.Text;
        string email = txtemail.Text;
        string ghi_chu= txtghichu.Text;
        string mat_khau = txtmatkhau.Text;


        int count = new cls_trangchu().insert_khachhang(ten_khach_hang, phai,dia_chi,dien_thoai,email,ghi_chu,mat_khau);
        if (count != 0)
        {           
            hienthi.Text = "Đăng ký thành công!!";
            txthoten.Text = "";
            txtphai.Text= "";
            txtdiachi.Text = "";
            txtemail.Text = "";
            txtdienthoai.Text = "";
            txtghichu.Text = "";
            txtmatkhau.Text = "";
        }
        else
        {
            hienthi.Text = "Đăng ký bị lỗi!!";
        }
    }
}