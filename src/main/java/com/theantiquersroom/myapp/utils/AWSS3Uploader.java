package com.theantiquersroom.myapp.utils;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Slf4j
@RequiredArgsConstructor
@Component
public class AWSS3Uploader {
    private final AmazonS3Client amazonS3Client;
    private final String BUCKET_NAME = "antiquers";

    public String upload(MultipartFile multipartFile, String dirName) throws IOException {
        File uploadFile = convert(multipartFile);
        String orgName = multipartFile.getOriginalFilename();
        String ext = orgName.substring(orgName.indexOf("."));
        return putS3(uploadFile, dirName + "/" + UUID.randomUUID() + ext);
    }

    private String putS3(File uploadFile, String fileName) {
        amazonS3Client.putObject(new PutObjectRequest(BUCKET_NAME, fileName, uploadFile).withCannedAcl(CannedAccessControlList.PublicRead));
        return amazonS3Client.getUrl(BUCKET_NAME, fileName).toString();
    }

    private File convert(MultipartFile file) throws IOException {
        File convertFile = new File(file.getOriginalFilename());
        file.transferTo(convertFile);
        return convertFile;
    }
}
