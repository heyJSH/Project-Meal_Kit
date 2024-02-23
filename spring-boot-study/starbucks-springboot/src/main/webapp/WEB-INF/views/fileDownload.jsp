<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.*, java.io.*, java.text.*" %>
<!-- 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
-->
<%
	request.setCharacterEncoding("utf-8");
	/*
	﻿if (ie) {
		fileName = URLEncoder.encode(file.getName(), "utf-8");
	} else {
		fileName = new String(file.getName().getBytes("utf-8"), "iso-8859-1");
	}
	*/
	
	String fileName = request.getParameter("filename");
	String fileNameEncoding = URLEncoder.encode(fileName, "utf-8");	// encode download처리
	//String fileWeb = request.getParameter("fileweb");
	//String fileName = URLEncoder.encode(fileWeb, "utf-8");	  
	//String fileName  = request.getParameter("fileweb");
	//String fileWeb = URLEncoder.encode(fileName, "utf-8");		
	//String fileName = request.getParameter("fileweb");
	//fileName = URLEncoder.encode(fileName, "utf-8");	
	
	String savePath = "D:\\temp2\\java_spring_lecture\\cotogether\\workspace_stsb_4_21\\starbucks-notice\\src\\main\\webapp\\upload-files";
	File file = new File(savePath + "\\" + fileName);
	//File file = new File(savePath + "\\" + fileWeb);
	
	response.setContentType("application/octet-stream");
	//response.setContentType("image/jpeg");
	//response.setContentLength(size);
	//response.setHeader("Content-Disposition","attachment;filename=\"./upload-files/" +fileName+"\";");
	response.setHeader("Content-Disposition","attachment;filename=" + fileNameEncoding + ";");
	//response.setHeader("Content-Disposition","attachment;filename=" +fileName+";");
	//response.setHeader("Content-Disposition","attachment;filename=" +fileweb+";");
	response.setHeader("Content-Transfer-Encoding", "binary");

	// http://localhost:8080/starbucks-notice/fileDownload.jsp?fileweb=jsp_01.png
			
	/*
	FileInputStream in = new FileInputStream(file);
	while(true) {
		byte[] buffer = new byte[1024 * 8];
		int count = in.read(buffer);
		
		if(count == -1)
		{
			break;
		}
		out.write(buffer, 0, count);
	}
	*/
	
	// out객체 초기화
	out.clear();
	pageContext.pushBody();
	
	BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
	
	int read = 0;
	byte b[] = new byte[1024 * 4];
	while ((read = fin.read(b)) != -1) {
		outs.write(b, 0, read);
	}
	outs.flush();
	outs.close();
	fin.close();
%>