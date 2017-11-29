using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class indexAD : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        { 
            if (Session["makhachhang"]==null||int.Parse(Session["makhachhang"].ToString()) != 4)
            {

                //  if ((bool)Session["dangnhap"] == true)
                {
                    Response.Redirect("~/admin/dangnhap.aspx");
                }
            }
        }
            //else Response.Redirect("~/admin/khachhang.aspx");
        
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["dangnhap"] = true;
        Session["tenkhachhang"] = null;
        Session["makhachhang"] = null;
        Session["matkhau"] = null;
        Response.Redirect("~/admin/dangnhap.aspx");
    }
}
