package com.bionic.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Map;

import com.bionic.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.bionic.domain.order.Order;
import com.bionic.service.OrderService;

@RestController
//@MultipartConfig
public class OrderUploadController {

    private static final String ROOT = "temp";
    private static final String ARCHIVE = "archives";
    private static final String PDF = "pdfs";

    static {
        new File(ROOT).mkdir();
        new File(ARCHIVE).mkdir();
        new File(PDF).mkdir();
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
            String folder = ROOT + "/" + number;
            String zip = ARCHIVE + "/" + number;
            String link = Util.createZipFile(folder, zip);
            order.setPdfLink(PDF + "/Report_" + number + ".pdf");
            order.setZipLink(link);
        }
        orderService.update(order);
        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value = "upload/{number}", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity uploadFile(@PathVariable("number") long number,
                                     MultipartHttpServletRequest request) {
        Path reportFolder = Paths.get(ROOT + "/" + number);
        new File(reportFolder.toString()).mkdir();
        System.out.println("upload start!!!!!");
       /* System.out.println(request.getMultiFileMap());
        MultiValueMap<String, MultipartFile> map = request.getMultiFileMap();
        for (Map.Entry entry : map.entrySet()) {
            System.out.println(entry.getKey());
            System.out.println(entry.getValue());
        }*/
        try {
            MultipartFile part = request.getFile("file");
            String fileName = part.getOriginalFilename();
            File file = new File(reportFolder + "/" + fileName);

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(file));
            FileCopyUtils.copy(part.getInputStream(), stream);
            stream.close();
            if (fileName.contains("pdf")) {
                File pdf = new File(PDF + "/" + fileName);
                BufferedOutputStream stream2 = new BufferedOutputStream(
                        new FileOutputStream(pdf));
                FileCopyUtils.copy(part.getInputStream(), stream2);
                stream2.close();
            }

            System.out.println("Finishing file: " + part.getOriginalFilename());
            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}