'''
This is the main file of the IDP API app with frontend web-page that manages a GitLab environment.
'''
from flask import Flask, render_template, request
import json
import gitlab
import sys
app = Flask(__name__)
# Load settings from settings.json
try:
    with open('settings.json') as f:
        settings = json.load(f)
except FileNotFoundError:
    # Handle file not found error
    print("Error: settings.json file not found")
    sys.exit(1)
except json.JSONDecodeError:
    # Handle invalid JSON format error
    print("Error: Invalid JSON format in settings.json")
    sys.exit(1)
# Connect to GitLab
try:
    gl = gitlab.Gitlab(settings['gitlab_url'], private_token=settings['gitlab_token'])
    gl.auth()
except gitlab.GitlabAuthenticationError:
    # Handle authentication error
    print("Error: Failed to authenticate with GitLab")
    sys.exit(1)
except gitlab.GitlabConnectionError:
    # Handle connection error
    print("Error: Failed to connect to GitLab")
    sys.exit(1)
# Define routes
@app.route('/')
def home():
    return render_template('index.html')
@app.route('/users', methods=['GET', 'POST'])
def manage_users():
    if request.method == 'POST':
        user_id = request.form['user_id']
        action = request.form['action']
        if action == 'approve':
            try:
                user = gl.users.get(user_id)
                user.unblock()
            except gitlab.exceptions.GitlabGetError:
                # Handle user not found error
                print("Error: User not found")
        elif action == 'block':
            try:
                user = gl.users.get(user_id)
                user.block()
            except gitlab.exceptions.GitlabGetError:
                # Handle user not found error
                print("Error: User not found")
    users = gl.users.list()
    return render_template('users.html', users=users)
@app.route('/groups', methods=['GET', 'POST'])
def manage_groups():
    if request.method == 'POST':
        group_name = request.form['group_name']
        action = request.form['action']
        if action == 'create':
            try:
                gl.groups.create({'name': group_name})
            except gitlab.exceptions.GitlabCreateError:
                # Handle group creation error
                print("Error: Failed to create group")
        elif action == 'remove':
            try:
                group = gl.groups.get(group_name)
                group.delete()
            except gitlab.exceptions.GitlabGetError:
                # Handle group not found error
                print("Error: Group not found")
    groups = gl.groups.list()
    return render_template('groups.html', groups=groups)
@app.route('/projects', methods=['GET', 'POST'])
def manage_projects():
    if request.method == 'POST':
        project_name = request.form['project_name']
        action = request.form['action']
        assignee_id = request.form['assignee_id']
        group_id = request.form['group_id']
        if action == 'create':
            try:
                gl.projects.create({'name': project_name})
            except gitlab.exceptions.GitlabCreateError:
                # Handle project creation error
                print("Error: Failed to create project")
        elif action == 'remove':
            try:
                project = gl.projects.get(project_name)
                project.delete()
            except gitlab.exceptions.GitlabGetError:
                # Handle project not found error
                print("Error: Project not found")
        elif action == 'assign_user':
            try:
                project = gl.projects.get(project_name)
                user = gl.users.get(assignee_id)
                project.members.create({'user_id': user.id, 'access_level': gitlab.DEVELOPER_ACCESS})
            except gitlab.exceptions.GitlabGetError:
                # Handle project or user not found error
                print("Error: Project or user not found")
        elif action == 'remove_user':
            try:
                project = gl.projects.get(project_name)
                user = gl.users.get(assignee_id)
                member = project.members.get(user.id)
                member.delete()
            except gitlab.exceptions.GitlabGetError:
                # Handle project or user not found error
                print("Error: Project or user not found")
        elif action == 'assign_group':
            try:
                project = gl.projects.get(project_name)
                group = gl.groups.get(group_id)
                project.members.create({'group_id': group.id, 'access_level': gitlab.DEVELOPER_ACCESS})
            except gitlab.exceptions.GitlabGetError:
                # Handle project or group not found error
                print("Error: Project or group not found")
        elif action == 'remove_group':
            try:
                project = gl.projects.get(project_name)
                group = gl.groups.get(group_id)
                member = project.members.get(group.id)
                member.delete()
            except gitlab.exceptions.GitlabGetError:
                # Handle project or group not found error
                print("Error: Project or group not found")
    projects = gl.projects.list()
    users = gl.users.list()
    groups = gl.groups.list()
    return render_template('projects.html', projects=projects, users=users, groups=groups)
if __name__ == '__main__':
    app.run()