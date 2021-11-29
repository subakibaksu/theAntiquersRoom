package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.utils.AWSS3Uploader;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadServiceImpl implements FileUploadService {

    @Setter(onMethod_= {@Autowired})
    private AWSS3Uploader uploader;

    @Override
    public String upload(MultipartFile file, String dirName) throws Exception {
        return uploader.upload(file, dirName);
    } // upload()
}
