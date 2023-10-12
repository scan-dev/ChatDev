# IDP API App User Manual

## Introduction

The IDP API App is a web application that allows developers to manage a GitLab environment. It provides a user-friendly interface for approving or blocking users, creating user groups and projects, and assigning or removing users and groups to projects. Additionally, it allows setting default variables for GitLab and projects based on a settings.json file.

This user manual will guide you through the installation process, explain the main functions of the app, and provide step-by-step instructions on how to use it.

## Installation

To install the IDP API App, follow these steps:

1. Make sure you have Python installed on your system. You can download Python from the official website: https://www.python.org/downloads/

2. Open a terminal or command prompt and navigate to the directory where you want to install the app.

3. Clone the repository by running the following command:

   ```
   git clone https://github.com/your-username/idp-api-app.git
   ```

4. Navigate to the project directory:

   ```
   cd idp-api-app
   ```

5. Install the required dependencies by running the following command:

   ```
   pip install -r requirements.txt
   ```

6. Create a `settings.json` file in the project directory and configure it according to your GitLab environment. Here is an example of a `settings.json` file:

   ```json
   {
     "gitlab_url": "https://gitlab.example.com",
     "default_variables": {
       "variable1": "value1",
       "variable2": "value2"
     }
   }
   ```

   Replace `https://gitlab.example.com` with the URL of your GitLab instance.

7. Start the IDP API App by running the following command:

   ```
   python main.py
   ```

8. Open a web browser and navigate to `http://localhost:5000` to access the IDP API App.

## Main Functions

The IDP API App provides the following main functions:

### User Management

The User Management section allows you to approve or block users. It displays a list of users with their ID, name, and email. To approve or block a user, follow these steps:

1. Go to the User Management section in the IDP API App.

2. Find the user you want to approve or block in the list.

3. Click the "Approve" button to approve the user or the "Block" button to block the user.

### Group Management

The Group Management section allows you to create or remove user groups. It displays a list of groups with their ID and name. To create or remove a group, follow these steps:

1. Go to the Group Management section in the IDP API App.

2. Enter the name of the group you want to create or remove in the input field.

3. Click the "Create" button to create the group or the "Remove" button to remove the group.

### Project Management

The Project Management section allows you to create or remove projects and assign or remove users and groups to projects. It displays a list of projects with their ID and name. To create or remove a project or assign or remove a user or group to a project, follow these steps:

1. Go to the Project Management section in the IDP API App.

2. Enter the name of the project you want to create or remove in the input field.

3. Select the action you want to perform from the dropdown menu: create, remove, assign user, remove user, assign group, or remove group.

4. Depending on the action, select the user or group from the dropdown menu.

5. Click the corresponding button to perform the action.

## Conclusion

Congratulations! You have successfully installed the IDP API App and learned how to use its main functions. You can now manage your GitLab environment, approve or block users, create user groups and projects, and assign or remove users and groups to projects. Enjoy using the IDP API App and feel free to reach out to our support team if you have any questions or need further assistance.

