<!-- filepath: todo-web-app/src/main/webapp/WEB-INF/views/index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://jakarta.ee/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Todo List</title>
            <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet">
        </head>

        <body>
            <div class="container py-5">
                <h1 class="mb-4">Todo List</h1>
                <form method="post" action="${pageContext.request.contextPath}/todos" class="mb-3">
                    <div class="input-group">
                        <input type="text" name="todo" class="form-control" placeholder="Add a new todo..." required>
                        <button class="btn btn-primary" type="submit">Add</button>
                    </div>
                </form>
                <ul class="list-group">
                    <c:forEach var="todo" items="${todos}">
                        <li class="list-group-item">${todo}</li>
                    </c:forEach>
                </ul>
            </div>
            <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
        </body>

        </html>