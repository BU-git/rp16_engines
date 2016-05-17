package com.bionic.controller;

import java.io.File;
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

import com.bionic.domain.Order;
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
        System.err.println("");
        for (int i=0; i< file.size(); i++) {
            if (!file.get(i).isEmpty()) {
                File convFile = new File(file.get(i).getOriginalFilename());
                file.get(i).transferTo(convFile);
                Order order = fileReader.convertFromXMLToObject(convFile.getAbsolutePath());
                fileMeta = new FileMeta();
                fileMeta.setFileName(file.get(i).getOriginalFilename());
                fileMeta.setFileSize(file.get(i).getSize() / 1024 + " Kb");
                fileMeta.setFileType(file.get(i).getContentType());
                files.add(fileMeta);
                if (order != null) {
                    order.setLastServerChangeDate(new Date());
                    order.setImportDate(new Date());
                    orderService.save(order);
                }
            }
        }
        return files;
    }
}