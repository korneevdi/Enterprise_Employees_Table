## Description

The desired outcome of the application is to display some database data in a **View** component, i.e. at the web page. In addition, each employee has the option to *"update"* and *"delete"*, moreover, you can add new employees to the database directly on the web page.

#### PICTURE (will be added soon)

When you click on the *"add"* button, another View component should open, which allows you to enter information about the new employee.

## Application configuration

To create such an application, you need to open IntelliJ IDEA (or another IDE you use) and choose **Maven** -> **maven-archetype-webapp**. This way Maven can automatically download some of the required dependencies and plugins. The next step is to prepare the database with which our application will connect. You can use the **initial_database.sql** file to initialize the database and populate a few positions.

After this, you need to add the remaining dependencies to the **pom.xml** file. You can use the website https://mvnrepository.com for this. Also, don't forget to download and install [Apache Tomcat](https://tomcat.apache.org/download-90.cgi) using *Edit configurations*. Next, create files *web.xml* and *applicationContext.xml*. Therefore, as you can guess, this application is created using XML-files and annotations. Of course, you can use exclusively Java code in the application; this approach is considered more modern. However, in my opinion, application configuration using XML files is clearer and simpler.

The *applicationContext.xml* file contains a lot of necessary information, in particular:

1) **component-scan base-package**: package in which scanning will occur.
2) **prefix** and **suffix** to refer to view components directly by name.
3) a bean for connecting to a specific database using a login and password. This bean also contains information about the class from the **c3p0** library, which allows you to connect the application to the database and the dependency on which we added to the pom file. Hibernate uses **JDBC** to connect. Creating such a connection is a very expensive operation, so it is worth using connection pools, of which **c3p0** is an example.
4) a bean describing the **sessionFactory**. We need it to receive sessions from it for connections to the database.
5) **transactionManager** bean for automatic transaction management.
6) the last line *tx:annotation-driven transaction-manager="transactionManager"* activates the *@Transactional* annotation so that you don’t have to open and close transactions yourself.

## Code development

After the boring but important application configuration, you can start writing code!
