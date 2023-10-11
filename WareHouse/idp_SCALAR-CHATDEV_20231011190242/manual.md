# IDP API App User Manual

Welcome to the IDP API App user manual. This manual will guide you through the installation process, introduce the main functions of the software, and provide instructions on how to use it effectively.

## Table of Contents

1. [Installation](#installation)
2. [Main Functions](#main-functions)
3. [Usage](#usage)
4. [Conclusion](#conclusion)

## 1. Installation <a name="installation"></a>

To install the IDP API App, please follow the steps below:

1. Ensure that you have Python installed on your system. You can download Python from the official website: [https://www.python.org/downloads/](https://www.python.org/downloads/)

2. Clone the repository containing the IDP API App codes to your local machine.

3. Open a terminal or command prompt and navigate to the directory where the repository is cloned.

4. Install the required dependencies by running the following command:

   ```
   pip install -r requirements.txt
   ```

5. Once the dependencies are installed, you can start the IDP API App by running the following command:

   ```
   python main.py
   ```

6. The IDP API App will be accessible through a web browser at `http://localhost:5000`.

## 2. Main Functions <a name="main-functions"></a>

The IDP API App provides the following main functions:

- Approve User: Allows a developer to approve a user by providing the user ID.
- Block User: Allows a developer to block a user by providing the user ID.
- Create Group: Allows a developer to create a group by providing the group name.
- Create Project: Allows a developer to create a project by providing the project name.
- Assign User to Project: Allows a developer to assign a user to a project by providing the user ID and project ID.
- Remove User from Project: Allows a developer to remove a user from a project by providing the user ID and project ID.

## 3. Usage <a name="usage"></a>

To use the IDP API App, follow these steps:

1. Open a web browser and navigate to `http://localhost:5000`.

2. You will see the IDP API App homepage with various forms for different functions.

3. To approve a user, fill in the "User ID" field in the "Approve User" form and click the "Approve User" button.

4. To block a user, fill in the "User ID" field in the "Block User" form and click the "Block User" button.

5. To create a group, fill in the "Group Name" field in the "Create Group" form and click the "Create Group" button.

6. To create a project, fill in the "Project Name" field in the "Create Project" form and click the "Create Project" button.

7. To assign a user to a project, fill in the "User ID" and "Project ID" fields in the "Assign User to Project" form and click the "Assign User to Project" button.

8. To remove a user from a project, fill in the "User ID" and "Project ID" fields in the "Remove User from Project" form and click the "Remove User from Project" button.

9. The result of each action will be displayed on the web page.

## 4. Conclusion <a name="conclusion"></a>

Congratulations! You have successfully installed and learned how to use the IDP API App. You can now manage users, groups, and projects in a GitLab environment using the provided functions. If you have any further questions or need assistance, please refer to the documentation or contact our support team.

Thank you for choosing the IDP API App!