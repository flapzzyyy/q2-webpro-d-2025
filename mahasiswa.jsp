<%@ include file="part/header.jsp" %>
<%
    if ( userLogin.kode_role > 3 ) {
        response.sendRedirect(request.getContextPath() + "/error-hak-akses.jsp");
        return;
    }

    String message = null;
    MahasiswaObject obj = new MahasiswaObject();
    UserObject uObj = new UserObject();
    JenisKelaminObject jkObj = new JenisKelaminObject();
    ProdiObject pObj = new ProdiObject();

    List<JenisKelaminObject> daftarJenisKelamin = jenisKelamin.list();
    List<UserObject> daftarUser = user.listByKodeRole(4);
    List<ProdiObject> daftarProdi = prodi.list(); 

    String actForm = "insert";
    String act = request.getParameter("act");

    if ( "edit".equals(act) ) {
        actForm = "update";
        String nim = varUtil.parseString(request.getParameter("nim"));
        obj = mahasiswa.get(nim);
        if(obj != null) {
            uObj = user.get(obj.username);
            jkObj = jenisKelamin.get(obj.kode_jenis_kelamin);
            pObj = prodi.get(obj.kode_prodi);
        }
    }
    else if("del".equals(act)){
        actForm = "delete";
        String nim = varUtil.parseString(request.getParameter("nim"));
        obj = mahasiswa.get(nim);
        if(obj != null) {
            uObj = user.get(obj.username);
            jkObj = jenisKelamin.get(obj.kode_jenis_kelamin);
            pObj = prodi.get(obj.kode_prodi);
        }
    }
    else if ( "update".equals(act) ) {
        try{
            MahasiswaObject ro = new MahasiswaObject();
            ro.nim = varUtil.parseString(request.getParameter("nim"));
            ro.nama = varUtil.parseString(request.getParameter("nama"));
            ro.kode_jenis_kelamin = varUtil.parseInt(request.getParameter("kode_jenis_kelamin"));
            ro.kode_prodi = varUtil.parseInt(request.getParameter("kode_prodi"));
            ro.username = varUtil.parseString(request.getParameter("username"));
            
            mahasiswa.update(ro);
            response.sendRedirect(request.getContextPath() + "/mahasiswa.jsp");
            return;
        }catch(Exception e){ message = e.toString(); }
    }
    else if( "insert".equals(act) ){
        try{
            MahasiswaObject ro = new MahasiswaObject();
            ro.nim = varUtil.parseString(request.getParameter("nim"));
            ro.nama = varUtil.parseString(request.getParameter("nama"));
            ro.kode_jenis_kelamin = varUtil.parseInt(request.getParameter("kode_jenis_kelamin"));
            ro.kode_prodi = varUtil.parseInt(request.getParameter("kode_prodi"));
            ro.username = varUtil.parseString(request.getParameter("username"));
            
            mahasiswa.insert(ro);
            response.sendRedirect(request.getContextPath() + "/mahasiswa.jsp");
            return;
        }catch(Exception e){ message = e.toString(); }
    }
    else if("delete".equals(act)){
        try{
            String nim = varUtil.parseString(request.getParameter("nim"));
            mahasiswa.delete(nim);
            response.sendRedirect(request.getContextPath() + "/mahasiswa.jsp");
            return;
        }catch(Exception e){ message = e.toString(); }
    }
%>

<div class="page-header">
    <h1>Manajemen Mahasiswa</h1>
</div>

<div class="btn-toolbar">
    <div class="btn-group">
        <a href="mahasiswa.jsp" class="btn btn-success"><i class="icon-plus icon-white"></i> Tambah Mahasiswa</a>
        <a href="mahasiswa-export.jsp" target="_blank" class="btn"><i class="icon-download"></i> Export Data</a>
        <a href="mahasiswa-import-dialog.jsp" class="btn"><i class="icon-upload"></i> Import Data</a>
    </div>
</div>

<% if(message != null){ %>
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Error!</strong> <%=message%>
    </div>
<% } %>

