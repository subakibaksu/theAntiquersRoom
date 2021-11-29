package com.theantiquersroom.myapp.Eception;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;


@Log4j2
@NoArgsConstructor(access=lombok.AccessLevel.PUBLIC)

@ControllerAdvice
public class CommonExceptionAdvice {

    @ResponseStatus(code=HttpStatus.BAD_REQUEST)
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, Model model) {
        log.debug("handleException({}, {}) invoked.", e, model);

        // 예외처리
        log.info("1. Exception Type: {}", e.getClass().getName());
        log.info("2. Exception Message: {}", e.getMessage());

        // 예외객체 뷰로 전달
        model.addAttribute("exception", e);

        return "/error/errorPage";
    } // handleException
}
