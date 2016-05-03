package com.bionic.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;
import java.util.Random;

public class PasswordEncoder {

    private static PasswordEncoder instance;
    private static final int ITERATION_COUNT = 4;
    private static final Random rnd = new SecureRandom();

    private PasswordEncoder() {}

    public static synchronized PasswordEncoder getInstance() {
        if (instance == null) {
            return new PasswordEncoder();
        }
        return instance;
    }

    public synchronized String encode(String password, String saltKey) {
        MessageDigest digest = null;
        byte[] bytesPassword = null;
        try {
            digest = MessageDigest.getInstance("SHA-256");
            digest.reset();
            digest.update((password + saltKey).getBytes());
            bytesPassword = digest.digest((password + saltKey).getBytes("UTF-8"));
            for (int i = 0; i < ITERATION_COUNT; i++) {
                digest.reset();
                bytesPassword = digest.digest(bytesPassword);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return byteToBase64(bytesPassword);
    }

    private static byte[] base64ToByte(String saltKey) {
        Decoder decoder = Base64.getDecoder();
        return decoder.decode(saltKey);
    }

    private String byteToBase64(byte[] bytes) {
        Encoder encoder = Base64.getEncoder();
        return encoder.encodeToString(bytes);
    }

    public static synchronized String nextSALT() {
        byte[] salt = new byte[32];
        rnd.nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt);
    }
}