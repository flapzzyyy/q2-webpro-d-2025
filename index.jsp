<%@ include file="/WEB-INF/modules/load.jsp" %>
<%
    if ( session.getAttribute("username") != null ) {
        response.sendRedirect(request.getContextPath() + "/home.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Welcome - Academic System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="<%= request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/assets/css/bootstrap-responsive.css" rel="stylesheet">
    
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }
      .hero-unit {
        text-align: center;
        background-color: #fff;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      }
    </style>
</head>

<body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="#">Academic Information System</a>
        </div>
      </div>
    </div>

    <div class="container">

      <div class="hero-unit">
        <h1>Welcome to AIS</h1>
        <p class="lead">
            Manage Students, Study Programs, and Academic Data efficiently.<br>
            Please sign in to continue or create a new account.
        </p>
        <br>
        <p>
          <a href="login.jsp" class="btn btn-primary btn-large">
            <i class="icon-user icon-white"></i> Sign In
          </a>
          &nbsp; OR &nbsp;
          <a href="register.jsp" class="btn btn-success btn-large">
            <i class="icon-pencil icon-white"></i> Register Now
          </a>
        </p>
      </div>

      <div class="row">
        <div class="span4">
          <h2><i class="icon-book"></i> Data Management</h2>
          <p>Easily manage student data, export/import CSV files, and track academic progress.</p>
        </div>
        <div class="span4">
          <h2><i class="icon-lock"></i> Secure Access</h2>
          <p>Role-based security ensures that only authorized personnel can access sensitive data.</p>
       </div>
        <div class="span4">
          <h2><i class="icon-th-list"></i> Easy to Use</h2>
          <p>Built with a simple, responsive interface that works on desktop and mobile devices.</p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Q2 Web Programming D 2025</p>
      </footer>

    </div>

    <script src="<%= request.getContextPath() %>/assets/js/jquery.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.js"></script>

</body>
</html>