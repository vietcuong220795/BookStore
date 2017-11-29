using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class chitietsach : System.Web.UI.Page
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
                lbluser.Text = Session["tenkhachhang"].ToString();
            }
        }
    }
    public void GetALL()
    {
        DataSet sp = new DataSet();
        int ID = int.Parse(Request.QueryString["ID"]);
        sp = new cls_trangchu().select_sachtheoID(ID);
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