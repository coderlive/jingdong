package com.service.inner;

public interface JavaMailService {

    public boolean sendTextMail(String from, String to, String subject, String content);
}

