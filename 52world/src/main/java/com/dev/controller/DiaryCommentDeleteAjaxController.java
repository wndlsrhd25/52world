package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.service.BffService;
import com.dev.service.DiaryService;

public class DiaryCommentDeleteAjaxController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/json;charset=utf-8");
		int commId= Integer.parseInt(req.getParameter("delId"));
		System.out.println(commId);
		DiaryService service=DiaryService.getInstance();
		boolean isDeleted = service.deleteComment(commId); //메소드, 함수 : 반환값, 매개변수


	}

}
