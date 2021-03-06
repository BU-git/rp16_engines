
package com.bionic.domain.xml;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.springframework.oxm.Marshaller;
import org.springframework.oxm.Unmarshaller;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;

import com.bionic.domain.order.Order;

public class XmlFileReader {

    private Marshaller marshaller;
    private Unmarshaller unmarshaller;

    public Marshaller getMarshaller() {
        return marshaller;
    }

    public void setMarshaller(Marshaller marshaller) {
        this.marshaller = marshaller;
    }

    public Unmarshaller getUnmarshaller() {
        return unmarshaller;
    }

    public void setUnmarshaller(Unmarshaller unmarshaller) {
        this.unmarshaller = unmarshaller;
    }

    public void convertFromObjectToXML(Object object, String filepath) throws IOException {
        FileOutputStream os = null;
        try {
            os = new FileOutputStream(filepath);
            getMarshaller().marshal(object, new StreamResult(os));
        } finally {
            if (os != null) {
                os.close();
            }
        }
    }
    public Order convertFromXMLToObject(byte[] xmlfile) throws Exception {
        Jaxb2Marshaller unmarshaller = (Jaxb2Marshaller) getUnmarshaller();
        try (InputStream fis = new ByteArrayInputStream(xmlfile)) {
            unmarshaller.afterPropertiesSet();
            return (Order) getUnmarshaller().unmarshal(new StreamSource(fis));
        } catch (Exception e) {
            throw e;
        }
    }
}