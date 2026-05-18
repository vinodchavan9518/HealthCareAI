-- ============================================
-- AI Healthcare Management System - Oracle DB
-- ============================================

-- USERS TABLE
CREATE TABLE users (
    user_id     NUMBER(10) PRIMARY KEY,
    full_name   VARCHAR2(100) NOT NULL,
    email       VARCHAR2(100) UNIQUE NOT NULL,
    password    VARCHAR2(100) NOT NULL,
    phone       VARCHAR2(15),
    age         NUMBER(3),
    blood_group VARCHAR2(5),
    role        VARCHAR2(20) DEFAULT 'PATIENT',
    created_at  DATE DEFAULT SYSDATE
);

-- DOCTORS TABLE
CREATE TABLE doctors (
    doctor_id       NUMBER(10) PRIMARY KEY,
    full_name       VARCHAR2(100) NOT NULL,
    specialization  VARCHAR2(100) NOT NULL,
    email           VARCHAR2(100),
    phone           VARCHAR2(15),
    experience      NUMBER(3),
    available_days  VARCHAR2(100),
    available_time  VARCHAR2(50),
    fee             NUMBER(10,2),
    hospital_name   VARCHAR2(100)
);

-- SYMPTOMS TABLE
CREATE TABLE symptoms (
    symptom_id      NUMBER(10) PRIMARY KEY,
    symptom_name    VARCHAR2(100) NOT NULL,
    related_disease VARCHAR2(200),
    specialization  VARCHAR2(100),
    severity        VARCHAR2(20)
);

-- APPOINTMENTS TABLE
CREATE TABLE appointments (
    appt_id     NUMBER(10) PRIMARY KEY,
    user_id     NUMBER(10) REFERENCES users(user_id),
    doctor_id   NUMBER(10) REFERENCES doctors(doctor_id),
    appt_date   DATE NOT NULL,
    appt_time   VARCHAR2(20),
    status      VARCHAR2(20) DEFAULT 'PENDING',
    symptoms    VARCHAR2(500),
    notes       VARCHAR2(500),
    created_at  DATE DEFAULT SYSDATE
);

-- MEDICAL REPORTS TABLE
CREATE TABLE medical_reports (
    report_id       NUMBER(10) PRIMARY KEY,
    user_id         NUMBER(10) REFERENCES users(user_id),
    report_name     VARCHAR2(200),
    report_text     CLOB,
    ai_analysis     CLOB,
    uploaded_at     DATE DEFAULT SYSDATE
);

-- MEDICINE REMINDERS TABLE
CREATE TABLE medicine_reminders (
    reminder_id     NUMBER(10) PRIMARY KEY,
    user_id         NUMBER(10) REFERENCES users(user_id),
    medicine_name   VARCHAR2(100) NOT NULL,
    dosage          VARCHAR2(50),
    frequency       VARCHAR2(50),
    reminder_time   VARCHAR2(50),
    start_date      DATE,
    end_date        DATE,
    status          VARCHAR2(20) DEFAULT 'ACTIVE'
);

-- HOSPITAL BEDS TABLE
CREATE TABLE hospital_beds (
    bed_id          NUMBER(10) PRIMARY KEY,
    ward_name       VARCHAR2(100) NOT NULL,
    bed_number      VARCHAR2(20) NOT NULL,
    bed_type        VARCHAR2(50),
    status          VARCHAR2(20) DEFAULT 'AVAILABLE',
    patient_name    VARCHAR2(100),
    admitted_date   DATE,
    doctor_id       NUMBER(10) REFERENCES doctors(doctor_id)
);

-- CHAT HISTORY TABLE
CREATE TABLE chat_history (
    chat_id         NUMBER(10) PRIMARY KEY,
    user_id         NUMBER(10) REFERENCES users(user_id),
    user_message    VARCHAR2(1000),
    bot_response    CLOB,
    chat_time       DATE DEFAULT SYSDATE
);

