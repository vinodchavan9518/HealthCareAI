package com.healthcare.model;

public class Doctor {
    private int doctorId;
    private String fullName;
    private String specialization;
    private String email;
    private String phone;
    private int experience;
    private String availableDays;
    private String availableTime;
    private double fee;
    private String hospitalName;

    public Doctor() {}

    public int getDoctorId()             { return doctorId; }
    public void setDoctorId(int v)       { this.doctorId = v; }
    public String getFullName()          { return fullName; }
    public void setFullName(String v)    { this.fullName = v; }
    public String getSpecialization()    { return specialization; }
    public void setSpecialization(String v){ this.specialization = v; }
    public String getEmail()             { return email; }
    public void setEmail(String v)       { this.email = v; }
    public String getPhone()             { return phone; }
    public void setPhone(String v)       { this.phone = v; }
    public int getExperience()           { return experience; }
    public void setExperience(int v)     { this.experience = v; }
    public String getAvailableDays()     { return availableDays; }
    public void setAvailableDays(String v){ this.availableDays = v; }
    public String getAvailableTime()     { return availableTime; }
    public void setAvailableTime(String v){ this.availableTime = v; }
    public double getFee()               { return fee; }
    public void setFee(double v)         { this.fee = v; }
    public String getHospitalName()      { return hospitalName; }
    public void setHospitalName(String v){ this.hospitalName = v; }
}
