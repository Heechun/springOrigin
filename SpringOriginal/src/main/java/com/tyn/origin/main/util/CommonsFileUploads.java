package com.tyn.origin.main.util;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.multipart.MultipartFile;

import com.tyn.origin.main.vo.FileVO;
import com.tyn.origin.shop.dao.ShopDao;

public class CommonsFileUploads {
	@Inject
	private ShopDao shopDao;
	FileSaveHelper fileSaveHelper;
	public void commonsFileUpload(List<MultipartFile> mfile, String itemNum) {
		FileVO fileDto= null;
		for(MultipartFile uploadFile : mfile){
			if(!uploadFile.isEmpty()){
				String storedFname = fileSaveHelper.save(uploadFile);
				
				fileDto = new FileVO();
				fileDto.setOriginFname(uploadFile.getOriginalFilename());
				fileDto.setStoredFname(storedFname);
				fileDto.setFileLength(uploadFile.getSize());
				fileDto.setItemNum(itemNum);
				
				shopDao.insertFile(fileDto);
			}
		}
	}
}
