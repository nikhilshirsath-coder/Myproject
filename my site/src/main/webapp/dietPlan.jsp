<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Diet Plan</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Your Personalized Diet Plan</h1>
        <%
            double bmi = (double) request.getAttribute("bmi");
            String category = (String) request.getAttribute("category");
            String weightAdvice = (String) request.getAttribute("weightAdvice");
            String dietPlan = "";
            String dietImage = "images/healthy-diet.jpg";

            if ("Underweight".equals(category)) {
                dietPlan = "<ul>" +
                            "<li>Include calorie-dense foods like nuts, seeds, and avocados.</li>" +
                            "<li>Consume lean proteins such as chicken, fish, and eggs.</li>" +
                            "<li>Add whole grains like quinoa, brown rice, and oats.</li>" +
                            "<li>Drink smoothies with fruits, yogurt, and peanut butter.</li>" +
                           "</ul>";
                dietImage = "images/gain-weight.webp";
            } else if ("Normal weight".equals(category)) {
                dietPlan = "<ul>" +
                            "<li>Maintain a balanced diet with fruits, vegetables, proteins, and healthy fats.</li>" +
                            "<li>Stick to regular meal timings and portion control.</li>" +
                            "<li>Stay hydrated by drinking plenty of water.</li>" +
                            "<li>Engage in regular physical activities to maintain fitness.</li>" +
                           "</ul>";
                dietImage = "images/maintain-weight.webp";
            } else if ("Overweight".equals(category)) {
                dietPlan = "<ul>" +
                            "<li>Reduce calorie intake by cutting back on sugary drinks and processed foods.</li>" +
                            "<li>Focus on high-fiber foods like vegetables and legumes.</li>" +
                            "<li>Incorporate lean proteins and avoid fried foods.</li>" +
                            "<li>Exercise regularly, aiming for at least 30 minutes a day.</li>" +
                           "</ul>";
                dietImage = "images/lose-weight.webp";
            } else if ("Obese".equals(category)) {
                dietPlan = "<ul>" +
                            "<li>Adopt a calorie-controlled diet under the guidance of a dietitian.</li>" +
                            "<li>Avoid sugary beverages, fried foods, and excess carbs.</li>" +
                            "<li>Eat small, frequent meals rich in nutrients.</li>" +
                            "<li>Increase physical activity and seek professional fitness advice.</li>" +
                           "</ul>";
                dietImage = "images/obese-diet.jpg";
            }
        %>
        <p><strong>BMI:</strong> <%= String.format("%.2f", bmi) %></p>
        <p><strong>Category:</strong> <%= category %></p>

        <!-- Weight Gain/Loss Advice -->
        <p><strong>Advice:</strong> <%= weightAdvice %></p>

        <div class="diet-plan">
            <h2>Diet Recommendations:</h2>
            <%= dietPlan %>
        </div>

        <div class="diet-image">
            <h2>Suggested Diet Image</h2>
            <img src="<%= dietImage %>" alt="Diet Plan">
        </div>

        <!-- Back Button -->
        <div>
            <button onclick="window.location.href='bmi.jsp';">Back to BMI Calculator</button>
        </div>
    </div>
</body>
</html>
