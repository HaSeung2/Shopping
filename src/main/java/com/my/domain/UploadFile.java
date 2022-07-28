package com.my.domain;


import lombok.Data;

@Data
public class UploadFile {
	//같은 파일명으로 업로드 되어 덮어쓰기 되는 것을 방지하기 위해 구분
	  private String uploadFileName; //고객이 업로드한 파일명
	  private String storeFileName; //서버 내부에서 관리하는 파일명
	 
	 
	  public UploadFile(String uploadFileName, String storeFileName) {
	    this.uploadFileName = uploadFileName;
	    this.storeFileName = storeFileName;
	  }
}
