package com.bionic.controller;

import com.bionic.domain.Order;
import com.bionic.domain.xml.XmlFileReader;
import com.bionic.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes("loggedInUser")
public class UploadController {

    @Autowired
    XmlFileReader fileReader;

    @Autowired
    OrderService orderService;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String uploadReceipts(@RequestParam("files[]") List<MultipartFile> file, ModelMap model) throws Exception {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        for (int i=0; i< file.size(); i++) {
            if (!file.get(i).isEmpty()) {
                File convFile = new File(file.get(i).getOriginalFilename());
                file.get(i).transferTo(convFile);
                Order order = fileReader.convertFromXMLToObject(convFile.getAbsolutePath());
                if (order != null) {
                    order.setLastServerChangeDate(new Date());
                    order.setImportDate(new Date());
                    orderService.save(order);
                }
            }
        }
        return "dashboard";
    }
}