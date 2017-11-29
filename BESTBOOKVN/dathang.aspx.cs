using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class dathang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable cart = new DataTable();
            cart = Session["cart"] as DataTable;
            Getsalary();
            lbltongtien.Text = Session["tongtien"].ToString();
            
            DataListdathang.DataSource = cart;
            DataListdathang.DataBind();

        }
        
    }
    public void Getsalary()
    {
        DataSet kh = new DataSet();
        kh = new cls_trangchu().select_khachhangtheoma(int.Parse(Session["makhachhang"].ToString()));
        if (kh.Tables.Count > 0)
        {
            datalist.DataSource = kh.Tables[0];
            datalist.DataBind();
            
        }
    }
}