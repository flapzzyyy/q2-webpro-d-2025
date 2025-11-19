<%@ include file="part/header.jsp" %>
<%
if ( userLogin.kode_role > 3 ) {
    response.sendRedirect(request.getContextPath() + "/error-hak-akses.jsp");
    return;
}

String message = null;
String actForm = "import";
String act = request.getParameter("act");

if ( "import".equals(act) ) {
    String newRandomName = null; 
    FileItem uploadedFileItem = null; 
    
    boolean isMultipart = JakartaServletFileUpload.isMultipartContent(request);

    if (isMultipart) {
        try {
            DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
            JakartaServletFileUpload upload = new JakartaServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(new JakartaServletRequestContext(request));

            for (FileItem item : items) {
                if (!item.isFormField() && "file".equals(item.getFieldName())) {
                    uploadedFileItem = item;
                    break; 
                }
            }
            
            if (uploadedFileItem != null && uploadedFileItem.getName() != null && !uploadedFileItem.getName().isEmpty()) {
                
                String uploadPath = Config.getTempDir();
                String originalFileName = new File(uploadedFileItem.getName()).getName();
                
                String extension = "";
                int i = originalFileName.lastIndexOf('.');
                if (i > 0) {
                    extension = originalFileName.substring(i);
                }
                newRandomName = UUID.randomUUID().toString() + extension;

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                Path finalFilePath = new File(uploadPath, newRandomName).toPath();

                uploadedFileItem.write(finalFilePath);

                response.sendRedirect(request.getContextPath() + "/mahasiswa-import-waiting.jsp?file=" + newRandomName);
                return; 

            } else {
                message = "Anda tidak memilih file untuk di-upload.";
            }

        } catch (Exception e) {
            message = "Upload Gagal: " + e.getMessage();
            e.printStackTrace(); 
        }
    } else {
        message = "Form tidak valid (bukan multipart/form-data).";
    }
}
%>

<div class="page-header">
    <h1>Import Data Mahasiswa</h1>
</div>

<div class="row">
    <div class="span12">
        <div class="alert alert-info">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>Petunjuk:</strong> Silahkan download template CSV terlebih dahulu, isi data, lalu upload kembali.
        </div>
    </div>
</div>

<div class="row">
    <div class="span6">
        <% if(message != null){ %>
            <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Error!</strong> <%=message%>
            </div>
        <% } %>

        <form method="post" action="mahasiswa-import-dialog.jsp?act=<%=actForm%>" enctype="multipart/form-data" class="well">
            <fieldset>
                <legend>Upload CSV</legend>
                
                <label>Pilih File CSV</label>
                <input type="file" name="file" class="input-block-level" required />
                
                <div style="margin-top: 20px;">
                    <button type="submit" class="btn btn-primary"><i class="icon-upload icon-white"></i> Upload & Proses</button>
                    <a href="mahasiswa.jsp" class="btn">Batal</a>
                </div>
            </fieldset>
        </form>
    </div>
    
    <div class="span6">
        <div class="well">
            <h3>Template Data</h3>
            <p>Gunakan file ini sebagai acuan format data.</p>
            <p>
                <a href="mahasiswa-template.csv" target="_blank" class="btn btn-success btn-large">
                    <i class="icon-download-alt icon-white"></i> Download Template CSV
                </a>
            </p>
        </div>
    </div>
</div>

<%@ include file="part/footer.jsp" %>