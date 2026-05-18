package com.healthcare.util;

import java.util.*;

public class AIEngine {

    // ── Symptom → Disease + Doctor mapping ─────────────────────
    private static final Map<String, String[]> SYMPTOM_MAP = new LinkedHashMap<>();

    static {
        SYMPTOM_MAP.put("chest pain",        new String[]{"Heart Disease / Angina",      "Cardiologist",    "HIGH"});
        SYMPTOM_MAP.put("heart pain",        new String[]{"Heart Disease",                "Cardiologist",    "HIGH"});
        SYMPTOM_MAP.put("palpitation",       new String[]{"Arrhythmia",                  "Cardiologist",    "HIGH"});
        SYMPTOM_MAP.put("headache",          new String[]{"Migraine / Hypertension",     "Neurologist",     "MEDIUM"});
        SYMPTOM_MAP.put("migraine",          new String[]{"Migraine",                    "Neurologist",     "MEDIUM"});
        SYMPTOM_MAP.put("dizziness",         new String[]{"Vertigo / Low BP",            "Neurologist",     "MEDIUM"});
        SYMPTOM_MAP.put("fever",             new String[]{"Flu / Viral Infection",       "General Physician","MEDIUM"});
        SYMPTOM_MAP.put("cold",              new String[]{"Common Cold",                 "General Physician","LOW"});
        SYMPTOM_MAP.put("cough",             new String[]{"Respiratory Infection",       "General Physician","LOW"});
        SYMPTOM_MAP.put("vomiting",          new String[]{"Gastritis / Food Poisoning",  "General Physician","MEDIUM"});
        SYMPTOM_MAP.put("nausea",            new String[]{"Gastritis",                   "General Physician","LOW"});
        SYMPTOM_MAP.put("skin rash",         new String[]{"Allergy / Eczema",            "Dermatologist",   "LOW"});
        SYMPTOM_MAP.put("itching",           new String[]{"Skin Allergy",                "Dermatologist",   "LOW"});
        SYMPTOM_MAP.put("acne",              new String[]{"Acne Vulgaris",               "Dermatologist",   "LOW"});
        SYMPTOM_MAP.put("joint pain",        new String[]{"Arthritis / Injury",          "Orthopedic",      "MEDIUM"});
        SYMPTOM_MAP.put("back pain",         new String[]{"Muscle Strain / Disc Issue",  "Orthopedic",      "MEDIUM"});
        SYMPTOM_MAP.put("knee pain",         new String[]{"Knee Arthritis",              "Orthopedic",      "MEDIUM"});
        SYMPTOM_MAP.put("shortness of breath",new String[]{"Asthma / Heart Problem",    "Cardiologist",    "HIGH"});
        SYMPTOM_MAP.put("breathlessness",    new String[]{"Asthma / COPD",              "Cardiologist",    "HIGH"});
        SYMPTOM_MAP.put("diabetes",          new String[]{"Diabetes Mellitus",           "General Physician","HIGH"});
        SYMPTOM_MAP.put("sugar",             new String[]{"Diabetes",                    "General Physician","HIGH"});
        SYMPTOM_MAP.put("eye pain",          new String[]{"Eye Infection / Glaucoma",    "Ophthalmologist", "MEDIUM"});
        SYMPTOM_MAP.put("blurred vision",    new String[]{"Eye Problem / Diabetes",      "Ophthalmologist", "HIGH"});
    }

    // ── Analyze symptoms & return result ───────────────────────
    public static Map<String, String> analyzeSymptoms(String input) {
        Map<String, String> result = new LinkedHashMap<>();
        input = input.toLowerCase();

        String disease      = "Could not identify. Please consult a General Physician.";
        String specialist   = "General Physician";
        String severity     = "LOW";

        for (Map.Entry<String, String[]> entry : SYMPTOM_MAP.entrySet()) {
            if (input.contains(entry.getKey())) {
                disease    = entry.getValue()[0];
                specialist = entry.getValue()[1];
                severity   = entry.getValue()[2];
                break;
            }
        }

        result.put("disease",     disease);
        result.put("specialist",  specialist);
        result.put("severity",    severity);
        result.put("advice",      getAdvice(severity));
        return result;
    }

    private static String getAdvice(String severity) {
        switch (severity) {
            case "HIGH":   return "⚠️ High severity! Please visit a doctor immediately.";
            case "MEDIUM": return "📋 Moderate severity. Schedule a doctor appointment soon.";
            default:       return "✅ Low severity. Monitor symptoms. Consult if worsens.";
        }
    }

