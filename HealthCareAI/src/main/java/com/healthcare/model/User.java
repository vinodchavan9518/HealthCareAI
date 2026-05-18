package com.healthcare.model;

import java.util.Date;

public class User {
    private int userId;
    private String fullName;
    private String email;
    private String password;
    private String phone;
    private int age;
    private String bloodGroup;
    private String role;
    private Date createdAt;

    public User() {}

    public User(int userId, String fullName, String email, String password,
                String phone, int age, String bloodGroup, String role) {
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.age = age;
        this.bloodGroup = bloodGroup;
        this.role = role;
    }

    public int getUserId()          { return userId; }
    public void setUserId(int v)    { this.userId = v; }
    public String getFullName()     { return fullName; }
    public void setFullName(String v){ this.fullName = v; }
    public String getEmail()        { return email; }
    public void setEmail(String v)  { this.email = v; }
    public String getPassword()     { return password; }
    public void setPassword(String v){ this.password = v; }
    public String getPhone()        { return phone; }
    public void setPhone(String v)  { this.phone = v; }
    public int getAge()             { return age; }
    public void setAge(int v)       { this.age = v; }
    public String getBloodGroup()   { return bloodGroup; }
    public void setBloodGroup(String v){ this.bloodGroup = v; }
    public String getRole()         { return role; }
    public void setRole(String v)   { this.role = v; }
    public Date getCreatedAt()      { return createdAt; }
    public void setCreatedAt(Date v){ this.createdAt = v; }
}
