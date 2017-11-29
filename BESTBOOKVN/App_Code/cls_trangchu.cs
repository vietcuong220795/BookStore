using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for cls_trangchu
/// </summary>
public class cls_trangchu
{
    public static SqlConnection sqlCon;
    SqlCommand sqlCom;
    SqlDataAdapter sqlAdap;
	public cls_trangchu()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static int Kiemtra(string id, string pass)
    {
        // SqlConnection Conn = new SqlConnection("server=VIETCUONG-PC;database=BESTBOOKVN;integrated security=true");
        sqlCon = new SqlConnection();
        sqlCon.ConnectionString = fwcommon.connect;
        if (sqlCon.State == ConnectionState.Closed)
        {
            sqlCon.Open();
        }
        DataSet ds = new DataSet();
        SqlCommand Cmd = new SqlCommand("select * from khach_hang where email=@id and mat_khau=@pass", sqlCon);
        Cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.NVarChar, 100));
        Cmd.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 100));
        Cmd.Parameters["@id"].Value = id;
        Cmd.Parameters["@pass"].Value = pass;
        Cmd.CommandType = CommandType.Text;
        if (Cmd.ExecuteReader().HasRows)
        {
            return 1;
        }
        else
            return 0;
      
    }
    public static SqlDataReader ExecSqlDataReader(String strLenh)
    {
        SqlDataReader myreader;
        sqlCon = new SqlConnection();
        sqlCon.ConnectionString = fwcommon.connect;
        SqlCommand sqlcmd = new SqlCommand(strLenh, sqlCon);
        sqlcmd.CommandType = CommandType.Text;
        if (sqlCon.State == ConnectionState.Closed) sqlCon.Open();
        try
        {
            myreader = sqlcmd.ExecuteReader();
            return myreader;
        }
        catch (Exception ex)
        {
            sqlCon.Close();

            return null;
        }
    }
    public int insert_hoadon(int ma_hoa_don,DateTime ngay_dat,int so_luong,
       float tong_tien,int id_san_pham,int ma_khach_hang,string ghi_chu,int tinh_trang)
    {
        int count = 0;
        sqlCon = new SqlConnection();
        sqlCon.ConnectionString = fwcommon.connect;
        sqlCom = new SqlCommand("insert_hoadon", sqlCon);
        sqlCom.CommandType = CommandType.StoredProcedure;
        sqlCom.Parameters.Add("@ma_hoa_don", SqlDbType.Int).Value = ma_hoa_don;
        sqlCom.Parameters.Add("@ngay_dat", SqlDbType.Date).Value =ngay_dat;
        sqlCom.Parameters.Add("@so_luong", SqlDbType.Int).Value = so_luong;
        sqlCom.Parameters.Add("@tong_tien", SqlDbType.Float).Value = tong_tien;
        sqlCom.Parameters.Add("@id_san_pham", SqlDbType.Int).Value = id_san_pham;
        sqlCom.Parameters.Add("@ma_khach_hang", SqlDbType.Int).Value = ma_khach_hang;
        sqlCom.Parameters.Add("@ghi_chu", SqlDbType.NVarChar).Value = ghi_chu;
        sqlCom.Parameters.Add("@tinh_trang", SqlDbType.Int).Value = tinh_trang;       
        try
        {
            sqlCon.Open();
            count = sqlCom.ExecuteNonQuery();

        }
        catch (Exception ex) { }
        finally { sqlCon.Close(); }
        return count;
    }
    public DataSet select_sanpham()
    {
        DataSet ds = new DataSet();
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("select * from san_pham", sqlCon);
       
        sqlCom.CommandType = CommandType.Text;
        try
        {
            sqlCon.Open();
            sqlAdap = new SqlDataAdapter(sqlCom);
            sqlAdap.Fill(ds);
        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return ds;
    }
    public int insert_sanpham(int id_san_pham,string ma_san_pham, string ten_san_pham,
       int ma_loai, string mo_ta_chi_tiet, int don_gia, string dvt, string tinh_trang,string hinh,int san_pham_moi, string tac_gia,
        string nxb, DateTime ngay_xuat_ban,int so_trang,int danh_muc)
    {
        int count = 0;
        sqlCon = new SqlConnection();
        sqlCon.ConnectionString = fwcommon.connect;
        sqlCom = new SqlCommand("insert_sanpham", sqlCon);
        sqlCom.CommandType = CommandType.StoredProcedure;
        sqlCom.Parameters.Add("@id_san_pham", SqlDbType.Int).Value = id_san_pham;
        sqlCom.Parameters.Add("@ma_san_pham", SqlDbType.NVarChar).Value = ma_san_pham;
        sqlCom.Parameters.Add("@ten_san_pham", SqlDbType.NVarChar).Value = ten_san_pham;
        sqlCom.Parameters.Add("@ma_loai", SqlDbType.Int).Value = ma_loai;
        sqlCom.Parameters.Add("@mo_ta_chi_tiet", SqlDbType.Text).Value = mo_ta_chi_tiet;
        sqlCom.Parameters.Add("@don_gia", SqlDbType.Int).Value = don_gia;
        sqlCom.Parameters.Add("@dvt", SqlDbType.NVarChar).Value = dvt;
        sqlCom.Parameters.Add("@tinh_trang", SqlDbType.NVarChar).Value = tinh_trang;
        sqlCom.Parameters.Add("@hinh", SqlDbType.NVarChar).Value = hinh;
        sqlCom.Parameters.Add("@san_pham_moi", SqlDbType.Int).Value = san_pham_moi;
        sqlCom.Parameters.Add("@tac_gia", SqlDbType.NVarChar).Value = tac_gia;
        sqlCom.Parameters.Add("@nxb", SqlDbType.NVarChar).Value = nxb;
        sqlCom.Parameters.Add("@hinh", SqlDbType.NVarChar).Value = hinh;
        sqlCom.Parameters.Add("@ngay_xuat_ban", SqlDbType.DateTime).Value = ngay_xuat_ban;
        sqlCom.Parameters.Add("@so_trang", SqlDbType.Int).Value = so_trang;
        sqlCom.Parameters.Add("@danh_muc", SqlDbType.Int).Value = danh_muc;
        try
        {
            sqlCon.Open();
            count = sqlCom.ExecuteNonQuery();
        }
        catch (Exception ex) { }
        finally { sqlCon.Close(); }
        return count;
    }
    public int update_sanpham(int id_san_pham, string ma_san_pham, string ten_san_pham,
       int ma_loai, string mo_ta_chi_tiet, int don_gia, string dvt, string tinh_trang, string hinh, int san_pham_moi, string tac_gia,
        string nxb, DateTime ngay_xuat_ban, int so_trang, int danh_muc)
    {
        int count = 0;
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("", sqlCon);
        sqlCom.CommandText = "sp_update_sanpham";
        sqlCom.CommandType = CommandType.StoredProcedure;
        sqlCom.Parameters.Add("@id_san_pham", SqlDbType.Int).Value = id_san_pham;
        sqlCom.Parameters.Add("@ma_san_pham", SqlDbType.NVarChar).Value = ma_san_pham;
        sqlCom.Parameters.Add("@ten_san_pham", SqlDbType.NVarChar).Value = ten_san_pham;
        sqlCom.Parameters.Add("@ma_loai", SqlDbType.Int).Value = ma_loai;
        sqlCom.Parameters.Add("@mo_ta_chi_tiet", SqlDbType.NVarChar).Value = mo_ta_chi_tiet;
        sqlCom.Parameters.Add("@don_gia", SqlDbType.Int).Value = don_gia;
        sqlCom.Parameters.Add("@dvt", SqlDbType.NVarChar).Value = dvt;
        sqlCom.Parameters.Add("@tinh_trang", SqlDbType.NVarChar).Value = tinh_trang;
        sqlCom.Parameters.Add("@hinh", SqlDbType.NVarChar).Value = hinh;
        sqlCom.Parameters.Add("@san_pham_moi", SqlDbType.Int).Value = san_pham_moi;
        sqlCom.Parameters.Add("@tac_gia", SqlDbType.NVarChar).Value = tac_gia;
        sqlCom.Parameters.Add("@nxb", SqlDbType.NVarChar).Value = nxb;
        sqlCom.Parameters.Add("@hinh", SqlDbType.NVarChar).Value = hinh;
        sqlCom.Parameters.Add("@ngay_xuat_ban", SqlDbType.DateTime).Value = ngay_xuat_ban;
        sqlCom.Parameters.Add("@so_trang", SqlDbType.Int).Value = so_trang;
        sqlCom.Parameters.Add("@danh_muc", SqlDbType.Int).Value = danh_muc;
        try
        {
            sqlCon.Open();
            count = sqlCom.ExecuteNonQuery();
        }
        catch (Exception ex) { }
        finally { sqlCon.Close(); }
        return count;
    }
  
    public int delete_sanpham(int id_san_pham)
    {
        int count = 0;
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("", sqlCon);
        sqlCom.CommandText = "sp_delete_sanpham";
        sqlCom.CommandType = CommandType.StoredProcedure;
        sqlCom.Parameters.Add("@id_san_pham", SqlDbType.Int).Value = id_san_pham;
        try
        {
            sqlCon.Open();
            count = sqlCom.ExecuteNonQuery();

        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return count;
    }
    public DataSet select_sachtienganh()
    {
        DataSet ds = new DataSet();
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("select * from san_pham where ma_loai=3", sqlCon);
        sqlCom.CommandType = CommandType.Text;
        try
        {
            sqlCon.Open();
            sqlAdap = new SqlDataAdapter(sqlCom);
            sqlAdap.Fill(ds);
        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return ds;
    }
    public DataSet select_mangacomic()
    {
        DataSet ds = new DataSet();
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("select * from san_pham where ma_loai=2", sqlCon);
        sqlCom.CommandType = CommandType.Text;
        try
        {
            sqlCon.Open();
            sqlAdap = new SqlDataAdapter(sqlCom);
            sqlAdap.Fill(ds);
        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return ds;
    }
    public DataSet select_tieuthuyet()
    {
        DataSet ds = new DataSet();
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("select * from san_pham where ma_loai=1", sqlCon);
        sqlCom.CommandType = CommandType.Text;
        try
        {
            sqlCon.Open();
            sqlAdap = new SqlDataAdapter(sqlCom);
            sqlAdap.Fill(ds);
        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return ds;
    }
    public DataSet select_sachmoi()
    {
        DataSet ds = new DataSet();
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("select * from san_pham where san_pham_moi=1", sqlCon);
        sqlCom.CommandType = CommandType.Text;
        try
        {
            sqlCon.Open();
            sqlAdap = new SqlDataAdapter(sqlCom);
            sqlAdap.Fill(ds);
        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return ds;
    }
    public DataSet select_sachtheoID(int ID)
    {
        sqlCon = new SqlConnection();
        sqlCon.ConnectionString = fwcommon.connect;
        DataSet ds = new DataSet();
        SqlCommand Cmd = new SqlCommand("select * from san_pham where id_san_pham=@ID", sqlCon);
        Cmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
        Cmd.Parameters["@ID"].Value = ID;
        Cmd.CommandType = CommandType.Text;
        try
        {
            sqlCon.Open();
            sqlAdap = new SqlDataAdapter(Cmd);
            sqlAdap.Fill(ds);
        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return ds;
    }
    public DataSet select_hoadontheoma(int ID)
    {
        sqlCon = new SqlConnection();
        sqlCon.ConnectionString = fwcommon.connect;
        DataSet ds = new DataSet();
        SqlCommand Cmd = new SqlCommand("select * from hoa_don where ma_hoa_don=@ID", sqlCon);
        Cmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
        Cmd.Parameters["@ID"].Value = ID;
        Cmd.CommandType = CommandType.Text;
        try
        {
            sqlCon.Open();
            sqlAdap = new SqlDataAdapter(Cmd);
            sqlAdap.Fill(ds);
        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return ds;
    }
    public static int doanhthutheonam(string nam)
    {
        return 0;
    }
    public DataSet select_khachhangtheoma(int makh)
    {
        // SqlConnection Conn = new SqlConnection("server=VIETCUONG-PC;database=BESTBOOKVN;integrated security=true");
        sqlCon = new SqlConnection();
        sqlCon.ConnectionString = fwcommon.connect;
        DataSet ds = new DataSet();
        SqlCommand Cmd = new SqlCommand("select * from khach_hang where ma_khach_hang=@makh", sqlCon);
        Cmd.Parameters.Add(new SqlParameter("@makh", SqlDbType.Int));
        Cmd.Parameters["@makh"].Value = makh;
        Cmd.CommandType = CommandType.Text;
        try
        {
            sqlCon.Open();          
            sqlAdap = new SqlDataAdapter(Cmd);
            sqlAdap.Fill(ds);
        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return ds;

    }
    public DataSet select_khachhang()
    {
        DataSet ds = new DataSet();
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("select * from khach_hang", sqlCon);
        sqlCom.CommandType = CommandType.Text;
        try
        {
            sqlCon.Open();
            sqlAdap = new SqlDataAdapter(sqlCom);
            sqlAdap.Fill(ds);
        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return ds;
    }
    public int insert_khachhang(string ten_khach_hang, int phai,
        string dia_chi, string dien_thoai, string email,string ghi_chu, string mat_khau)
    {
        int count = 0;
        sqlCon = new SqlConnection();
        sqlCon.ConnectionString = fwcommon.connect;
        sqlCom = new SqlCommand("insert_khachhang", sqlCon);
        sqlCom.CommandType = CommandType.StoredProcedure;
      
        sqlCom.Parameters.Add("@ten_khach_hang", SqlDbType.NVarChar).Value = ten_khach_hang;
        sqlCom.Parameters.Add("@phai", SqlDbType.Int).Value = phai;
        sqlCom.Parameters.Add("@dia_chi", SqlDbType.NVarChar).Value = dia_chi;
      
        sqlCom.Parameters.Add("@dien_thoai", SqlDbType.NVarChar).Value = dien_thoai;
        sqlCom.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
        sqlCom.Parameters.Add("@ghi_chu", SqlDbType.NVarChar).Value = ghi_chu;
        sqlCom.Parameters.Add("@mat_khau", SqlDbType.NVarChar).Value = mat_khau;

        try
        {
            sqlCon.Open();
            count = sqlCom.ExecuteNonQuery();

        }
        catch (Exception ex) { }
        finally { sqlCon.Close(); }
        return count;
    }
  
    public int delete_khachang(int ma_khach_hang)
    {
        int count = 0;
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("", sqlCon);
        sqlCom.CommandText = "sp_delete_khachhang";
        sqlCom.CommandType = CommandType.StoredProcedure;
        sqlCom.Parameters.Add("@ma_khach_hang", SqlDbType.Int).Value = ma_khach_hang;
        try
        {
            sqlCon.Open();
            count = sqlCom.ExecuteNonQuery();

        }
        catch (Exception e) { }
        finally
        {
            sqlCon.Close();
        }
        return count;
    }
    public int update_khachang(int ma_khach_hang,string ten_khach_hang, int phai,
        string dia_chi, string dien_thoai, string email, string ghi_chu, string mat_khau)
    {
        int count = 0;
        sqlCon = new SqlConnection(fwcommon.connect);
        sqlCom = new SqlCommand("", sqlCon);
        sqlCom.CommandText = "sp_update_khachhang";
        sqlCom.CommandType = CommandType.StoredProcedure;
        sqlCom.Parameters.Add("@ma_khach_hang", SqlDbType.Int).Value = ma_khach_hang;
        sqlCom.Parameters.Add("@ten_khach_hang", SqlDbType.NVarChar).Value = ten_khach_hang;
        sqlCom.Parameters.Add("@phai", SqlDbType.Int).Value = phai;
        sqlCom.Parameters.Add("@dia_chi", SqlDbType.NVarChar).Value = dia_chi;

        sqlCom.Parameters.Add("@dien_thoai", SqlDbType.NVarChar).Value = dien_thoai;
        sqlCom.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
        sqlCom.Parameters.Add("@ghi_chu", SqlDbType.NVarChar).Value = ghi_chu;
        sqlCom.Parameters.Add("@mat_khau", SqlDbType.NVarChar).Value = mat_khau;

        try
        {
            sqlCon.Open();
            count = sqlCom.ExecuteNonQuery();

        }
        catch (Exception ex) { }
        finally { sqlCon.Close(); }
        return count;
    }

}