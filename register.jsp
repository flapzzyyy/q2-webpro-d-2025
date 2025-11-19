<%@ include file="/WEB-INF/modules/load.jsp" %>
<%
    if ( session.getAttribute("username") != null ) {
        response.sendRedirect(request.getContextPath() + "/home.jsp");
        return;
    }

    VarUtil varUtil = new VarUtil();
    String message = null;
    String messageType = "alert-error";
    
    Db db = new Db();
    Connection con = null;
    List<RoleObject> roleList = new ArrayList<>();

    try {
        con = db.createConnection();
        
        Role roleModule = new Role(con);
        roleList = roleModule.list();

        if ("register".equals(request.getParameter("act"))) {
            
            String userParams = request.getParameter("username");
            String passParams = request.getParameter("password");
            String passConfirm = request.getParameter("confirm_password");
            
            int roleParam = varUtil.parseInt(request.getParameter("kode_role"));

            if (userParams == null || userParams.trim().isEmpty() || 
                passParams == null || passParams.trim().isEmpty()) {
                message = "Username and Password cannot be empty.";
            } 
            else if (!passParams.equals(passConfirm)) {
                message = "Password confirmation does not match.";
            } 
            else if (roleParam == 1) {
                message = "Registration as Administrator is not allowed.";
            }
            else if (roleParam == 0) {
                message = "Please select a valid role.";
            }
            else {
                User user = new User(con);

                if (user.get(userParams) != null) {
                    message = "Username <strong>" + userParams + "</strong> is already taken.";
                } else {
                    UserObject newUser = new UserObject();
                    newUser.username = userParams;
                    newUser.password = passParams;
                    newUser.kode_role = roleParam;

                    user.insert(newUser);

                    message = "Registration successful! You can now <a href='login.jsp'>Login</a>.";
                    messageType = "alert-success";
                }
            }
        }
    } catch (Exception e) {
        message = "System Error: " + e.getMessage();
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Register - Academic System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="<%= request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/assets/css/bootstrap-responsive.css" rel="stylesheet">
    
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }
      .form-signin {
        max-width: 350px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        border-radius: 5px;
        box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading {
        margin-bottom: 20px;
        text-align: center;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"],
      .form-signin select {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
    </style>
  </head>

  <body>

    <div class="container">

      <form class="form-signin" method="POST" action="register.jsp">
        <input type="hidden" name="act" value="register" />
        
        <h2 class="form-signin-heading">Create Account</h2>

        <% if(message != null){ %>
          <div class="alert <%=messageType%>">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <%=message%>
          </div>
        <% } %>

        <label>Username</label>
        <input type="text" name="username" class="input-block-level" placeholder="Choose a username" required>
        
        <label>Password</label>
        <input type="password" name="password" class="input-block-level" placeholder="Create a password" required>
        
        <label>Confirm Password</label>
        <input type="password" name="confirm_password" class="input-block-level" placeholder="Repeat password" required>
        
        <label>Register As</label>
        <select name="kode_role" class="input-block-level">
            <% 
            if (roleList != null) {
                for(RoleObject role : roleList) { 
                    if (role.kode == 1) continue;
            %>
                <option value="<%= role.kode %>"><%= role.nama %></option>
            <% 
                }
            } 
            %>
        </select>
        
        <br>
        <button class="btn btn-large btn-success btn-block" type="submit">Register</button>
        
        <div style="margin-top: 15px; text-align: center;">
            Already have an account? <a href="login.jsp">Sign In</a>
            <br>
            <a href="index.jsp">Back to Home</a>
        </div>
      </form>

    </div>

    <script src="<%= request.getContextPath() %>/assets/js/jquery.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.js"></script>

  </body>
</html>
<%
    if (con != null) {
        try { con.close(); } catch(Exception e){}
    }
%>