package org.example.java_web.jstl.fmt;

import java.util.Locale;
import java.util.ResourceBundle;

/**
 * i18N基础
 *
 * @author lifei
 */
public class Message {
    public static void main(String[] args) {
        Locale locale = new Locale("ko", "KR");
        ResourceBundle res = ResourceBundle.getBundle("messages", locale);
        System.out.println(res.getLocale());
        System.out.println(res.getString("welcome"));
        System.out.println(res.getString("name"));
    }
}
