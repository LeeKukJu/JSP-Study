package ch12.com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter {

	// 필터를 종료하기 전에 호출하도록 destroy() 메소드를 작성한다.
	@Override
	public void destroy() {
		System.out.println("Filter01 해제...");

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("Filter01.jsp 수행...");
		
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		
		// 이름을 입력받고 서버로 넘어오는 과정에서 해당 필터가 요청을 잡는다.
		// 이때, name키에 들어있는 값이 null 또는 공백인 경우 필터가 브라우저로 화를 내며 돌려보낸다!
		// "너 입력 안했어!! 다시 보내!!" 라고 하며 돌려보낸다.
		if(name == null || name.equals("")) {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			String msg = "입력된 name 값은 null 이잖아!!! 다시 입력해!!";
			
			pw.println(msg);
			return; // 요청 URL로 넘어가지 않고 해당 필터에서 응답 페이지가 결과로 나간다.
			
		}
		
		// 연속적으로 필터가 있으면 다음 필터로 제어를 넘기도록 FilterChain 객체 타입의 doFilter() 메소드를 작성한다.
		filterChain.doFilter(request, response);
	}
	
	// 필터를 초기화하도록 init() 메소드를 작성한다.
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("Filter01 초기화...");

	}

}