-- SEQUENCES
CREATE SEQUENCE users_seq     START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE doctors_seq   START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE symptoms_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE appt_seq      START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE report_seq    START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE reminder_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE bed_seq       START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE chat_seq      START WITH 1 INCREMENT BY 1;

-- SAMPLE DOCTORS DATA
INSERT INTO doctors VALUES (doctors_seq.NEXTVAL,'Dr. Rahul Sharma','Cardiologist','rahul@hospital.com','9876543210',15,'Mon,Wed,Fri','09:00-17:00',800,'City Hospital');
INSERT INTO doctors VALUES (doctors_seq.NEXTVAL,'Dr. Priya Mehta','Neurologist','priya@hospital.com','9876543211',12,'Tue,Thu,Sat','10:00-18:00',900,'City Hospital');
INSERT INTO doctors VALUES (doctors_seq.NEXTVAL,'Dr. Amit Joshi','General Physician','amit@hospital.com','9876543212',8,'Mon-Sat','08:00-16:00',500,'City Hospital');
INSERT INTO doctors VALUES (doctors_seq.NEXTVAL,'Dr. Sunita Patil','Dermatologist','sunita@hospital.com','9876543213',10,'Mon,Wed,Fri','11:00-19:00',700,'City Hospital');
INSERT INTO doctors VALUES (doctors_seq.NEXTVAL,'Dr. Vikram Rao','Orthopedic','vikram@hospital.com','9876543214',18,'Tue,Thu','09:00-17:00',1000,'City Hospital');

-- SAMPLE SYMPTOMS DATA
INSERT INTO symptoms VALUES (symptoms_seq.NEXTVAL,'Chest Pain','Heart Disease, Angina','Cardiologist','HIGH');
INSERT INTO symptoms VALUES (symptoms_seq.NEXTVAL,'Headache','Migraine, Hypertension','Neurologist','MEDIUM');
INSERT INTO symptoms VALUES (symptoms_seq.NEXTVAL,'Fever','Flu, Infection, Malaria','General Physician','MEDIUM');
INSERT INTO symptoms VALUES (symptoms_seq.NEXTVAL,'Skin Rash','Allergy, Eczema, Psoriasis','Dermatologist','LOW');
INSERT INTO symptoms VALUES (symptoms_seq.NEXTVAL,'Joint Pain','Arthritis, Injury','Orthopedic','MEDIUM');
INSERT INTO symptoms VALUES (symptoms_seq.NEXTVAL,'Shortness of Breath','Asthma, Heart Issue','Cardiologist','HIGH');
INSERT INTO symptoms VALUES (symptoms_seq.NEXTVAL,'Dizziness','Vertigo, Low BP','Neurologist','MEDIUM');
INSERT INTO symptoms VALUES (symptoms_seq.NEXTVAL,'Back Pain','Muscle Strain, Disc Issue','Orthopedic','MEDIUM');

-- SAMPLE BEDS
INSERT INTO hospital_beds VALUES (bed_seq.NEXTVAL,'General Ward','G-101','General','AVAILABLE',NULL,NULL,NULL);
INSERT INTO hospital_beds VALUES (bed_seq.NEXTVAL,'General Ward','G-102','General','OCCUPIED','Ramesh Kumar',SYSDATE-2,1);
INSERT INTO hospital_beds VALUES (bed_seq.NEXTVAL,'ICU','ICU-01','ICU','AVAILABLE',NULL,NULL,NULL);
INSERT INTO hospital_beds VALUES (bed_seq.NEXTVAL,'ICU','ICU-02','ICU','OCCUPIED','Sunita Devi',SYSDATE-1,2);
INSERT INTO hospital_beds VALUES (bed_seq.NEXTVAL,'Private Ward','P-201','Private','AVAILABLE',NULL,NULL,NULL);

-- ADMIN USER
INSERT INTO users VALUES (users_seq.NEXTVAL,'Admin User','admin@healthcare.com','admin123','9999999999',30,'O+','ADMIN',SYSDATE);

COMMIT;
