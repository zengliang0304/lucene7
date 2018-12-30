package com.lucene.bean;

public class User {

    int id;

    String erp;

    String username;

    String organization;

    public User() {
    }

    public User(int id, String erp, String username, String organization) {
        this.id = id;
        this.erp = erp;
        this.username = username;
        this.organization = organization;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getErp() {
        return erp;
    }

    public void setErp(String erp) {
        this.erp = erp;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", erp='" + erp + '\'' +
                ", username='" + username + '\'' +
                ", organization='" + organization + '\'' +
                '}';
    }
}