<div class="row">
    <div class="span4">
        <form method="post" action="mahasiswa.jsp" class="well">
            <input type="hidden" name="act" value="<%=actForm%>" />
            <fieldset>
                <legend><%=actForm.toUpperCase()%> DATA</legend>
                
                <label>NIM</label>
                <% if ( "update".equals(actForm) || "delete".equals(actForm) ) {%>
                    <input type="hidden" name="nim" value="<%=varUtil.show(obj.nim)%>" />
                    <span class="input-block-level uneditable-input"><%=varUtil.show(obj.nim)%></span>
                <% }else{ %>
                    <input type="text" name="nim" value="<%=varUtil.show(obj.nim)%>" class="input-block-level" required />
                <% } %>
                
                <label>Nama Lengkap</label>
                <% if ( "delete".equals(actForm) ) {%>
                    <input type="hidden" name="nama" value="<%=varUtil.show(obj.nama)%>" />
                    <span class="input-block-level uneditable-input"><%=varUtil.show(obj.nama)%></span>
                <% }else{ %>
                    <input type="text" name="nama" value="<%=varUtil.show(obj.nama)%>" class="input-block-level" required />
                <% } %>
                
                <label>Jenis Kelamin</label>
                <% if ( "delete".equals(actForm) ) {%>
                    <input type="hidden" name="kode_jenis_kelamin" value="<%=varUtil.show(obj.kode_jenis_kelamin)%>" />
                    <span class="input-block-level uneditable-input"><%=varUtil.show(jkObj.nama)%></span>
                <% }else{ %>
                    <select name="kode_jenis_kelamin" class="input-block-level">
                        <% for(JenisKelaminObject jkO : daftarJenisKelamin){ 
                            String selected = (obj.kode_jenis_kelamin == jkO.kode) ? "selected='selected'" : "";
                        %>
                        <option value="<%=jkO.kode%>" <%=selected%>><%=jkO.nama%></option>
                        <% } %>
                    </select>
                <% } %>
                
                <label>Program Studi</label>
                <% if ( "delete".equals(actForm) ) {%>
                    <input type="hidden" name="kode_prodi" value="<%=varUtil.show(obj.kode_prodi)%>" />
                    <span class="input-block-level uneditable-input"><%=varUtil.show(pObj.nama)%></span>
                <% }else{ %>
                    <select name="kode_prodi" class="input-block-level">
                        <% for(ProdiObject pO : daftarProdi){ 
                            String selected = (obj.kode_prodi == pO.kode) ? "selected='selected'" : "";
                        %>
                        <option value="<%=pO.kode%>" <%=selected%>><%=pO.nama%></option>
                        <% } %>
                    </select>
                <% } %>
                
                <label>Username (Login)</label>
                <% if ( "delete".equals(actForm) ) {%>
                    <input type="hidden" name="username" value="<%=varUtil.show(obj.username)%>" />
                    <span class="input-block-level uneditable-input"><%=varUtil.show(uObj.username)%></span>
                <% }else{ %>
                    <select name="username" class="input-block-level">
                        <% for(UserObject uO : daftarUser){ 
                            String selected = (uO.username.equals(obj.username)) ? "selected='selected'" : "";
                        %>
                        <option value="<%=uO.username%>" <%=selected%>><%=uO.username%></option>
                        <% } %>
                    </select>
                <% } %>
                
                <div style="margin-top: 20px;">
                    <button type="submit" class="btn btn-primary"><%=actForm.toUpperCase()%></button>
                    <a href="mahasiswa.jsp" class="btn">Cancel</a>
                </div>
            </fieldset>
        </form>
    </div>

    <div class="span8">
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>NIM</th>
                    <th>Nama</th>
                    <th>L/P</th>
                    <th>Prodi</th>
                    <th>Username</th>
                    <th style="width: 100px;">Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
            List<MahasiswaObject> daftar = mahasiswa.list();
            for(MahasiswaObject ro : daftar){
                UserObject uO = user.get(ro.username);
                JenisKelaminObject jkO = jenisKelamin.get(ro.kode_jenis_kelamin);
                ProdiObject pO = prodi.get(ro.kode_prodi);
            %>
                <tr>
                    <td><%=varUtil.show(ro.nim)%></td>
                    <td><%=varUtil.show(ro.nama)%></td>
                    <td><%=varUtil.show(jkO.nama)%></td>
                    <td><%=varUtil.show(pO.nama)%></td>
                    <td><%=varUtil.show(uO.username)%></td>
                    <td>
                        <div class="btn-group">
                            <a class="btn btn-mini btn-info" href="?act=edit&nim=<%=ro.nim%>"><i class="icon-edit icon-white"></i></a>
                            <a class="btn btn-mini btn-danger" href="?act=del&nim=<%=ro.nim%>"><i class="icon-trash icon-white"></i></a>
                        </div>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="part/footer.jsp" %>