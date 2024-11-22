<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BMI Calculator</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>BMI Calculator</h1>
        <form method="post" action="bmi.jsp">
            <label for="weight">Weight (kg):</label><br>
            <input type="number" id="weight" name="weight" step="0.1" required><br><br>

            <label for="height">Height (m):</label><br>
            <input type="number" id="height" name="height" step="0.01" required><br><br>

            <label for="gender">Gender:</label><br>
            <select id="gender" name="gender" required>
                <option value="" disabled selected>Select your gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select><br><br>

            <button type="submit">Calculate BMI</button>
        </form>

        <%
            if (request.getParameter("weight") != null && request.getParameter("height") != null) {
                String weightStr = request.getParameter("weight");
                String heightStr = request.getParameter("height");
                double weight = Double.parseDouble(weightStr);
                double height = Double.parseDouble(heightStr);
                double bmi = weight / (height * height);

                String category = "";
                double targetWeight = 0;
                String weightAdvice = "";

                if (bmi < 18.5) {
                    category = "Underweight";
                    // Calculate target weight to reach BMI of 18.5
                    targetWeight = 18.5 * height * height;
                    weightAdvice = "You should gain " + String.format("%.2f", targetWeight - weight) + " kg to reach a healthy BMI.";
                } else if (bmi >= 18.5 && bmi <= 24.9) {
                    category = "Normal weight";
                    weightAdvice = "You are at a healthy weight! Keep maintaining your current lifestyle.";
                } else if (bmi >= 25 && bmi <= 29.9) {
                    category = "Overweight";
                    // Calculate target weight to reach BMI of 24.9
                    targetWeight = 24.9 * height * height;
                    weightAdvice = "You should lose " + String.format("%.2f", weight - targetWeight) + " kg to reach a healthy BMI.";
                } else {
                    category = "Obese";
                    // Calculate target weight to reach BMI of 24.9
                    targetWeight = 24.9 * height * height;
                    weightAdvice = "You should lose " + String.format("%.2f", weight - targetWeight) + " kg to reach a healthy BMI.";
                }

                // Forward BMI, category, and weight advice to dietPlan.jsp
                request.setAttribute("bmi", bmi);
                request.setAttribute("category", category);
                request.setAttribute("weightAdvice", weightAdvice);
                request.getRequestDispatcher("dietPlan.jsp").forward(request, response);
            }
        %>
    </div>
</body>
</html>
