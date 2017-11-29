using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class admin_dangnhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     

    }
    protected void btndangnhap_Click(object sender, EventArgs e)
    {
        int i;
        //kiemtralogin KTUserPass = new kiemtralogin();
        if (txtUserName.Text == "" || txtPass.Text == "")
        {
            //Response.Write("<script>alert('yêu cầu nhập đầy đủ!!!')</script>");
            Response.Redirect("~/admin/dangnhap.aspx");
        }
        else
        {
            i = cls_trangchu.Kiemtra(txtUserName.Text, txtPass.Text);
            if (i == 0)
                //Response.Write("<script>alert('User hoặc Pass không đúng!!!')</script>");
                Response.Redirect("~/admin/dangnhap.aspx");
            else if (i == 1)
            {
                Session["dangnhap"] = true;
                Session["tenkhachhang"] = txtUserName.Text;
                string strlenh = "select ma_khach_hang from khach_hang where email='" + txtUserName.Text + "' and mat_khau='" + txtPass.Text + "'";
                SqlDataReader myReader;
                myReader = cls_trangchu.ExecSqlDataReader(strlenh);

                myReader.Read();
                if (myReader != null)
                {
                    Session["makhachhang"] = myReader.GetInt32(0);
                }
                Response.Redirect("~/admin/khachhang.aspx");
            }

        }
    }
}