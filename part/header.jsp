<%@ include file="/WEB-INF/includes/cek-session.jsp" %>
<%@ include file="/WEB-INF/modules/load.jsp" %>
<%
    String basePath = request.getContextPath();

    String username = (String) session.getAttribute("username");
    Db db = new Db();

    Connection con = db.createConnection();

    VarUtil varUtil = new VarUtil();
    JenisKelamin jenisKelamin = new JenisKelamin(con);
    Jenjang jenjang = new Jenjang(con);
    Role role = new Role(con);
    User user = new User(con);
    Prodi prodi = new Prodi(con);
    Mahasiswa mahasiswa = new Mahasiswa(con);

    UserObject userLogin = user.get(username);
    RoleObject roleLogin = role.get(userLogin.kode_role);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Q2 Webpro D 2025</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="<%=basePath%>/assets/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>/assets/css/bootstrap-responsive.css" rel="stylesheet">

    <style>
        body {
            padding-top: 60px; 
            padding-bottom: 40px;
        }
    </style>
</head>

<body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          
          <a class="brand" href="<%=basePath%>/home.jsp">Academic System</a>
          
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><a href="<%=basePath%>/home.jsp">Home</a></li>
              <li><a href="<%=basePath%>/role.jsp">Role</a></li>
              <li><a href="<%=basePath%>/jenis-kelamin.jsp">Jenis Kelamin</a></li>
              <li><a href="<%=basePath%>/jenjang.jsp">Jenjang</a></li>
              <li><a href="<%=basePath%>/prodi.jsp">Prodi</a></li>
              <li><a href="<%=basePath%>/user.jsp">User</a></li>
              <li><a href="<%=basePath%>/mahasiswa.jsp">Mahasiswa</a></li>
              <li><a href="<%=basePath%>/logout.jsp">Logout</a></li>
            </ul>
          </div></div>
      </div>
    </div>

    <div class="container">