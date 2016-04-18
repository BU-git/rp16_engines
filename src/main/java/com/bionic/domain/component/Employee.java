
package com.bionic.domain.component;

import com.bionic.domain.Order;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name="employees")
@XmlRootElement
public class Employee {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;

    private int number;
    private String name;
    private String email;

  /*  @OneToOne
    private Order order;*/

    @XmlAttribute(name = "nummer")
    public int getNumber() {
        return number;
    }

    @XmlElement(name = "Naam")
    public String getName() {
        return name;
    }
    @XmlElement(name = "Email")
    public String getEmail() {
        return email;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

/*    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Employee)) return false;

        Employee employee = (Employee) o;

        if (number != employee.number) return false;
        if (name != null ? !name.equals(employee.name) : employee.name != null) return false;
        if (email != null ? !email.equals(employee.email) : employee.email != null) return false;
        return order != null ? order.equals(employee.order) : employee.order == null;

    }

    @Override
    public int hashCode() {
        int result = number;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (order != null ? order.hashCode() : 0);
        return result;
    }*/

    @Override
    public String toString() {
        return "Employee{" +
                "number=" + number +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                //", order=" + order +
                '}';
    }
}
