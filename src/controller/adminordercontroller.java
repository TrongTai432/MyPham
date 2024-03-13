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

import bo.chitietbo;

/**
 * Servlet implementation class adminordercontroller
 */
public class adminordercontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminordercontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// lay machitiethoadon
			String mact = request.getParameter("mact");
			
			chitietbo ctbo = new chitietbo();
			if(mact != null) {
				// vi machitiethoadon kieu long nen phai doi sang long (chitietdao)
				ctbo.CapNhat(Long.parseLong(mact));
			}
			request.setAttribute("dshoadon", ctbo.gethoadonchuaxacnhan());
		
			RequestDispatcher rd = request.getRequestDispatcher("adminorder.jsp");
			rd.forward(request, response);
			
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
