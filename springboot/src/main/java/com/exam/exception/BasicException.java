package com.exam.exception;

import lombok.Data;

@Data
public class BasicException extends RuntimeException {

    private int code;
    private String msg;

    public BasicException(int code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

}
