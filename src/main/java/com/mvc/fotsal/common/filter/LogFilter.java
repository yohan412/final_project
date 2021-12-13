package com.mvc.fotsal.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogFilter implements Filter{
	
	//로거 객체를 생성
	private Logger logger = LoggerFactory.getLogger(LogFilter.class);
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req =(HttpServletRequest)request;
		
		String remoteAddr =req.getRemoteAddr(); //ip주소
		String uri = req.getRequestURI();
		String url = req.getRequestURL().toString();
		String queryString = req.getQueryString();
		
		String referer = req.getHeader("referer");
		String agent = req.getHeader("User-Agent");
		
		String str = "";
		str += "remoteAddr"+remoteAddr+"\n";
		str += "uri: "+uri+"\n";
		str += "url: "+url+"\n";
		str += "queryString: "+queryString+"\n";
		str += "referer: "+referer+"\n";
		str += "agent: "+agent+"\n";
		
		logger.info("[LOG FILTER]\n"+str);
		
		chain.doFilter(req, response);
	}

	@Override
	public void destroy() {
		
	}

}
