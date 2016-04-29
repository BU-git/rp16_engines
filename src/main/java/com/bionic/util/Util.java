package com.bionic.util;

public class Util {

    public static String emailTransformation(String email) {
        char[] chars = email.toCharArray();
        for (int i = chars.length-1; i >= 0; i--) {
            if (chars[i] == '_') {
                chars[i] = '.';
            }
            if (chars[i] == '@') {
                break;
            }
        }
        return new String(chars);
    }
}
