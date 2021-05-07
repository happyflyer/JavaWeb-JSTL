package org.example.java_web.jstl.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 流程处理标签
 *
 * @author lifei
 */
public class MessageService {
    private Message[] fakeMessages;
    private Map<String, String> fakeMessagesAsMap;

    public MessageService() {
        Message[] fm = new Message[3];
        fm[0] = new Message("zhangsan", "123456");
        fm[1] = new Message("lisi", "000000");
        fm[2] = new Message("wangwu", "888888");
        Map<String, String> fmm = new HashMap<>();
        for (Message m : fm) {
            fmm.put(m.name, m.text);
        }
        setFakeMessages(fm);
        setFakeMessagesAsMap(fmm);
    }

    public Message[] getFakeMessages() {
        return this.fakeMessages;
    }

    public void setFakeMessages(Message[] fakeMessages) {
        this.fakeMessages = fakeMessages;
    }

    public Map<String, String> getFakeMessagesAsMap() {
        return this.fakeMessagesAsMap;
    }

    public void setFakeMessagesAsMap(Map<String, String> fakeMessagesAsMap) {
        this.fakeMessagesAsMap = fakeMessagesAsMap;
    }

    public static class Message {
        private String name;
        private String text;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getText() {
            return text;
        }

        public void setText(String text) {
            this.text = text;
        }

        @Override
        public String toString() {
            return "Message{" +
                    "name='" + name + '\'' +
                    ", text='" + text + '\'' +
                    '}';
        }

        public Message(String name, String text) {
            this.name = name;
            this.text = text;
        }
    }
}
