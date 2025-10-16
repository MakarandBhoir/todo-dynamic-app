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
                    <c:forEach var="todo" items="${todos}" varStatus="status">
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <span>${todo}</span>
                            <div class="btn-group" role="group">
                                <!-- Edit Form -->
                                <form method="post" action="${pageContext.request.contextPath}/todos" class="d-inline">
                                    <input type="hidden" name="action" value="edit" />
                                    <input type="hidden" name="index" value="${status.index}" />
                                    <input type="text" name="editTodo" value="${todo}"
                                        class="form-control d-inline-block" style="width: 120px; display: none;" />
                                    <button type="button" class="btn btn-warning btn-sm edit-btn">Edit</button>
                                    <button type="submit" class="btn btn-success btn-sm save-btn"
                                        style="display: none;">Save</button>
                                </form>
                                <!-- Delete Form -->
                                <form method="post" action="${pageContext.request.contextPath}/todos"
                                    class="d-inline ms-1">
                                    <input type="hidden" name="action" value="delete" />
                                    <input type="hidden" name="index" value="${status.index}" />
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
            <script>
                // Toggle edit mode for todo items
                document.addEventListener('DOMContentLoaded', function () {
                    document.querySelectorAll('.edit-btn').forEach(function (btn) {
                        btn.addEventListener('click', function () {
                            const form = btn.closest('form');
                            const input = form.querySelector('input[name="editTodo"]');
                            const saveBtn = form.querySelector('.save-btn');
                            if (input.style.display === 'none') {
                                input.style.display = 'inline-block';
                                saveBtn.style.display = 'inline-block';
                                btn.style.display = 'none';
                                input.focus();
                            }
                        });
                    });
                });
            </script>
        </body>

        </html>