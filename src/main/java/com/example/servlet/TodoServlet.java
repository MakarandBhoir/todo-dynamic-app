package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TodoServlet", urlPatterns = { "/todos" })
public class TodoServlet extends HttpServlet {
    private List<String> todos = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("todos", todos);
        request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null)
            action = "add";

        if ("add".equals(action)) {
            String todo = request.getParameter("todo");
            if (todo != null && !todo.trim().isEmpty()) {
                todos.add(todo.trim());
            }
        } else if ("edit".equals(action)) {
            String indexStr = request.getParameter("index");
            String editTodo = request.getParameter("editTodo");
            if (indexStr != null && editTodo != null) {
                try {
                    int idx = Integer.parseInt(indexStr);
                    if (idx >= 0 && idx < todos.size() && !editTodo.trim().isEmpty()) {
                        todos.set(idx, editTodo.trim());
                    }
                } catch (NumberFormatException ignored) {
                }
            }
        } else if ("delete".equals(action)) {
            String indexStr = request.getParameter("index");
            if (indexStr != null) {
                try {
                    int idx = Integer.parseInt(indexStr);
                    if (idx >= 0 && idx < todos.size()) {
                        todos.remove(idx);
                    }
                } catch (NumberFormatException ignored) {
                }
            }
        }
        response.sendRedirect(request.getContextPath() + "/todos");
    }
}