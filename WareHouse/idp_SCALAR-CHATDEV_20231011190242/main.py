'''
This is the main file that runs the IDP API app with a frontend web-page.
'''
from flask import Flask, render_template, request
import json
app = Flask(__name__)
# Load settings from settings.json file
with open('settings.json') as f:
    settings = json.load(f)
# Define routes
@app.route('/')
def index():
    return render_template('index.html')
@app.route('/approve_user', methods=['POST'])
def approve_user():
    user_id = request.form['user_id']
    # Logic to approve user
    return 'User {} approved'.format(user_id)
@app.route('/block_user', methods=['POST'])
def block_user():
    user_id = request.form['user_id']
    # Logic to block user
    return 'User {} blocked'.format(user_id)
@app.route('/create_group', methods=['POST'])
def create_group():
    group_name = request.form['group_name']
    # Logic to create group
    return 'Group {} created'.format(group_name)
@app.route('/create_project', methods=['POST'])
def create_project():
    project_name = request.form['project_name']
    # Logic to create project
    return 'Project {} created'.format(project_name)
@app.route('/assign_user_to_project', methods=['POST'])
def assign_user_to_project():
    user_id = request.form['user_id']
    project_id = request.form['project_id']
    # Logic to assign user to project
    return 'User {} assigned to project {}'.format(user_id, project_id)
@app.route('/remove_user_from_project', methods=['POST'])
def remove_user_from_project():
    user_id = request.form['user_id']
    project_id = request.form['project_id']
    # Logic to remove user from project
    return 'User {} removed from project {}'.format(user_id, project_id)
if __name__ == '__main__':
    app.run()