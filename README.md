## Description

The desired outcome of the application is to display some database data in a **View** component, i.e. at the web page. In addition, each employee has the option to *"update"* and *"delete"*, moreover, you can add new employees to the database directly on the web page.

#### PICTURE (will be added soon)

When you click on the *"add"* button, another View component should open, which allows you to enter information about the new employee.

## Application configuration

To create such an application, you need to open IntelliJ IDEA (or another IDE you use) and choose **Maven** -> **maven-archetype-webapp**. This way Maven can automatically download some of the required dependencies and plugins. The next step is to prepare the database with which our application will connect. You can use the **initial_database.sql** file to initialize the database and populate a few positions.

After this, you need to add the remaining dependencies to the **pom.xml** file. You can use the website (https://mvnrepository.com/) for this. Also, don't forget to download and install [Apache Tomcat](https://tomcat.apache.org/download-90.cgi) using *Edit configurations*.
