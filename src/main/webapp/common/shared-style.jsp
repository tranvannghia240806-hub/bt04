<style>
  :root{
    --primary:#4f46e5;
    --primary-dark:#4338ca;
    --danger:#dc2626;
    --success:#16a34a;
    --bg:#f3f4f6;
    --card-bg:#ffffff;
    --text:#1f2937;
    --muted:#6b7280;
    --border:#e5e7eb;
  }
  *{box-sizing:border-box;}
  body{
    font-family:'Segoe UI', Roboto, Arial, sans-serif;
    background:linear-gradient(135deg,#eef2ff 0%, #f9fafb 100%);
    color:var(--text);
    margin:0;
  }
  a{color:var(--primary);text-decoration:none;}
  a:hover{text-decoration:underline;}

  /* ---------- Auth pages (login/register/forgot) ---------- */
  .auth-wrapper{
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
    padding:24px;
  }
  .auth-box{
    width:100%;
    max-width:400px;
    background:var(--card-bg);
    padding:32px 28px;
    border-radius:12px;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
  }
  .auth-box h2{
    margin:0 0 20px;
    text-align:center;
    font-size:22px;
    color:var(--primary-dark);
  }
  .form-control{
    width:100%;
    padding:11px 12px;
    margin-bottom:14px;
    border:1px solid var(--border);
    border-radius:8px;
    font-size:14px;
    outline:none;
    transition:border-color .15s;
  }
  .form-control:focus{border-color:var(--primary);}
  .btn{
    display:inline-block;
    width:100%;
    padding:11px;
    border:none;
    border-radius:8px;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:background .15s;
  }
  .btn-primary{background:var(--primary);color:#fff;}
  .btn-primary:hover{background:var(--primary-dark);}
  .btn-secondary{background:#e5e7eb;color:#374151;}
  .btn-secondary:hover{background:#d1d5db;}
  .alert{
    padding:10px 12px;
    border-radius:8px;
    margin-bottom:14px;
    font-size:14px;
  }
  .alert-danger{background:#fee2e2;color:#991b1b;}
  .alert-success{background:#dcfce7;color:#166534;}
  .form-row{display:flex;align-items:center;gap:6px;margin-bottom:16px;font-size:14px;color:var(--muted);}
  .footer-link{text-align:center;margin-top:16px;font-size:14px;color:var(--muted);}
  .between-link{display:flex;justify-content:space-between;font-size:13px;margin:-6px 0 16px;}

  /* ---------- Admin / CRUD pages ---------- */
  .topbar{
    background:var(--card-bg);
    border-bottom:1px solid var(--border);
    padding:14px 28px;
    display:flex;
    justify-content:space-between;
    align-items:center;
  }
  .topbar h2{margin:0;font-size:20px;color:var(--primary-dark);}
  .topbar .user-info{font-size:14px;color:var(--muted);}
  .admin-tabs{
    background:var(--card-bg);
    border-bottom:1px solid var(--border);
    padding:0 28px;
    display:flex;
    gap:6px;
  }
  .admin-tabs a{
    display:inline-block;
    padding:12px 18px;
    font-size:14px;
    font-weight:600;
    color:var(--muted);
    border-bottom:3px solid transparent;
  }
  .admin-tabs a:hover{text-decoration:none;color:var(--primary-dark);}
  .admin-tabs a.active{color:var(--primary-dark);border-bottom-color:var(--primary);}
  .container{max-width:1100px;margin:28px auto;padding:0 24px;}
  select.form-control{appearance:auto;}
  .price{color:var(--danger);font-weight:700;}
  .btn-add{
    display:inline-block;
    margin-bottom:18px;
    padding:10px 18px;
    background:var(--success);
    color:#fff;
    border-radius:8px;
    font-weight:600;
    font-size:14px;
  }
  .btn-add:hover{background:#15803d;text-decoration:none;color:#fff;}
  table{
    width:100%;
    border-collapse:collapse;
    background:var(--card-bg);
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 2px 10px rgba(0,0,0,.05);
  }
  th,td{padding:12px 14px;text-align:left;border-bottom:1px solid var(--border);font-size:14px;}
  th{background:#eef2ff;color:var(--primary-dark);font-weight:600;}
  tbody tr:hover{background:#f9fafb;}
  img.thumb{border-radius:6px;object-fit:cover;box-shadow:0 1px 4px rgba(0,0,0,.15);}
  .action-link{margin-right:8px;font-weight:600;}
  .action-link.danger{color:var(--danger);}

  .form-card{
    max-width:480px;
    background:var(--card-bg);
    padding:28px;
    border-radius:12px;
    box-shadow:0 4px 16px rgba(0,0,0,.06);
  }
  .form-group{margin-bottom:16px;}
  .form-group label{display:block;margin-bottom:6px;font-weight:600;font-size:14px;color:var(--text);}
  .btn-row{display:flex;gap:10px;margin-top:8px;}
  .btn-row .btn{width:auto;padding:10px 22px;}
  .back-link{display:inline-block;margin-top:18px;font-size:14px;}
  .preview-img{display:block;margin-bottom:12px;border-radius:8px;box-shadow:0 1px 6px rgba(0,0,0,.15);}

  /* ---------- Shop-style navbar & category grid (trang /home) ---------- */
  .shop-navbar{
    background:var(--card-bg);
    border-bottom:1px solid var(--border);
    padding:14px 32px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    position:sticky;
    top:0;
    z-index:10;
  }
  .shop-navbar .brand{
    font-size:20px;
    font-weight:700;
    color:var(--primary-dark);
    letter-spacing:.3px;
  }
  .shop-navbar .nav-right{display:flex;align-items:center;gap:14px;font-size:14px;color:var(--muted);}
  .shop-navbar .nav-right a{font-weight:600;}

  .shop-hero{
    text-align:center;
    padding:36px 24px 8px;
  }
  .shop-hero h1{margin:0 0 6px;font-size:26px;color:var(--text);}
  .shop-hero p{margin:0;color:var(--muted);font-size:14px;}

  .cate-grid{
    max-width:1100px;
    margin:24px auto 60px;
    padding:0 24px;
    display:grid;
    grid-template-columns:repeat(auto-fill, minmax(180px, 1fr));
    gap:20px;
  }
  .cate-card{
    background:var(--card-bg);
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 2px 10px rgba(0,0,0,.06);
    text-align:center;
    transition:transform .15s, box-shadow .15s;
    text-decoration:none;
    color:var(--text);
    display:block;
  }
  .cate-card:hover{
    transform:translateY(-4px);
    box-shadow:0 8px 20px rgba(0,0,0,.12);
    text-decoration:none;
    color:var(--text);
  }
  .cate-card .cate-thumb-wrap{
    width:100%;
    aspect-ratio:1/1;
    background:#f3f4f6;
    display:flex;
    align-items:center;
    justify-content:center;
    overflow:hidden;
  }
  .cate-card img{width:100%;height:100%;object-fit:cover;}
  .cate-card .cate-name{
    padding:12px 10px;
    font-weight:600;
    font-size:14px;
  }
  .empty-state{
    text-align:center;
    color:var(--muted);
    padding:60px 20px;
    font-size:15px;
  }

  /* ---------- Product grid / pagination / detail ---------- */
  .section-title{
    max-width:1100px;
    margin:32px auto 4px;
    padding:0 24px;
    display:flex;
    justify-content:space-between;
    align-items:baseline;
  }
  .section-title h2{margin:0;font-size:20px;color:var(--text);}
  .section-title a{font-size:14px;font-weight:600;}

  .product-grid{
    max-width:1100px;
    margin:16px auto 40px;
    padding:0 24px;
    display:grid;
    grid-template-columns:repeat(auto-fill, minmax(200px, 1fr));
    gap:20px;
  }
  .product-card{
    background:var(--card-bg);
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 2px 10px rgba(0,0,0,.06);
    text-decoration:none;
    color:var(--text);
    display:block;
    transition:transform .15s, box-shadow .15s;
  }
  .product-card:hover{
    transform:translateY(-4px);
    box-shadow:0 8px 20px rgba(0,0,0,.12);
    text-decoration:none;
    color:var(--text);
  }
  .product-card .product-thumb-wrap{
    width:100%;
    aspect-ratio:1/1;
    background:#f3f4f6;
    display:flex;
    align-items:center;
    justify-content:center;
    overflow:hidden;
  }
  .product-card img{width:100%;height:100%;object-fit:cover;}
  .product-card .product-info{padding:12px 14px 16px;}
  .product-card .product-name{
    font-weight:600;
    font-size:14px;
    margin:0 0 6px;
    display:-webkit-box;
    -webkit-line-clamp:2;
    -webkit-box-orient:vertical;
    overflow:hidden;
    min-height:38px;
  }
  .product-card .product-price{color:var(--danger);font-weight:700;font-size:15px;}
  .product-card .product-cate{font-size:12px;color:var(--muted);margin-top:2px;}

  .pagination{
    max-width:1100px;
    margin:0 auto 60px;
    padding:0 24px;
    display:flex;
    justify-content:center;
    gap:8px;
  }
  .pagination a, .pagination span{
    display:inline-flex;
    align-items:center;
    justify-content:center;
    min-width:38px;
    height:38px;
    padding:0 10px;
    border-radius:8px;
    background:var(--card-bg);
    color:var(--text);
    font-size:14px;
    font-weight:600;
    box-shadow:0 1px 4px rgba(0,0,0,.08);
  }
  .pagination a:hover{background:#eef2ff;text-decoration:none;}
  .pagination .active{background:var(--primary);color:#fff;}
  .pagination .disabled{opacity:.4;pointer-events:none;}

  .detail-wrapper{max-width:1000px;margin:32px auto 60px;padding:0 24px;}
  .detail-card{
    background:var(--card-bg);
    border-radius:14px;
    box-shadow:0 4px 16px rgba(0,0,0,.06);
    padding:28px;
    display:grid;
    grid-template-columns:360px 1fr;
    gap:32px;
  }
  .detail-card .detail-img-wrap{
    width:100%;
    aspect-ratio:1/1;
    background:#f3f4f6;
    border-radius:12px;
    overflow:hidden;
    display:flex;align-items:center;justify-content:center;
  }
  .detail-card img{width:100%;height:100%;object-fit:cover;}
  .detail-card h1{margin:0 0 10px;font-size:24px;color:var(--text);}
  .detail-card .detail-price{font-size:26px;font-weight:800;color:var(--danger);margin:6px 0 16px;}
  .detail-card .detail-meta{font-size:14px;color:var(--muted);margin-bottom:16px;}
  .detail-card .detail-desc{font-size:15px;line-height:1.7;color:var(--text);white-space:pre-line;}
  @media (max-width:720px){
    .detail-card{grid-template-columns:1fr;}
  }
</style>
