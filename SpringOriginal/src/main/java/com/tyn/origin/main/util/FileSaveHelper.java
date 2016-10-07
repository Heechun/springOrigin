package com.tyn.origin.main.util;

import java.io.File;
import java.util.UUID;

import javax.inject.Named;


import org.springframework.web.multipart.MultipartFile;


@Named
public class FileSaveHelper {
	
	private String saveDir = "D://upload/";
	public String save(MultipartFile fname){
		
		String storedFname = UUID.randomUUID().toString()+"_"+fname.getOriginalFilename();
		try {
			fname.transferTo(new File(saveDir+storedFname));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return storedFname;
	}

}
