package me.nhom65.filter;

import java.io.IOException;
import java.util.Set;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebFilter("/*")
public class UserRequiredFilter implements Filter {

	
	 private static final Set<String> PUBLIC_PATHS = Set.of(
	            "/",
	            "/home",
	            "/login",
	            "/register",
	            "/products",
	            "/product-detail"
	    );
	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getServletPath();
        
        HttpSession session = req.getSession(false);
        Object user = (session != null)
                ? session.getAttribute("currentUser") //Session có attribute là user đã đăng nhập hiện tại
                : null;

        // file tĩnh, co the truy cap
        boolean isStaticResource =
                path.startsWith("/assets/")
                || path.startsWith("/css/")
                || path.startsWith("/js/")
                || path.startsWith("/images/");

        // public URL
        boolean isPublic =
                PUBLIC_PATHS.contains(path);

        // đã login
        boolean isLoggedIn = user != null;

        if (isStaticResource || isPublic || isLoggedIn) {
            chain.doFilter(request, response);
        } else {
        	res.sendRedirect(req.getContextPath() + "/login"); //Đưa về đăng nhập, nếu người dùng chưa đăng nhập.
        }
	}

}
