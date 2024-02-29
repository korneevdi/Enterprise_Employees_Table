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

Let's start developing the application by setting up the display of all workers on the screen. The user enters a specific address in browser, which is processed by the **Controller** component, namely the *showAllEmployees()* method. To do this, we will access the database using Hibernate. All code can be placed directly into the **Controller** component and the program will work. But from an architectural point of view this is the wrong decision. It would be more correct to place a so-called **DAO**, an auxiliary component, between the **Controller** and the database. **DAO** stands for *Data Access Object* and it is the one that accesses the database via Hibernate. The **DAO** transfers the received information, that is, a list of all workers, to the **Controller**, and it, in turn, transfers it to the **Model**, with the help of which the **View** can display information about all workers.

First of all, let's create our entity - the **Employee** class. The *@Entity* annotation allows us to associate the Employee class with a table in the database. In this class we create several fields that correspond to the columns of the table. In this case, each of these fields is associated with a specific column of the table using the *@Column* annotation, and the ID is marked with the annotations *@ID* and *@GeneratedValue*, which refers to the primary key for working with the MySQL database. In addition, we create a default constructor, a constructor with parameters, getters and setters.

Next we need to create a DAO. We will place it in a separate package. Following best practice, let's create in this package the interface **EmployeeDAO** and the class **EmployeeDAOImpl**, which will implement the interface. For now, this interface will only have one method *getAllEmployees()*. We will add other methods later. The **EmployeeDAOImpl** class contains the body of this method, as well as a **SessionFactory** class object with the *@Autowired* annotation so that the DAO can access the database through the **sessionFactory** bean from the **applicationContext.xml** file. Also, a DAO is usually marked with the *@Repository* annotation, which is also a specialized component, such as the *@Component* annotation.

Now you need to create a **Controller**. It is also placed in a separate package to structure our application. This class contains a *showAllEmployees()* method marked with the *@RequestMapping* annotation to access a list of all employees in the browser. This method calls the *getAllEmployees()* method from the DAO. Additionally, this method adds some attribute to the **Model** that will be used by the **View** to display all workers in the browser. And of course, you need to create the **View** itself. We do this in the *view* folder in the **all-employees**.jsp* file.

At this stage, we should add one more component to the application - **Service**. It will stand between the **Component** and the **DAO** to transfer all the necessary information between them. In this case, adding a new component is not necessary since we only have one DAO, but we must design the application correctly from the very beginning so that it can be easily extended if we need to add one more or many more DAOs. In the new package, as in the case of the DAO, we create the **EmployeeService** interface and the **EmployeeServiceImpl** class, marked with the *@Service* annotation. Here we also create a method *getAllEmployees()*, which calls the method of the same name from the DAO.
