package com.mvc.fotsal.message;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;

import java.util.HashMap;

public class gamemessageApp {
    public static void sendsms(String username, String userphone){
        String api_key = "NCSXPUDVOBBGI5RU"; //개인용키
        String api_secret = "8T30Q43ZRA38PXCSK1EKSRY8NQGQYDWY"; //개인용 시크릿 키
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", userphone); //수신번호
        params.put("from", "01094271829"); //발신번호
        params.put("type", "SMS");
        params.put("text", username + "님이 지원했습니다. 자세한 내용은 홈페이지에서 확인해주세요."); //문자내용
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }

    public static void sendmer(String merphone, String authorphone){
        String api_key = "NCSXPUDVOBBGI5RU"; //개인용키
        String api_secret = "8T30Q43ZRA38PXCSK1EKSRY8NQGQYDWY"; //개인용 시크릿 키
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", merphone); //수신번호
        params.put("from", "01094271829"); //발신번호
        params.put("type", "SMS");
        params.put("text", "용병으로 초대받았습니다. 경기 관리자 연락번호: " + authorphone); //문자내용
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }
}
