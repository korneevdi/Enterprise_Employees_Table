<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 300px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input[type="text"] {
            width: 80%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 20%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            border-radius: 5px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Employee Info</h2>
    <form:form action="saveEmployee" modelAttribute="employee">
        <form:hidden path="id"/>
        <label for="name">Name:</label>
        <form:input type="text" id="name" path="name" value="${employee.name}"/>

        <label for="surname">Surname:</label>
        <form:input type="text" id="surname" path="surname" value="${employee.surname}"/>

        <label for="department">Department:</label>
        <form:input type="text" id="department" path="department" value="${employee.department}"/>

        <label for="salary">Salary:</label>
        <form:input type="text" id="salary" path="salary" value="${employee.salary}"/>

        <input type="submit" value="OK">
    </form:form>
</div>

</body>
</html>

