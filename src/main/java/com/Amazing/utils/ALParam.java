package com.Amazing.utils;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.AnLa.FILE.Log;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Service
public class ALParam {
	private static HttpServletRequest req;
    private static ServletContext sc;

    @Autowired
    public ALParam(HttpServletRequest pReq, ServletContext pSc) {
    	ALParam.req = pReq;
    	ALParam.sc = pSc;
    }
    
    /**Sử dụng phương thức này để lấy giá trị String của 1 tham số.
     * @param pName tên tham số cần lấy giá trị.
     * @return giá trị String của tham số.
     */
    public static String getString(String pName) {
        return req.getParameter(pName);
    }

    /**Sử dụng phương thức này để lấy giá trị Int của 1 tham số.
     * @param pName tên tham số cần lấy giá trị.
     * @return giá trị Int của tham số.
     */
    public static int getInt(String pName) {
        return Integer.parseInt(getString(pName));
    }

    /**Sử dụng phương thức này để lấy giá trị Double của 1 tham số.
     * @param pName tên tham số cần lấy giá trị.
     * @return giá trị Double của tham số.
     */
    public static double getDoub(String pName) {
        return Double.parseDouble(getString(pName));
    }

    /**Sử dụng phương thức này để lấy giá trị Boolean của 1 tham số.
     * @param pName tên tham số cần lấy giá trị.
     * @return giá trị Boolean của tham số.
     */
    public static boolean getBool(String pName) {
        return getString(pName) != null;
    }

    /**Sử dụng phương thức này để lấy giá trị Date của 1 tham số.
     * @param pName tên tham số cần lấy giá trị.
     * @return giá trị Date của tham số. Mặc định dùng biểu thức "yyyy-MM-dd"
     * @throws ParseException
     */
    public static Date getDate(String pName) throws ParseException {
        return getDate(pName, "yyyy-MM-dd");
    }

    /**Sử dụng phương thức này để lấy giá trị Date của 1 tham số theo biểu thức.
     * @param pName tên tham số cần lấy giá trị.
     * @param pPattern biểu thức ngày của tham số.
     * @return giá trị Date của tham số.
     * @throws ParseException
     */
    public static Date getDate(String pName, String pPattern) throws ParseException {
        return new SimpleDateFormat(pPattern).parse(getString(pName));
    }
    
    /**Sử dụng phương thức này để lấy file từ client.
     * @param pFile Tham số truyền file từ client. File được chứa mặc định tại folder "/Image/UsersFiles/"
     * @return File nếu xử lý thành công, ngược lại là null.
     * @throws IOException 
     * @throws IllegalStateException 
     */
    public static File saveFile(MultipartFile pFile) throws IllegalStateException, IOException {
    	return saveFile(pFile, "/Image/UsersFiles/");
    }
    
    /**Sử dụng phương thức này để lấy file từ client.
     * @param pFile Tham số truyền file từ client.
     * @param pFolderPath đường dẫn folder dùng để chứa file. Tên file mặc định là tên gốc.
     * @return File nếu xử lý thành công, ngược lại là null.
     * @throws IOException 
     * @throws IllegalStateException 
     */
    public static File saveFile(MultipartFile pFile, String pFolderPath) throws IllegalStateException, IOException {
    	return saveFile(pFile, pFolderPath, pFile.getOriginalFilename());
    }
    
    /**Sử dụng phương thức này để lấy file từ client.
     * @param pFile Tham số truyền file từ client.
     * @param pFolderPath đường dẫn folder dùng để chứa file.
     * @param pFileName tên file sẽ lưu.
     * @return File nếu xử lý thành công, ngược lại là null.
     * @throws IOException 
     * @throws IllegalStateException 
     */
    public static File saveFile(MultipartFile pFile, String pFolderPath, String pFileName) throws IllegalStateException, IOException {
    	if(!pFile.isEmpty()) {
            File dir = new File(sc.getRealPath(pFolderPath));
            if(!dir.exists()) dir.mkdir();
            File photoFile = new File(dir, pFileName);
            pFile.transferTo(photoFile);
            Log.add("ALParam - Save file successfully as Absolute Path: " + photoFile.getAbsolutePath());
            return photoFile;
    	}else throw new RuntimeException("No MultipartFile to save !!!");
    }
}
