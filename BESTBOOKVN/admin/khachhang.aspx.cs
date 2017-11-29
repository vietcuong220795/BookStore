using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class admin_khachhang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetALL();

        }     
    }
    public void GetALL()
    {
        DataSet dskhachhang= new DataSet();
        dskhachhang= new cls_trangchu().select_khachhang();
        if (dskhachhang.Tables.Count > 0)
        {
            gvkhachhang.DataSource = dskhachhang.Tables[0];
            gvkhachhang.DataBind();
        }
    }
    protected void gvkhachhang_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            e.Row.Attributes.Add("onmouseover", "this.originalcolor=this.style.backgroundColor;" + "this.style.backgroundColor='#68A4C4';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalcolor;");
            e.Row.Attributes.Add("style", "cursor:pointer");
            HtmlAnchor a = (HtmlAnchor)e.Row.Cells[0].FindControl("aMakhachhang");
            //if (a != null)
            //    a.HRef = "~/phongban.aspx?id=" + a.InnerText;

        }
    }
    protected void gvkhachhang_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvkhachhang.EditIndex = e.NewEditIndex;
        GetALL();
    }
    protected void gvkhachhang_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int row = e.RowIndex;
        HtmlAnchor a = (HtmlAnchor)gvkhachhang.Rows[row].FindControl("aMakhachhang");
        int id =int.Parse( a.InnerText.Trim());
        int count = new cls_trangchu().delete_khachang(id);
        if (count != 0

             )
        {
            GetALL();
            lblerr.Text = "";
        }
        else
            lblerr.Text = "Lỗi rồi!";
    }
    protected void gvkhachhang_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Them_moi_khachhang"))
        {
           
            string tenkhachang = ((TextBox)gvkhachhang.FooterRow.FindControl("txttenkhachhang")).Text;
            int phai = int.Parse(((TextBox)gvkhachhang.FooterRow.FindControl("txtphai")).Text);
            string diachi = ((TextBox)gvkhachhang.FooterRow.FindControl("txtdiachi")).Text;
            string dienthoai = ((TextBox)gvkhachhang.FooterRow.FindControl("txtdienthoai")).Text;
            string email = ((TextBox)gvkhachhang.FooterRow.FindControl("txtemail")).Text;
            string ghichu = ((TextBox)gvkhachhang.FooterRow.FindControl("txtghichu")).Text;
            string matkhau = ((TextBox)gvkhachhang.FooterRow.FindControl("txtmatkhau")).Text;

            int COUNT = new cls_trangchu().insert_khachhang(tenkhachang,phai,diachi,dienthoai,email,ghichu,matkhau);
            if (COUNT != 0)
            {
                GetALL();
                lblerr.Text = "";
            }
            else
            {
                lblerr.Text = "Lỗi rồi!";
            }

        }
        else if (e.CommandName.Equals("Delete"))
        {



        }
    }
    protected void gvkhachhang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvkhachhang.EditIndex = -1;
        GetALL();
    }
    protected void gvkhachhang_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int row = e.RowIndex;
        HtmlAnchor a = (HtmlAnchor)gvkhachhang.Rows[row].FindControl("aMakhachhang");
        int id = int.Parse(a.InnerText);
        int makhachang = id;
        //int makhachang = int.Parse(((TextBox)gvkhachhang.FooterRow.FindControl("txtmakhachhang")).Text);
        string tenkhachang = ((TextBox)gvkhachhang.Rows[row].FindControl("txtEtenkhachhang")).Text;
        int phai = int.Parse(((TextBox)gvkhachhang.Rows[row].FindControl("txtEphai")).Text);
        string diachi = ((TextBox)gvkhachhang.Rows[row].FindControl("txtEdiachi")).Text;
        string dienthoai = ((TextBox)gvkhachhang.Rows[row].FindControl("txtEdienthoai")).Text;
        string email = ((TextBox)gvkhachhang.Rows[row].FindControl("txtEemail")).Text;
        string ghichu = ((TextBox)gvkhachhang.Rows[row].FindControl("txtEghichu")).Text;
        string matkhau = ((TextBox)gvkhachhang.Rows[row].FindControl("txtEmatkhau")).Text;
        int result = new cls_trangchu().update_khachang(makhachang,tenkhachang, phai, diachi, dienthoai, email, ghichu, matkhau);
        if (result != 0)
        {
            gvkhachhang.EditIndex = -1;
            GetALL();
        }
    }
}