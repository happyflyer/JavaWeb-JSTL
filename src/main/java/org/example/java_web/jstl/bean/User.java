package org.example.java_web.jstl.bean;

import java.io.Serializable;

/**
 * 流程处理标签
 *
 * @author lifei
 */
public class User implements Serializable {
    private String name;
    private String password;

    public User() {
    }

    public User(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isValid() {
        return "zhangsan".equals(name) && "123456".equals(password);
    }
}
