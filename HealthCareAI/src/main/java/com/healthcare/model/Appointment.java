package com.healthcare.model;

import java.util.Date;

public class Appointment {
    private int apptId;
    private int userId;
    private int doctorId;
    private Date apptDate;
    private String apptTime;
    private String status;
    private String symptoms;
    private String notes;
    private String doctorName;
    private String specialization;
    private String patientName;

    public Appointment() {}

    public int getApptId()              { return apptId; }
    public void setApptId(int v)        { this.apptId = v; }
    public int getUserId()              { return userId; }
    public void setUserId(int v)        { this.userId = v; }
    public int getDoctorId()            { return doctorId; }
    public void setDoctorId(int v)      { this.doctorId = v; }
    public Date getApptDate()           { return apptDate; }
    public void setApptDate(Date v)     { this.apptDate = v; }
    public String getApptTime()         { return apptTime; }
    public void setApptTime(String v)   { this.apptTime = v; }
    public String getStatus()           { return status; }
    public void setStatus(String v)     { this.status = v; }
    public String getSymptoms()         { return symptoms; }
    public void setSymptoms(String v)   { this.symptoms = v; }
    public String getNotes()            { return notes; }
    public void setNotes(String v)      { this.notes = v; }
    public String getDoctorName()       { return doctorName; }
    public void setDoctorName(String v) { this.doctorName = v; }
    public String getSpecialization()   { return specialization; }
    public void setSpecialization(String v){ this.specialization = v; }
    public String getPatientName()      { return patientName; }
    public void setPatientName(String v){ this.patientName = v; }
}
