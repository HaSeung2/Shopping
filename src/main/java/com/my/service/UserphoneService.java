package com.my.service;

import java.util.HashMap;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.my.domain.BuyProductDTO;

import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@Log4j
public class UserphoneService {

public String phone(String userphone) {
	String api_key = "NCSCTVONVQHFNXQD";
    String api_secret = "VU80WHPTTBSEPAAQN4CYO0VCLNJGABCP";
    Message coolsms = new Message(api_key, api_secret);
    Random random = new Random();
    String numStr = "";
    for(int i=0; i<6; i++) {
       String ran = Integer.toString(random.nextInt(10));
       numStr+=ran;
    }          
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", userphone);
    params.put("from", "01056419222");
    params.put("type", "SMS");
    params.put("text", "인증번호는 ["+numStr+"] 입니다.");
    params.put("app_version", "test app 1.2"); // application name and version
    try {
		coolsms.send(params); // 메시지 전송
	} catch (CoolsmsException e) {
		log.error(e);
	}
    return numStr;
	}
}
