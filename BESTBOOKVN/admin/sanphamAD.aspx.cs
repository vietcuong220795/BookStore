using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class admin_sanphamAD : System.Web.UI.Page
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
        DataSet dsSanPham = new DataSet();
        dsSanPham = new cls_trangchu().select_sanpham();
        if (dsSanPham.Tables.Count > 0)
        {
          
            gvsanpham.DataSource = dsSanPham.Tables[0];
            gvsanpham.DataBind();
        }            
    }
    protected void gvsanpham_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            e.Row.Attributes.Add("onmouseover", "this.originalcolor=this.style.backgroundColor;" + "this.style.backgroundColor='#68A4C4';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalcolor;");
            e.Row.Attributes.Add("style", "cursor:pointer");
            HtmlAnchor a = (HtmlAnchor)e.Row.Cells[0].FindControl("aIdsanpham");

            //if (a != null)
            //    a.HRef = "~/phongban.aspx?id=" + a.InnerText;

        }
    }
    protected void gvsanpham_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvsanpham.EditIndex = e.NewEditIndex;
        GetALL();
    }
    protected void gvsanpham_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int row = e.RowIndex;
        HtmlAnchor a = (HtmlAnchor)gvsanpham.Rows[row].FindControl("aIdsanpham");
        int id = int.Parse(a.InnerText.Trim());
        int count = new cls_trangchu().delete_sanpham(id);
        if (count != 0

             )
        {
            GetALL();
            lblerr.Text = "";
        }
        else
            lblerr.Text = "Lỗi rồi!";
    }
    protected void gvsanpham_RowCommand(object sender, GridViewCommandEventArgs e)
    {
         if (e.CommandName.Equals("Them_moi_sanpham"))
        {
            int id_san_pham = int.Parse(((TextBox)gvsanpham.FooterRow.FindControl("txtidsanpham")).Text);
            string ma_san_pham = ((TextBox)gvsanpham.FooterRow.FindControl("txtmasanpham")).Text;
            string ten_san_pham = ((TextBox)gvsanpham.FooterRow.FindControl("txttensanpham")).Text;
            int ma_loai = int.Parse(((TextBox)gvsanpham.FooterRow.FindControl("txtmaloai")).Text);
            string mo_ta_chi_tiet = ((TextBox)gvsanpham.FooterRow.FindControl("txtmotachitiet")).Text;
            int don_gia = int.Parse(((TextBox)gvsanpham.FooterRow.FindControl("txtdongia")).Text);
            string dvt = ((TextBox)gvsanpham.FooterRow.FindControl("txtdvt")).Text;
            string tinh_trang = ((TextBox)gvsanpham.FooterRow.FindControl("txttinhtrang")).Text;
            string hinh = ((TextBox)gvsanpham.FooterRow.FindControl("txthinh")).Text;
            int san_pham_moi = int.Parse(((TextBox)gvsanpham.FooterRow.FindControl("txtsanphammoi")).Text);
            string tac_gia = ((TextBox)gvsanpham.FooterRow.FindControl("txttacgia")).Text;
            string nxb = ((TextBox)gvsanpham.FooterRow.FindControl("txtnxb")).Text;
            DateTime ngay_xuat_ban= DateTime.Parse(((TextBox)gvsanpham.FooterRow.FindControl("txtngayxuatban")).Text);
            int so_trang = int.Parse(((TextBox)gvsanpham.FooterRow.FindControl("txtsotrang")).Text);
            int danh_muc = int.Parse(((TextBox)gvsanpham.FooterRow.FindControl("txtdanhmuc")).Text);
            
            int COUNT = new cls_trangchu().insert_sanpham(id_san_pham, ma_san_pham, ten_san_pham, ma_loai, mo_ta_chi_tiet, don_gia, dvt, tinh_trang, hinh, san_pham_moi
    , tac_gia, nxb, ngay_xuat_ban, so_trang, danh_muc);
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
    protected void gvsanpham_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        gvsanpham.EditIndex = -1;
        GetALL();
    }
    protected void gvsanpham_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int row = e.RowIndex;     
       
        int id_san_pham = int.Parse(((TextBox)gvsanpham.Rows[row].FindControl("txtEidsanpham")).Text);
        string ma_san_pham = ((TextBox)gvsanpham.Rows[row].FindControl("txtEmasanpham")).Text;
        string ten_san_pham = ((TextBox)gvsanpham.Rows[row].FindControl("txtEtensanpham")).Text;
        int ma_loai = int.Parse(((TextBox)gvsanpham.Rows[row].FindControl("txtEmaloai")).Text);
        string mo_ta_chi_tiet = ((TextBox)gvsanpham.Rows[row].FindControl("txtEmotachitiet")).Text;
        int don_gia = int.Parse(((TextBox)gvsanpham.Rows[row].FindControl("txtEdongia")).Text);
        string dvt = ((TextBox)gvsanpham.Rows[row].FindControl("txtEdvt")).Text;
        string tinh_trang = ((TextBox)gvsanpham.Rows[row].FindControl("txtEtinhtrang")).Text;
        string hinh = ((TextBox)gvsanpham.Rows[row].FindControl("txtEhinh")).Text;
        int san_pham_moi = int.Parse(((TextBox)gvsanpham.Rows[row].FindControl("txtEsanphammoi")).Text);
        string tac_gia = ((TextBox)gvsanpham.Rows[row].FindControl("txtEtacgia")).Text;
        string nxb = ((TextBox)gvsanpham.Rows[row].FindControl("txtEnxb")).Text;
        DateTime ngay_xuat_ban = DateTime.Parse(((TextBox)gvsanpham.Rows[row].FindControl("txtEngayxuatban")).Text);
        int so_trang = int.Parse(((TextBox)gvsanpham.Rows[row].FindControl("txtEsotrang")).Text);
        int danh_muc = int.Parse(((TextBox)gvsanpham.Rows[row].FindControl("txtEdanhmuc")).Text);

        int result = new cls_trangchu().update_sanpham(id_san_pham, ma_san_pham, ten_san_pham, ma_loai, mo_ta_chi_tiet, don_gia, dvt, tinh_trang, hinh, san_pham_moi
    , tac_gia, nxb, ngay_xuat_ban, so_trang, danh_muc);
        if (result != 0)
        {
            gvsanpham.EditIndex = -1;
            GetALL();
        }
    }
}