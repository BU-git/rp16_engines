package com.bionic.domain.user;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserWrapper {

    @JsonProperty("Id")
    private long id;
    @JsonProperty("Name")
    private String name;
    @JsonProperty("Email")
    private String email;
    @JsonProperty("Number")
    private int number;
    @JsonProperty("Role")
    private String role;
    @JsonProperty("Action")
    private String action;

    private String password;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Override
    public String toString() {
        return "UserWrapper{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", number=" + number +
                ", role='" + role + '\'' +
                ", action='" + action + '\'' +
                '}';
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}