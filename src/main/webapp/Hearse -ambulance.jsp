<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hearse Ambulance</title>
    <style>
        body {
            font-family: 'Times New Roman', Times, serif;
            font-size: 14px; /* Increase font size to 14px */
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #f4f4f9, #e2e2f0);
            color: #333;
            height: 100vh; /* Ensure the height of the page */
        }
        .container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border: 1px solid black; /* Black border for the container */
            overflow-y: auto; /* Enable vertical scrolling within the container if content overflows */
        }
        .header {
            text-align: center;
            padding: 20px 0;
            color: #0044cc; /* Blue text color for header */
        }
        .header h1 {
            margin: 0;
            font-size: 2.5em;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        .content {
            display: flex;
            align-items: flex-start;
            padding-top: 20px; /* Padding to separate from header */
        }
        .content img {
            height: 500px;
            width: 500px;
            margin-right: 40px;
            border: 1px solid black;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s; /* Smooth transition for the hover effect */
            margin-top: 60px;
        }
        .content img:hover {
            transform: scale(1.05); /* Scale up the image on hover */
        }
        .content .text {
            flex: 1;
        }
        .content h2 {
            color: #0044cc; /* Blue text color */
            font-size: 2em;
            transition: color 0.3s, transform 0.3s;
            cursor: pointer;
        }
        .content h2:hover {
            color: #333; /* Hover effect to change color to darker blue */
            transform: scale(1.05);
        }
        .content p {
            font-size: 1.6em;
            line-height: 1.6;
            margin-top: 100px;
        }
        .features {
            margin-top: 20px;
            padding-top: 20px; /* Padding to separate from content */
        }
        .features h2 {
            color: #0044cc; /* Blue text color */
            font-size: 2em;
            transition: color 0.3s, transform 0.3s;
            cursor: pointer;
        }
        .features h2:hover {
            color: #333; /* Hover effect to change color to darker blue */
            transform: scale(1.05);
        }
        .features ul {
            list-style-type: disc;
            margin: 10px 0 0 20px;
            font-size: 1.6em;
        }
        .features ul li {
            margin-bottom: 10px;
        }
        .functionality {
            margin-top: 20px;
            padding-top: 20px; /* Padding to separate from features */
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .functionality img {
            height: 300px;
            width: 300px;
            margin-top: 20px;
            border: 1px solid black;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s; /* Smooth transition for the hover effect */
        }
        .functionality img:hover {
            transform: scale(1.05); /* Scale up the image on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Hearse Ambulance</h1>
        </div>
        <div class="content">
            <img src="hearse_ambulance_image.jpg" alt="Hearse Ambulance">
            <div class="text">
                <h2>Purpose</h2>
                <p>A hearse ambulance, also known as a mortuary vehicle or funeral van, is used to transport deceased individuals from the place of death to mortuaries or funeral homes. These ambulances are specially designed to accommodate caskets or coffins and ensure respectful transportation of the deceased.</p>
            </div>
        </div>
        <div class="features">
            <h2>Features</h2>
            <ul>
                <li>Space for casket or coffin</li>
                <li>Hydraulic lifts for loading and unloading</li>
                <li>Refrigeration system for body preservation</li>
                <li>Climate-controlled compartments</li>
                <li>Secure fastenings to prevent movement</li>
                <li>Professional staff trained in mortuary procedures</li>
                <li>Document and identification management</li>
                <li>24/7 availability for transport services</li>
                <li>Compliance with local regulations and protocols</li>
                <li>GPS tracking for efficient and timely transportation</li>
            </ul>
        </div>
        <div class="functionality">
            <img src="hearse_functionality_1.jpg" alt="Functionality 1">
            <img src="hearse_functionality_2.jpg" alt="Functionality 2">
            <img src="hearse_functionality_3.jpg" alt="Functionality 3">
        </div>
    </div>
</body>
</html>
