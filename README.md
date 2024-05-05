# Project Title

# Water Wastage Analysis Web Application

## Overview

This project focuses on developing a web application aimed at addressing the issue of water wastage through data analysis. The primary objective is to analyze water data from the past five years to predict and identify areas of water wastage. Developed for the Government Domain, the application has the potential to offer valuable insights to governmental bodies, aiding in decision-making and resource allocation towards water conservation efforts.

## Features

- **Data Analysis:** Utilizes historical water data to analyze trends and patterns, facilitating the prediction of water wastage.
  
- **Government Domain:** Tailored specifically for government departments, the application provides tools for analyzing water usage and wastage within their jurisdictions.

- **User Authentication:** Government department heads are responsible for registering employees and providing them with login credentials. This ensures secure access to the website's functionalities.

- **Statistical Reporting:** Generates comprehensive statistics on water usage and wastage, enabling informed decision-making and targeted interventions.

- **Preventive Actions:** Based on the analysis results, the application suggests preventive actions to mitigate water wastage, fostering a proactive approach to conservation.


## Technology Stack
- **Frontend:**
  - **JSP:** Used for building the dynamic web content.
  - **HTML/CSS/JavaScript:** For structuring and styling the website, and client-side scripting.
  - **Bootstrap:** For responsive design.

- **Backend:**
  - **Spring Boot:** Simplifies the backend development process and reduces the need for lots of configuration.
  - **Spring Security:** For secure authentication and authorization.
  - **Flask:** Python microframework for building web applications.
  - **Pandas:** Data analysis library for processing data.
  - **NumPy:** Library for numerical computing.
  - **Pymysql:** Python library for interfacing with MySQL databases.
   - **Amazon S3:** Cloud storage service used for storing application files and assets securely.

- **Database:**
  - **MySQL:** Primary database for storing application data.

- **Build Tool:**
  - **Maven:** Used for project build and dependency management.

## Prerequisites
- JDK 1.8 or above
- Maven 3.6 or above
- MySQL Server 5.7 or above

## Usage

The application provides two main routes:
- **Admin**: For administrative users to retrieve water usage and wastage predictions based on input parameters.
- **Users**: For regular users to access water usage predictions.