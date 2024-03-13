package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import bean.khachhangbean;
import bo.khachhangbo;

/**
 * Servlet implementation class dangnhapxncontroller
 */
public class dangnhapxncontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapxncontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String tdn = request.getParameter("txttdn");
			String mk = request.getParameter("txtmk");
			
			khachhangbo khbo = new khachhangbo();
			if(tdn==null && mk==null) {
				RequestDispatcher rd = request.getRequestDispatcher("dangnhapxn.jsp");
				rd.forward(request, response);				
			}
			else {
				khachhangbean kh = khbo.ktdn(tdn, mk);
				if(kh!=null) {
					HttpSession session = request.getSession();
					session.setAttribute("dn", kh);
					response.sendRedirect("giohangcontroller");
				}
				else {
					RequestDispatcher rd = request.getRequestDispatcher("dangnhapxn.jsp?kt=1");
					rd.forward(request, response);							
				}
			}			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
