package com.hoseok.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hi")
public class Nana extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO JAVADOCS: Ŭ���̾�Ʈ�� ���۵Ǵ� ������ ���� ���ڵ�(MIME ���� ����)�� ����
		response.setCharacterEncoding("UTF-8");
		//Ŭ���̾�Ʈ�� �ް����� ��� �ؼ��Ұ��ΰ��� ���� ������ ����
		// TODO JAVADOCS:  Ŭ���̾�Ʈ�� ���۵Ǵ� ������ ������ ������ �����մϴ�. �־��� ������ �������� ���� ���ڵ� ����� ���Ե� �� �ֽ��ϴ�
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		// �Էµ���(request) �̿� getParameter�� ������Ʈ���� Ű���带 �о��(������ ������ ���ڿ��� ���޵�)
		// �ٸ� �⺻���� �����Ƿ� ������Ʈ���� ���� ������ ������ ����.
		String cnt_ = request.getParameter("cnt");			// �ӽú��� : null, ""�� �������� ���������� ���� �ӽú���
		int cnt = 10;
		if (cnt_ != null && !cnt_.equals(""))
			cnt = Integer.parseInt(cnt_);
		
		 
		for (int i = 0; i < cnt; i++) {
			out.println((i + 1) + ": �ȳ� Servlet!!<br>");
		}
	}
}