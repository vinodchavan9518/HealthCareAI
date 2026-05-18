package com.healthcare.model;

import java.util.Date;

public class MedicineReminder {
    private int reminderId;
    private int userId;
    private String medicineName;
    private String dosage;
    private String frequency;
    private String reminderTime;
    private Date startDate;
    private Date endDate;
    private String status;

    public MedicineReminder() {}

    public int getReminderId()           { return reminderId; }
    public void setReminderId(int v)     { this.reminderId = v; }
    public int getUserId()               { return userId; }
    public void setUserId(int v)         { this.userId = v; }
    public String getMedicineName()      { return medicineName; }
    public void setMedicineName(String v){ this.medicineName = v; }
    public String getDosage()            { return dosage; }
    public void setDosage(String v)      { this.dosage = v; }
    public String getFrequency()         { return frequency; }
    public void setFrequency(String v)   { this.frequency = v; }
    public String getReminderTime()      { return reminderTime; }
    public void setReminderTime(String v){ this.reminderTime = v; }
    public Date getStartDate()           { return startDate; }
    public void setStartDate(Date v)     { this.startDate = v; }
    public Date getEndDate()             { return endDate; }
    public void setEndDate(Date v)       { this.endDate = v; }
    public String getStatus()            { return status; }
    public void setStatus(String v)      { this.status = v; }
}
