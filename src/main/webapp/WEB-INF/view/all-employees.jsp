<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Employees</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border-spacing: 0;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th,
        td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        th.options {
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .options {
            text-align: center;
            width: 200px;
        }

        .options input[type="button"] {
            margin: 5px;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        }

        .add-button {
            margin-top: 20px;
            display: block;
            width: 100%;
            text-align: center;
        }

        .add-button input[type="button"] {
            width: 100px;
            height: 40px;
            font-size: 16px;
            background-color: #28a745;
            color: #fff;
        }

        .add-button input[type="button"]:hover {
            background-color: #218838;
        }
    </style>
</head>

<body>

<h2>All Employees</h2>

<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Department</th>
        <th>Salary</th>
        <th class="options">Options</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="emp" items="${allEmps}">
        <c:url var="updateButton" value="/updateInfo">
            <c:param name="empId" value="${emp.id}" />
        </c:url>

        <c:url var="deleteButton" value="/deleteEmployee">
            <c:param name="empId" value="${emp.id}" />
        </c:url>

        <tr>
            <td>${emp.name}</td>
            <td>${emp.surname}</td>
            <td>${emp.department}</td>
            <td>${emp.salary}</td>
            <td class="options">
                <input type="button" value="Edit" onclick="window.location.href = '${updateButton}'" />
                <input type="button" value="Delete" onclick="window.location.href = '${deleteButton}'" />
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="add-button">
    <input type="button" value="Add" onclick="window.location.href = 'addNewEmployee'" />
</div>

</body>

</html>
