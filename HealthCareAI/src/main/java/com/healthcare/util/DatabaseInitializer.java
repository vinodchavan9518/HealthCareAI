package com.healthcare.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DatabaseInitializer {

    public static void initializeDatabase() {

        try {

            Connection con =
                    DBConnection.getConnection();

            // ================= USERS TABLE =================

            String usersTable =

                    "CREATE TABLE users ("
                    + "user_id NUMBER PRIMARY KEY, "
                    + "full_name VARCHAR2(100), "
                    + "email VARCHAR2(100) UNIQUE, "
                    + "password VARCHAR2(100), "
                    + "phone VARCHAR2(20), "
                    + "age NUMBER, "
                    + "blood_group VARCHAR2(10), "
                    + "role VARCHAR2(20), "
                    + "created_at DATE"
                    + ")";

            try {

                PreparedStatement ps =
                        con.prepareStatement(usersTable);

                ps.execute();

                System.out.println(
                        "USERS TABLE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "USERS TABLE ALREADY EXISTS");
            }

            // ================= USERS SEQUENCE =================

            String usersSeq =

                    "CREATE SEQUENCE users_seq "
                    + "START WITH 1 "
                    + "INCREMENT BY 1";

            try {

                PreparedStatement ps =
                        con.prepareStatement(usersSeq);

                ps.execute();

                System.out.println(
                        "USERS SEQUENCE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "USERS SEQUENCE ALREADY EXISTS");
            }

            // ================= DOCTORS TABLE =================

            String doctorsTable =

                    "CREATE TABLE doctors ("
                    + "doctor_id NUMBER PRIMARY KEY, "
                    + "full_name VARCHAR2(100), "
                    + "specialization VARCHAR2(100), "
                    + "email VARCHAR2(100), "
                    + "phone VARCHAR2(20), "
                    + "experience NUMBER, "
                    + "available_days VARCHAR2(100), "
                    + "available_time VARCHAR2(100), "
                    + "fee NUMBER(10,2), "
                    + "hospital_name VARCHAR2(100)"
                    + ")";

            try {

                PreparedStatement ps =
                        con.prepareStatement(doctorsTable);

                ps.execute();

                System.out.println(
                        "DOCTORS TABLE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "DOCTORS TABLE ALREADY EXISTS");
            }

            // ================= DOCTOR SEQUENCE =================

            String doctorSeq =

                    "CREATE SEQUENCE doctor_seq "
                    + "START WITH 1 "
                    + "INCREMENT BY 1";

            try {

                PreparedStatement ps =
                        con.prepareStatement(doctorSeq);

                ps.execute();

                System.out.println(
                        "DOCTOR SEQUENCE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "DOCTOR SEQUENCE ALREADY EXISTS");
            }

            // ================= APPOINTMENTS TABLE =================

            String appointmentsTable =

                    "CREATE TABLE appointments ("
                    + "appt_id NUMBER PRIMARY KEY, "
                    + "user_id NUMBER, "
                    + "doctor_id NUMBER, "
                    + "appt_date DATE, "
                    + "appt_time VARCHAR2(30), "
                    + "status VARCHAR2(30), "
                    + "symptoms VARCHAR2(500), "
                    + "notes VARCHAR2(500), "
                    + "created_at DATE"
                    + ")";

            try {

                PreparedStatement ps =
                        con.prepareStatement(appointmentsTable);

                ps.execute();

                System.out.println(
                        "APPOINTMENTS TABLE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "APPOINTMENTS TABLE ALREADY EXISTS");
            }

            // ================= APPOINTMENT SEQUENCE =================

            String apptSeq =

                    "CREATE SEQUENCE appt_seq "
                    + "START WITH 1 "
                    + "INCREMENT BY 1";

            try {

                PreparedStatement ps =
                        con.prepareStatement(apptSeq);

                ps.execute();

                System.out.println(
                        "APPOINTMENT SEQUENCE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "APPOINTMENT SEQUENCE ALREADY EXISTS");
            }
         // ================= MEDICINE REMINDER TABLE =================

            String reminderTable =

                    "CREATE TABLE medicine_reminders ("
                    + "reminder_id NUMBER PRIMARY KEY, "
                    + "user_id NUMBER, "
                    + "medicine_name VARCHAR2(100), "
                    + "dosage VARCHAR2(100), "
                    + "frequency VARCHAR2(100), "
                    + "reminder_time VARCHAR2(50), "
                    + "start_date DATE, "
                    + "end_date DATE"
                    + ")";

            try {

                PreparedStatement ps =
                        con.prepareStatement(reminderTable);

                ps.execute();

                System.out.println(
                        "MEDICINE TABLE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "MEDICINE TABLE ALREADY EXISTS");
            }

            // ================= REMINDER SEQUENCE =================

            String reminderSeq =

                    "CREATE SEQUENCE reminder_seq "
                    + "START WITH 1 "
                    + "INCREMENT BY 1";

            try {

                PreparedStatement ps =
                        con.prepareStatement(reminderSeq);

                ps.execute();

                System.out.println(
                        "REMINDER SEQUENCE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "REMINDER SEQUENCE ALREADY EXISTS");
            }

            // ================= HOSPITAL BEDS TABLE =================

            String bedsTable =

                    "CREATE TABLE hospital_beds ("
                    + "bed_id NUMBER PRIMARY KEY, "
                    + "ward_name VARCHAR2(100), "
                    + "bed_number VARCHAR2(50), "
                    + "bed_type VARCHAR2(50), "
                    + "status VARCHAR2(30), "
                    + "patient_name VARCHAR2(100), "
                    + "doctor_name VARCHAR2(100), "
                    + "admitted_date DATE"
                    + ")";

            try {

                PreparedStatement ps =
                        con.prepareStatement(bedsTable);

                ps.execute();

                System.out.println(
                        "BEDS TABLE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "BEDS TABLE ALREADY EXISTS");
            }

            // ================= BED SEQUENCE =================

            String bedSeq =

                    "CREATE SEQUENCE bed_seq "
                    + "START WITH 1 "
                    + "INCREMENT BY 1";

            try {

                PreparedStatement ps =
                        con.prepareStatement(bedSeq);

                ps.execute();

                System.out.println(
                        "BED SEQUENCE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "BED SEQUENCE ALREADY EXISTS");
            }

            // ================= REPORT TABLE =================

            String reportTable =

                    "CREATE TABLE reports ("
                    + "report_id NUMBER PRIMARY KEY, "
                    + "user_id NUMBER, "
                    + "report_text CLOB, "
                    + "analysis CLOB, "
                    + "created_at DATE"
                    + ")";

            try {

                PreparedStatement ps =
                        con.prepareStatement(reportTable);

                ps.execute();

                System.out.println(
                        "REPORT TABLE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "REPORT TABLE ALREADY EXISTS");
            }

            // ================= REPORT SEQUENCE =================

            String reportSeq =

                    "CREATE SEQUENCE report_seq "
                    + "START WITH 1 "
                    + "INCREMENT BY 1";

            try {

                PreparedStatement ps =
                        con.prepareStatement(reportSeq);

                ps.execute();

                System.out.println(
                        "REPORT SEQUENCE CREATED");

            } catch (Exception e) {

                System.out.println(
                        "REPORT SEQUENCE ALREADY EXISTS");
            }// ================= EMERGENCY TABLE =================

String emergencyTable =

        "CREATE TABLE emergency_requests ("
        + "request_id NUMBER PRIMARY KEY, "
        + "user_id NUMBER, "
        + "patient_name VARCHAR2(100), "
        + "phone VARCHAR2(20), "
        + "location VARCHAR2(300), "
        + "status VARCHAR2(30), "
        + "created_at DATE"
        + ")";

try {

    PreparedStatement ps =
            con.prepareStatement(emergencyTable);

    ps.execute();

    System.out.println(
            "EMERGENCY TABLE CREATED");

} catch (Exception e) {

    System.out.println(
            "EMERGENCY TABLE ALREADY EXISTS");
}
           
String emergencySeq =

"CREATE SEQUENCE emergency_seq "
+ "START WITH 1 "
+ "INCREMENT BY 1";

try {

PreparedStatement ps =
    con.prepareStatement(emergencySeq);

ps.execute();

System.out.println(
    "EMERGENCY SEQUENCE CREATED");

} catch (Exception e) {

System.out.println(
    "EMERGENCY SEQUENCE ALREADY EXISTS");
}

//================= REVIEW TABLE =================

String reviewTable =

     "CREATE TABLE doctor_reviews ("
     + "review_id NUMBER PRIMARY KEY, "
     + "doctor_id NUMBER, "
     + "user_id NUMBER, "
     + "rating NUMBER, "
     + "review_text VARCHAR2(1000), "
     + "created_at DATE"
     + ")";

try {

 PreparedStatement ps =
         con.prepareStatement(reviewTable);

 ps.execute();

 System.out.println(
         "REVIEW TABLE CREATED");

} catch (Exception e) {

 System.out.println(
         "REVIEW TABLE ALREADY EXISTS");
}


String reviewSeq =

"CREATE SEQUENCE review_seq "
+ "START WITH 1 "
+ "INCREMENT BY 1";

try {

PreparedStatement ps =
    con.prepareStatement(reviewSeq);

ps.execute();

System.out.println(
    "REVIEW SEQUENCE CREATED");

} catch (Exception e) {

System.out.println(
    "REVIEW SEQUENCE ALREADY EXISTS");
}

//================= BMI TABLE =================

String bmiTable =

     "CREATE TABLE bmi_records ("
     + "bmi_id NUMBER PRIMARY KEY, "
     + "user_id NUMBER, "
     + "height NUMBER, "
     + "weight NUMBER, "
     + "bmi_value NUMBER(5,2), "
     + "status VARCHAR2(50), "
     + "created_at DATE"
     + ")";

try {

 PreparedStatement ps =
         con.prepareStatement(bmiTable);

 ps.execute();

 System.out.println(
         "BMI TABLE CREATED");

} catch (Exception e) {

 System.out.println(
         "BMI TABLE ALREADY EXISTS");
}

String bmiSeq =

"CREATE SEQUENCE bmi_seq "
+ "START WITH 1 "
+ "INCREMENT BY 1";

try {

PreparedStatement ps =
    con.prepareStatement(bmiSeq);

ps.execute();

System.out.println(
    "BMI SEQUENCE CREATED");

} catch (Exception e) {

System.out.println(
    "BMI SEQUENCE ALREADY EXISTS");
}
//================= LAB TEST TABLE =================

String labTable =

     "CREATE TABLE lab_tests ("
     + "test_id NUMBER PRIMARY KEY, "
     + "user_id NUMBER, "
     + "test_name VARCHAR2(100), "
     + "test_date DATE, "
     + "status VARCHAR2(30), "
     + "created_at DATE"
     + ")";

try {

 PreparedStatement ps =
         con.prepareStatement(labTable);

 ps.execute();

 System.out.println(
         "LAB TEST TABLE CREATED");

} catch (Exception e) {

 System.out.println(
         "LAB TEST TABLE ALREADY EXISTS");
}
String labSeq =

"CREATE SEQUENCE lab_seq "
+ "START WITH 1 "
+ "INCREMENT BY 1";

try {

PreparedStatement ps =
    con.prepareStatement(labSeq);

ps.execute();

System.out.println(
    "LAB SEQUENCE CREATED");

} catch (Exception e) {

System.out.println(
    "LAB SEQUENCE ALREADY EXISTS");
}
    
String labSeq1 =

"CREATE SEQUENCE lab_seq "
+ "START WITH 1 "
+ "INCREMENT BY 1";

try {

PreparedStatement ps =
    con.prepareStatement(labSeq1);

ps.execute();

System.out.println(
    "LAB SEQUENCE CREATED");

} catch (Exception e) {

System.out.println(
    "LAB SEQUENCE ALREADY EXISTS");
}
//================= PAYMENTS TABLE =================

String paymentTable =

"CREATE TABLE payments ("
+ "payment_id NUMBER PRIMARY KEY, "
+ "user_id NUMBER, "
+ "appt_id NUMBER, "
+ "amount NUMBER(10,2), "
+ "payment_method VARCHAR2(50), "
+ "payment_status VARCHAR2(30), "
+ "payment_date DATE"
+ ")";

try {

 PreparedStatement ps =
         con.prepareStatement(paymentTable);

 ps.execute();

 System.out.println(
         "PAYMENTS TABLE CREATED");

} catch(Exception e){

 System.out.println(
         "PAYMENTS TABLE ALREADY EXISTS");
}

//================= PAYMENT SEQUENCE =================

String paymentSeq =

"CREATE SEQUENCE payment_seq "
+ "START WITH 1 "
+ "INCREMENT BY 1";

try {

 PreparedStatement ps =
         con.prepareStatement(paymentSeq);

 ps.execute();

} catch(Exception e){

 System.out.println(
         "PAYMENT SEQUENCE ALREADY EXISTS");
}


//================= AMBULANCE TABLE =================

String ambulanceTable =

"CREATE TABLE ambulance_requests ("
+ "request_id NUMBER PRIMARY KEY, "
+ "user_id NUMBER, "
+ "patient_name VARCHAR2(100), "
+ "location VARCHAR2(200), "
+ "phone VARCHAR2(20), "
+ "status VARCHAR2(30), "
+ "request_time DATE"
+ ")";

//================= NOTIFICATION TABLE =================

String notificationTable =

"CREATE TABLE notifications ("
+ "notification_id NUMBER PRIMARY KEY, "
+ "user_id NUMBER, "
+ "message VARCHAR2(500), "
+ "status VARCHAR2(30), "
+ "created_at DATE"
+ ")";



con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}