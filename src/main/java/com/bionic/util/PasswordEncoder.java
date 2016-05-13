package com.bionic.util;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Random;

public class PasswordEncoder {

    private static PasswordEncoder instance;
    private static final int ITERATION_COUNT = 4;
    private static final Random rnd = new SecureRandom();

    private static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

    private PasswordEncoder() {}

    public static synchronized PasswordEncoder getInstance() {
        if (instance == null) {
            return new PasswordEncoder();
        }
        return instance;
    }

    public synchronized String encode(String password, String saltKey) {
        try {
            final MessageDigest digest = MessageDigest.getInstance("SHA-256");
            digest.reset();
            byte[] hash = (password + saltKey).getBytes("UTF-8");
            for (int i = 0; i < ITERATION_COUNT; i++) {
                digest.update(hash);
                hash = digest.digest();
            }
            return Util.convertByteArrayToHexString(hash);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static synchronized String nextSALT() {
        StringBuilder sb = new StringBuilder(32);
        for( int i = 0; i < 32; i++ )
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        return sb.toString();
    }

    public static synchronized String createPassword(int chars) {
        StringBuilder sb = new StringBuilder(chars);
        for( int i = 0; i < chars; i++ )
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        return sb.toString();
    }

}