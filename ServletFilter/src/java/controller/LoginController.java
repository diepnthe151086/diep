/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import dal.UsageCountDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import model.Account;
import model.UsageCount;

/**
 *
 * @author ADMIN
 */
public class LoginController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDBContext db = new UserDBContext();
        Account account = db.getUserByUsernamePassword(username, password);

        // Giả sử kiểm tra tài khoản đúng, bạn có thể thay thế bằng kiểm tra thực tế
        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);

//             Tăng biến đếm và lưu vào cơ sở dữ liệu
            incrementUsageCount();

            response.sendRedirect(request.getContextPath() + "/auth/home"); // Chuyển hướng đến trang home
        } else {
            response.sendRedirect(request.getContextPath() + "/login?error=true"); // Chuyển hướng lại trang login nếu thất bại
        }
    }

    private void incrementUsageCount() {
        UsageCountDBContext usageCountDB = new UsageCountDBContext();
        UsageCount usageCount = usageCountDB.get(1);
        if (usageCount != null) {
            usageCount.setCount(usageCount.getCount() + 1);
            usageCountDB.update(usageCount);
        } else {
            usageCount = new UsageCount(1, 1);
            usageCountDB.insert(usageCount);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
