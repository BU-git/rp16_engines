package com.bionic.util;

import java.io.*;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class Util {

    public static String convertByteArrayToHexString(byte[] arrayBytes) {
        StringBuilder stringBuilder = new StringBuilder();
        for (byte arrayByte : arrayBytes) {
            stringBuilder.append(Integer.toString((arrayByte & 0xff) + 0x100, 16).substring(1));
        }
        return stringBuilder.toString();
    }

    public static void deleteFolder(File folder) {
        if (folder.exists()) {
            String[] entries = folder.list();
            for (String s : entries) {
                File currentFile = new File(folder.getPath(), s);
                currentFile.delete();
            }
            folder.delete();
        }
    }

    public static String createZipFile(String folderPath, String zipPath) {
        Path folder = Paths.get(folderPath);
        Path zipFilePath = Paths.get(zipPath + ".zip");
        File zip = new File(zipFilePath.toString());
        try {
            pack(folder, zipFilePath);
            Util.deleteFolder(new File(folder.toString()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //System.out.println(zip.getAbsolutePath());
        return zip.getAbsolutePath();
    }

    private static void pack(final Path folder, final Path zipFilePath) throws IOException {
        try (FileOutputStream fos = new FileOutputStream(zipFilePath.toFile());
             ZipOutputStream zos = new ZipOutputStream(fos)) {
            File temp = folder.toFile();
            if(temp.exists()) {
                String[] entries = temp.list();
                for (String s : entries) {
                    File currentFile = new File(temp.getPath(), s);
                    zos.putNextEntry(new ZipEntry(currentFile.getName()));
                    Files.copy(currentFile.toPath(), zos);
                }
            }
            /*Files.walkFileTree(folder, new SimpleFileVisitor<Path>() {
                public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                    zos.putNextEntry(new ZipEntry(folder.relativize(file).toString()));
                    Files.copy(file, zos);
                    zos.closeEntry();
                    return FileVisitResult.CONTINUE;
                }

                public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                    zos.putNextEntry(new ZipEntry(folder.relativize(dir).toString() + "/"));
                    zos.closeEntry();
                    return FileVisitResult.CONTINUE;
                }
            });*/
        }
    }

    public static String convertInputStreamToString(InputStream inputStream) throws Exception {
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int length;
        while ((length = inputStream.read(buffer)) != -1) {
            result.write(buffer, 0, length);
        }
        return result.toString("UTF-8");
    }

    public static void removeFiles(long number) {
        File zip = new File("archives/"+number+".zip");
        zip.delete();
        File pdf = new File("pdfs/Report_" + number + ".pdf");
        pdf.delete();
    }
}
