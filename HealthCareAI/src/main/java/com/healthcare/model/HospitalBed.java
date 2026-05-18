package com.healthcare.model;

import java.util.Date;

public class HospitalBed {
    private int bedId;
    private String wardName;
    private String bedNumber;
    private String bedType;
    private String status;
    private String patientName;
    private Date admittedDate;
    private int doctorId;
    private String doctorName;

    public HospitalBed() {}

    public int getBedId()               { return bedId; }
    public void setBedId(int v)         { this.bedId = v; }
    public String getWardName()         { return wardName; }
    public void setWardName(String v)   { this.wardName = v; }
    public String getBedNumber()        { return bedNumber; }
    public void setBedNumber(String v)  { this.bedNumber = v; }
    public String getBedType()          { return bedType; }
    public void setBedType(String v)    { this.bedType = v; }
    public String getStatus()           { return status; }
    public void setStatus(String v)     { this.status = v; }
    public String getPatientName()      { return patientName; }
    public void setPatientName(String v){ this.patientName = v; }
    public Date getAdmittedDate()       { return admittedDate; }
    public void setAdmittedDate(Date v) { this.admittedDate = v; }
    public int getDoctorId()            { return doctorId; }
    public void setDoctorId(int v)      { this.doctorId = v; }
    public String getDoctorName()       { return doctorName; }
    public void setDoctorName(String v) { this.doctorName = v; }
}
