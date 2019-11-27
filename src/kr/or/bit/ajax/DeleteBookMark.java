package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.BookMarkDao;
import kr.or.bit.dto.BookMark;

/**
 * Servlet implementation class InsertBookMark
 */
@WebServlet("/InsertBookMark")
public class DeleteBookMark extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteBookMark() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		BookMark bookMark = null;
		BookMarkDao dao = null;
		int result = 0;
		
		String userId = request.getParameter("userId");
		String aptNum = request.getParameter("aptNum");
		try {
			dao = new BookMarkDao();
			result = dao.deleteBookMark(userId, aptNum);
			if(result > 0) {
				out.print("<script>북마크가 삭제 되었습니다.</script>");
			}
    
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("북마크 delete ajax 오류");
		}
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
