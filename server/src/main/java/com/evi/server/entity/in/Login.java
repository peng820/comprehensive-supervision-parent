package com.evi.server.entity.in;

import lombok.Data;

@Data
public class Login {

    String userName;

    String password;

    String captcha;

    String checkKey;

}
