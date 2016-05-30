package com.bionic.controller;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.bionic.domain.order.Order;
import com.bionic.domain.order.FileMeta;
import com.bionic.domain.xml.XmlFileReader;
import com.bionic.service.OrderService;

@Controller
@SessionAttributes("loggedInUser")
public class UploadController {
    LinkedList<FileMeta> files;
    FileMeta fileMeta = null;

    @Autowired
    XmlFileReader fileReader;

    @Autowired
    OrderService orderService;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public @ResponseBody LinkedList<FileMeta> uploadReceipts(@RequestParam("files[]") List<MultipartFile> file, ModelMap model) throws Exception {
        if (!model.containsAttribute("loggedInUser")) return null;
        files = new LinkedList<>();
        if(file != null && file.size() > 0){
            for(MultipartFile m: file){
                if(m.getBytes() != null){
                    Order order = fileReader.convertFromXMLToObject(m.getBytes());
                    if (order != null) {
                        order.setLastServerChangeDate(new Date());
                        order.setImportDate(new Date());
                        orderService.save(order);
                        fileMeta = new FileMeta();
                        fileMeta.setFileName(m.getOriginalFilename());
                        fileMeta.setFileSize(m.getSize() / 1024 + " Kb");
                        fileMeta.setFileType(m.getContentType());
                        files.add(fileMeta);
                    }
                }
            }
        }
        return files;
    }
}