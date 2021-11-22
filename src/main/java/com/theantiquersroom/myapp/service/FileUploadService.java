package com.theantiquersroom.myapp.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
    public String upload(MultipartFile file, String dirName) throws Exception;
}
