﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class BESTBOOKVNEntities3 : DbContext
    {
        public BESTBOOKVNEntities3()
            : base("name=BESTBOOKVNEntities3")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<khach_hang> khach_hang { get; set; }
        public virtual DbSet<loai_san_pham> loai_san_pham { get; set; }
        public virtual DbSet<san_pham> san_pham { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<hoa_don> hoa_don { get; set; }
        public virtual DbSet<v_manga_comic> v_manga_comic { get; set; }
        public virtual DbSet<v_san_pham_moi> v_san_pham_moi { get; set; }
        public virtual DbSet<v_tieng_anh> v_tieng_anh { get; set; }
        public virtual DbSet<v_tieu_thuyet> v_tieu_thuyet { get; set; }
    
        public virtual ObjectResult<sp_dang_nhap_Result> sp_dang_nhap(string usr, string pass)
        {
            var usrParameter = usr != null ?
                new ObjectParameter("usr", usr) :
                new ObjectParameter("usr", typeof(string));
    
            var passParameter = pass != null ?
                new ObjectParameter("pass", pass) :
                new ObjectParameter("pass", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_dang_nhap_Result>("sp_dang_nhap", usrParameter, passParameter);
        }
    }
}
