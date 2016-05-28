package com.bionic.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bionic.domain.Order;
import com.bionic.service.OrderService;

@RestController
//@MultipartConfig
public class OrderUploadController {

    private static final String ROOT = "reports";
    private static final String ARCHIVE = "archive";

    static {
        new File(ROOT).mkdir();
        new File(ARCHIVE).mkdir();
    }

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "orders/update", method = RequestMethod.POST)
    public ResponseEntity updateOrder(@RequestParam("number") long number, @RequestParam("email") String email,
                                      @RequestParam("lastAndroidChangeDate") long lastAndroidChangeDate,
                                      @RequestParam("orderStatus") int orderStatus) {
        Order order = orderService.getOrderForUser(number, email);
        if (order == null) return new ResponseEntity(HttpStatus.NOT_FOUND);
        if (order.getOrderStatus() == 3) return new ResponseEntity(HttpStatus.BAD_REQUEST);
        order.setLastAndroidChangeDate(new Date(lastAndroidChangeDate));
        order.setOrderStatus(orderStatus);
        if (orderStatus == 3) {
            String link = createZipFile(number);
            order.setPdfLink(link);
        }
        orderService.update(order);
        return new ResponseEntity(HttpStatus.OK);
    }

    private String createZipFile(long number) {
        Path folder = Paths.get(ROOT + "/" + number);
        Path zipFilePath = Paths.get(ARCHIVE + "/" + number + ".zip");
        File zip = new File(zipFilePath.toString());
        try {
            pack(folder, zipFilePath);
            //Files.delete(folder);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return zip.getAbsolutePath();
    }

    private void pack(final Path folder, final Path zipFilePath) throws IOException {
        try (FileOutputStream fos = new FileOutputStream(zipFilePath.toFile());
             ZipOutputStream zos = new ZipOutputStream(fos)) {

            Files.walkFileTree(folder, new SimpleFileVisitor<Path>() {
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
            });
        }
    }

    @RequestMapping(value = "upload/{number}", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity uploadFile(@PathVariable("number") long number,
                                     MultipartHttpServletRequest request) {
        Path reportFolder = Paths.get(ROOT + "/" + number);
        new File(reportFolder.toString()).mkdir();
        System.out.println("upload start!!!!!");
        List<MultipartFile> files = request.getFiles("file");
        try {
            for (MultipartFile part : files) {
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(new File(reportFolder + "/" + part.getOriginalFilename())));
                FileCopyUtils.copy(part.getInputStream(), stream);
                stream.close();
                System.out.println("Finishing file: " + part.getOriginalFilename());
            }
            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}