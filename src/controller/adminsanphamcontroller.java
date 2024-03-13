package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Date;
import java.util.ArrayList;

import bean.loaibean;
import bean.sanphambean;
import bo.loaibo;
import bo.sanphambo;

/**
 * Servlet implementation class adminsanphamcontroller
 */
@MultipartConfig
public class adminsanphamcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminsanphamcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			loaibo lbo = new loaibo();
			ArrayList<loaibean> dsloai = lbo.getloai();
			request.setAttribute("dsloai", lbo.getloai());
			
			sanphambo spbo = new sanphambo();
			ArrayList<sanphambean> ds = spbo.getsanpham();
			request.setAttribute("dssanpham", spbo.getsanpham());
			
			// chuc nang add update
			if(request.getParameter("butadd")!=null || request.getParameter("butupdate")!=null) {
			// upfile
				// láº¥y thÃ´ng tin anh trong "txtanh"
				Part part = request.getPart("txtanh");
				// Láº¥y Ä‘Æ°á»�ng dáº«n thá»±c táº¿ Ä‘áº¿n thÆ° má»¥c "/img" trong á»©ng dá»¥ng.
				String realPath = request.getServletContext().getRealPath("/img");
				
				// láº¥y tÃªn tá»‡p tá»« "part": sd getSubmittedFileName
				// sd Part.of: táº¡o Ä‘á»‘i tÆ°á»£ng "Path" tá»« tÃªn tá»‡p -> sd getFileName().toString() Ä‘á»ƒ láº¥y tÃªn tá»‡p (loáº¡i bá»� cÃ¡c pháº§n Ä‘Æ°á»�ng dáº«n)
				
				String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
				// kiá»ƒm tra xem folder cÃ³ chÆ°a. Náº¿u chÆ°a thÃ¬ táº¡o folder
				if (!Files.exists (Path.of(realPath))) {
					Files.createDirectory (Path.of (realPath));
				}			
				// lÆ°u áº£nh vÃ o thÆ° má»¥c "/img"
				part.write(realPath+"/"+filename);
				
				String anh = realPath+"/"+filename;
				String anhne = "img/"+filename;				
				
				// lay thong tin tá»« input
				String masanpham = request.getParameter("txtmsp");
				String tensanpham = request.getParameter("txttsp");
				String soluong = request.getParameter("txtsl");
				String gia = request.getParameter("txtgia");
				Date ngaynhap = new Date(System.currentTimeMillis());
				String tomtat = request.getParameter("txttomtat");
				String thongtinsanpham = request.getParameter("txtttsp");
				String maloai = request.getParameter("txtmaloai");

				if(request.getParameter("butadd")!=null) {
					// kiem tra masanpham Ä‘Ã£ tá»“n táº¡i chÆ°a (!=null: Ä‘Ã£ tá»“n táº¡i)
					if(spbo.SearchMSP(masanpham)!=null) {
						request.setAttribute("dssanpham", spbo.getsanpham());
				        
				        RequestDispatcher rd = request.getRequestDispatcher("adminsanpham.jsp?kt=1");
				        rd.forward(request, response);
					}
					if(spbo.SearchML(maloai)==null) {
						request.setAttribute("dssanpham", spbo.getsanpham());
				        
				        RequestDispatcher rd = request.getRequestDispatcher("adminsanpham.jsp?kt=4");
				        rd.forward(request, response);
					}
					else {
						spbo.ThemSanpham(masanpham, tensanpham, Long.parseLong(soluong), Long.parseLong(gia), anhne, ngaynhap, tomtat, thongtinsanpham, maloai);
						
						request.setAttribute("dssanpham", spbo.getsanpham());
						
						RequestDispatcher rd = request.getRequestDispatcher("adminsanpham.jsp?kt=2");
				        rd.forward(request, response);
					}	
				}
				if(request.getParameter("butupdate")!=null) {
					spbo.SuaSanpham(masanpham, tensanpham, Long.parseLong(soluong), Long.parseLong(gia), anhne, ngaynhap, tomtat, thongtinsanpham, maloai);
				}
			}
			
			// Lay thong tin tu báº£ng
			String tab = request.getParameter("tab");
			String msp = request.getParameter("msp");
			String tsp = request.getParameter("tsp");
			String sl = request.getParameter("sl");
			String g = request.getParameter("g");
			String ml = request.getParameter("ml");
			//funcion delete
			if(tab!=null && tab.equals("xoa")) {
				spbo.XoaSanpham(msp);
			}
			else 
				if(tab!=null && tab.equals("chon")) {
					request.setAttribute("msp", msp);
					request.setAttribute("tsp", tsp);
					request.setAttribute("sl", sl);
					request.setAttribute("g", g);
					request.setAttribute("ml", ml);
				}
			
			request.setAttribute("dssanpham", spbo.getsanpham());
	        
	        RequestDispatcher rd = request.getRequestDispatcher("adminsanpham.jsp");
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