    // ── AI Medical Report Analyzer ──────────────────────────────
    public static String analyzeReport(String reportText) {
        if (reportText == null || reportText.trim().isEmpty())
            return "No report content provided.";

        StringBuilder analysis = new StringBuilder();
        reportText = reportText.toLowerCase();

        analysis.append("=== AI MEDICAL REPORT ANALYSIS ===\n\n");

        // Check glucose
        if (reportText.contains("glucose") || reportText.contains("sugar")) {
            analysis.append("🩸 BLOOD SUGAR: Detected glucose values. ");
            if (reportText.contains("high") || reportText.contains("elevated"))
                analysis.append("Values appear ELEVATED — possible diabetes risk. Consult an Endocrinologist.\n");
            else
                analysis.append("Values appear within normal range.\n");
        }

        // Check hemoglobin
        if (reportText.contains("hemoglobin") || reportText.contains("hb") || reportText.contains("haemoglobin")) {
            analysis.append("🩺 HEMOGLOBIN: Detected. ");
            if (reportText.contains("low") || reportText.contains("deficiency"))
                analysis.append("LOW hemoglobin detected — possible Anemia. Consult a General Physician.\n");
            else
                analysis.append("Hemoglobin levels appear normal.\n");
        }

        // Check cholesterol
        if (reportText.contains("cholesterol") || reportText.contains("ldl") || reportText.contains("hdl")) {
            analysis.append("❤️ CHOLESTEROL: Detected. ");
            if (reportText.contains("high") || reportText.contains("elevated"))
                analysis.append("HIGH cholesterol detected — cardiovascular risk. Consult a Cardiologist.\n");
            else
                analysis.append("Cholesterol levels appear normal.\n");
        }

        // Check blood pressure
        if (reportText.contains("blood pressure") || reportText.contains("bp") || reportText.contains("hypertension")) {
            analysis.append("💉 BLOOD PRESSURE: Detected. ");
            if (reportText.contains("high") || reportText.contains("hypertension"))
                analysis.append("HIGH BP detected — consult a Cardiologist immediately.\n");
            else if (reportText.contains("low"))
                analysis.append("LOW BP detected — monitor regularly, consult a General Physician.\n");
            else
                analysis.append("BP values detected in report.\n");
        }

        // Check infection
        if (reportText.contains("infection") || reportText.contains("bacteria") || reportText.contains("virus")) {
            analysis.append("🦠 INFECTION: Signs of infection detected — consult a General Physician.\n");
        }

        // Check thyroid
        if (reportText.contains("thyroid") || reportText.contains("tsh") || reportText.contains("t3") || reportText.contains("t4")) {
            analysis.append("🔬 THYROID: Thyroid markers detected — consult an Endocrinologist.\n");
        }

        if (analysis.toString().equals("=== AI MEDICAL REPORT ANALYSIS ===\n\n"))
            analysis.append("No specific medical keywords detected. Please upload a detailed report or enter report text manually.\n");

        analysis.append("\n⚠️ DISCLAIMER: This AI analysis is for informational purposes only. Always consult a qualified doctor for medical advice.");
        return analysis.toString();
    }

    // ── AI Chatbot Response ─────────────────────────────────────
    public static String chatbotResponse(String userMessage) {
        if (userMessage == null) return "Please type your question.";
        String msg = userMessage.toLowerCase().trim();

        // Greetings
        if (msg.contains("hello") || msg.contains("hi") || msg.contains("hey"))
            return "Hello! 👋 I am your AI Health Assistant. I can help you with:\n1. Symptom checking\n2. Finding doctors\n3. Booking appointments\n4. Medicine reminders\n5. Report analysis\n\nHow can I help you today?";

        // Appointment
        if (msg.contains("appointment") || msg.contains("book") || msg.contains("schedule"))
            return "To book an appointment:\n1. Go to 'Book Appointment' section\n2. Enter your symptoms\n3. I'll suggest the right doctor\n4. Select date & time\n5. Confirm booking!\n\nWould you like me to take you there?";

        // Symptoms
        if (msg.contains("symptom") || msg.contains("pain") || msg.contains("fever") ||
            msg.contains("headache") || msg.contains("cough"))
            return "Please describe your symptoms in detail and I'll analyze them for you. You can also use our Symptom Checker for a detailed AI analysis!";

        // Medicine
        if (msg.contains("medicine") || msg.contains("reminder") || msg.contains("tablet") || msg.contains("drug"))
            return "For medicine reminders:\n1. Go to 'Medicine Reminder' section\n2. Add your medicine name\n3. Set dosage and timing\n4. I'll send you reminders!\n\nNeed help adding a reminder?";

        // Report
        if (msg.contains("report") || msg.contains("test") || msg.contains("result") || msg.contains("lab"))
            return "To analyze your medical report:\n1. Go to 'Report Analyzer'\n2. Upload or paste your report text\n3. AI will analyze and explain the results\n\nShall I take you there?";

        // Doctor
        if (msg.contains("doctor") || msg.contains("specialist") || msg.contains("physician"))
            return "I can help you find the right doctor! Please tell me your symptoms and I'll suggest the best specialist for you. You can also browse all doctors in our 'Find Doctors' section.";

        // Emergency
        if (msg.contains("emergency") || msg.contains("urgent") || msg.contains("serious"))
            return "🚨 EMERGENCY ALERT!\n\nIf this is a medical emergency:\n• Call 108 (Ambulance)\n• Call 102 (Emergency)\n• Go to nearest emergency room immediately!\n\nDo NOT wait for an online consultation in an emergency!";

        // Bed
        if (msg.contains("bed") || msg.contains("admit") || msg.contains("ward"))
            return "For hospital bed availability:\n1. Go to 'Bed Management' section\n2. Check available beds by ward type\n3. Request admission through our system\n\nWould you like to check bed availability?";

        // Bye
        if (msg.contains("bye") || msg.contains("thank") || msg.contains("thanks"))
            return "Thank you for using AI HealthCare System! 😊 Stay healthy! If you need help anytime, I'm always here. Take care! 🏥";

        // Default
        return "I understand you're asking about: \"" + userMessage + "\"\n\nI can help you with:\n• Symptom analysis\n• Doctor recommendations\n• Appointment booking\n• Medicine reminders\n• Medical report analysis\n• Hospital bed status\n\nPlease choose one of these or describe your health concern!";
    }
}
