    </div> <hr>

    <footer class="container">
        <p>&copy; Q2 Web Programming D 2025</p>
    </footer>

    <script src="<%= request.getContextPath() %>/assets/js/jquery.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.js"></script>

   </body>
</html>

<%
    if (con != null) {
        try {
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>