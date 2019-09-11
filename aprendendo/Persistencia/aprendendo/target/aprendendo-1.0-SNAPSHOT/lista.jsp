<%-- 
    Document   : lista
    Created on : 11/09/2019, 09:25:53
    Author     : aluno
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="utilidade.HibernateUtil"%>
<%@page import="classe.Usuario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista dos usuários</h1>
        <%
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr= sessionRecheio.beginTransaction();
            String hql = "from usuario u";
            List<Usuario> lista= (list)sessionRecheio.createQuery(hql).list();
            tr.commit();
            
           request.setAttribute("usuario", lista);

        %>
        <display:table name="usuario">
        <display:column property="id" title="id"/>
        <display:column property="nome" title="nome"/>
        </display:table>
    </body>
</html>
