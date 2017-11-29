using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class lichsumuahang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["makhachhang"]!=null)
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
        sp = new cls_trangchu().select_hoadontheoma(ID);
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
}