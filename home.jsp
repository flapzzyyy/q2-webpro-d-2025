<%@ include file="part/header.jsp" %>

    <div class="hero-unit">
        <h1>Welcome, <%= userLogin.username %>!</h1>
        
        <p>This is the Academic Information System Dashboard.</p>
        <p>
            <a href="mahasiswa.jsp" class="btn btn-primary btn-large">
                Manage Mahasiswa &raquo;
            </a>
            <a href="prodi.jsp" class="btn btn-info btn-large">
                View Prodi &raquo;
            </a>
        </p>
    </div>

    <div class="row">
        <div class="span4">
            <h2>User Profile</h2>
            <p>Logged in as: <strong><%= username %></strong></p>
            
            <p>Role: <span class="label label-success"><%= roleLogin.nama %></span></p>
        </div>
        <div class="span4">
            <h2>Quick Status</h2>
            <p>System is running normally.</p>
        </div>
        <div class="span4">
            <h2>Help</h2>
            <p>Contact the administrator if you have issues.</p>
        </div>
    </div>

<%@ include file="part/footer.jsp" %>