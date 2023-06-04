package com.web.sarah.DTO;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class VnpayResDTO implements Serializable {
    private String status;
    private String messages;
    private String url;
}
