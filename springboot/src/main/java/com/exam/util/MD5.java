package com.exam.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class MD5 {
    private static final char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8',
            '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    public static String encrypt(String abbr) throws NoSuchAlgorithmException {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(abbr.getBytes()); // 只有英文的的话可以不用指定getBytes的编码
            StringBuffer sb = new StringBuffer();
            for (byte b : bytes) {
                sb.append(hexDigits[b >>> 4 & 0xf]);
                sb.append(hexDigits[b & 0xf]);
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new NoSuchAlgorithmException("MD5加密出错: " + e.getMessage());
        }
    }

    public static void main(String[] args) throws NoSuchAlgorithmException {
        String testString;
        Scanner scanner = new Scanner(System.in);
        while (scanner.hasNext()) {
            testString = scanner.nextLine();
            System.out.println(MD5.encrypt(testString));
        }
    }
}