using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            if (Session["makhachhang"] != "")
            {

                //  if ((bool)Session["dangnhap"] == true)
                {
                    btnLogout.Visible = true;
                    lbllichsu.Visible = true;
                    dangnhap.Visible = false;
                }
            }
            else
            {
                btnLogout.Visible = false;
                lbllichsu.Visible = false;              
            }
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["dangnhap"] = true;
        Session["tenkhachhang"] = null;
        Session["makhachhang"] = null;
        Session["matkhau"] = null;
        Response.Redirect("Dangnhap.aspx");
    }
    
}
