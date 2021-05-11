

import java.io.IOException;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import realproject.FileOperations;

/**
 * @author Team ACC (Amrit, Diyanshi, Gurpreet, Mounika, Neha)
 * Servlet implementation class Search_Engine
 */
@WebServlet("/Search_Engine")
public class Search_Engine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search_Engine() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String s=request.getParameter("search");
	    System.out.println("input: " + s);
		HashMap<String, Integer> pages = realproject.SearchEngine.search(s);
		//System.out.println(pages);
		String op="";
		String corrected = realproject.SearchEngine.output_corrected;
		HashMap<String , String > urlmap = null;
		if(pages != null) {
		Set<String> keys = pages.keySet();
		Iterator<String> setitr = keys.iterator();
		 urlmap = realproject.FileOperations.readurlmap();
		
		//print the hashmap 
		while(setitr.hasNext()) {
			String key = setitr.next();
		System.out.println(key+ " : " + pages.get(key));
		op+=(key+ " : " + pages.get(key)+"\n");
		}
		}
		
		
		PrintWriter o=response.getWriter();
		o.println(op);
		
		request.setAttribute("pages",pages);
		request.setAttribute("urlmap",urlmap);
		request.setAttribute("input",s);
		request.setAttribute("output",corrected);
		
		 request.getRequestDispatcher("/index.jsp").forward(request, response); 	
		
	
		
		//SearchEngine search=new SearchEngine();
		//search.search_engine(s);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
