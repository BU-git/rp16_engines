package com.bionic.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5SumChecker{

    public static String getFileMD5Sum(final File file) {
        final MessageDigest messageDigestMD5;
        try {
            messageDigestMD5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            return "";
        }

        byte[] buffer = new byte[8192];
        int read;
        try (InputStream is = new FileInputStream(file)) {
            while ((read = is.read(buffer)) > 0) {
                messageDigestMD5.update(buffer, 0, read);
            }

            return Util.convertByteArrayToHexString(messageDigestMD5.digest());
        } catch (IOException e) {
            return "";
        }
    }

    public static boolean check() {
        //TODO
        return true;
    }
}
