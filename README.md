# Todo Web App

## Overview
The Todo Web App is a simple Java web application that allows users to manage a list of todo items. It is built using JSP and Servlets, following the MVC architecture.

## Project Structure
```
todo-web-app
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── example
│   │   │           └── servlet
│   │   │               └── TodoServlet.java
│   │   ├── resources
│   │   └── webapp
│   │       ├── WEB-INF
│   │       │   └── web.xml
│   │       └── views
│   │           └── index.jsp
│   └── test
│       └── java
│           └── com
│               └── example
│                   └── servlet
│                       └── TodoServletTest.java
├── pom.xml
└── README.md
```

## Setup Instructions
1. **Clone the repository**:
   ```
   git clone <repository-url>
   cd todo-web-app
   ```

2. **Build the project**:
   Ensure you have Maven installed. Run the following command to build the project:
   ```
   mvn clean install
   ```

3. **Run the application**:
   You can deploy the generated WAR file to a servlet container like Apache Tomcat.

## Usage
- Access the application in your web browser at `http://localhost:8080/todo-web-app/views/index.jsp`.
- Use the interface to add and view your todo items.

## Dependencies
This project uses the following dependencies:
- Jakarta Servlet API
- JSP
- JSTL
- Bootstrap 5 for styling

## Contributing
Feel free to submit issues or pull requests for improvements or bug fixes.