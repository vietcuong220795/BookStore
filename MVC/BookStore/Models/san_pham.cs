//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BookStore.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class san_pham
    {
        public int id_san_pham { get; set; }
        public string ma_san_pham { get; set; }
        public string ten_san_pham { get; set; }
        public Nullable<int> ma_loai { get; set; }
        public string mo_ta_chi_tiet { get; set; }
        public Nullable<int> don_gia { get; set; }
        public string dvt { get; set; }
        public string tinh_trang { get; set; }
        public string hinh { get; set; }
        public Nullable<byte> san_pham_moi { get; set; }
        public string tac_gia { get; set; }
        public string nxb { get; set; }
        public Nullable<System.DateTime> ngay_xuat_ban { get; set; }
        public Nullable<int> so_trang { get; set; }
        public Nullable<int> danh_muc { get; set; }
    }
}
