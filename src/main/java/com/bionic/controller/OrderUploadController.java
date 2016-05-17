package com.bionic.controller;

import com.bionic.domain.Order;
import com.bionic.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@RestController
//@MultipartConfig
public class OrderUploadController {

    private static final String ROOT = "reports";

    static {
        new File(ROOT).mkdir();
    }

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "orders/update/{number}/{email:.+}", method = RequestMethod.POST)
    public ResponseEntity updateOrder(@PathVariable("number") long number, @PathVariable("email") String email,
                                      @RequestParam("lastAndroidChangeDate") long lastAndroidChangeDate,
                                      @RequestParam("orderStatus") int orderStatus) {
        Order order = orderService.getOrderForUser(number, email);
        if (order == null) return new ResponseEntity(HttpStatus.NOT_FOUND);
        order.setLastAndroidChangeDate(new Date(lastAndroidChangeDate));
        order.setOrderStatus(orderStatus);
        orderService.save(order);
        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value = "upload/{number}", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity uploadFile(@PathVariable("number") long number,
                                     MultipartHttpServletRequest request) {
        System.out.println("upload start!!!!!");
        List<MultipartFile> files = request.getFiles("file");

        try {
            File archive = new File(ROOT + number + ".zip");
            FileOutputStream fos = new FileOutputStream(archive);
            ZipOutputStream zos = new ZipOutputStream(fos);
            for (MultipartFile part : files) {
                zos.putNextEntry(new ZipEntry(part.getName()));

                FileCopyUtils.copy(part.getInputStream(), zos);
                zos.closeEntry();
            }
            zos.close();

            String link = archive.getAbsolutePath();
            Order order = orderService.findById(number);
            order.setPdfLink(link);
            orderService.save(order);
            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

   /* @RequestMapping(value = "upload/{number}", method = RequestMethod.POST, headers=("content-type=multipart*//*"), consumes = "multipart/form-data")
    public ResponseEntity uploadFile(@PathVariable("number") long number, MultipartHttpServletRequest request) {
        System.out.println("Starting upload method...");
        File folderForOrder = new File("pdf_reports/" + number);
        MultipartFile fileData = request.getFile("file");
        *//*if (fileData == null || fileData.isEmpty()) {
            System.out.println("File is empty");
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }*//*

        File file = null;
        if (!fileData.isEmpty()) {
            try {
                file = new File(ROOT + "/" + number + ".pdf");
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(file));
                FileCopyUtils.copy(fileData.getInputStream(), stream);
                stream.close();
                System.out.println("You successfully uploaded " + fileData.getName() + "!");
            } catch (Exception e) {
                e.printStackTrace();
                return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } else {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
        String link = file.getAbsolutePath();
        Order order = orderService.findById(number);
        order.setPdfLink(link);
        orderService.save(order);
        return new ResponseEntity(HttpStatus.OK);
    }*/

}
