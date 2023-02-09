# frozen_string_literal: true

user = User.create!(email: '1@1.com', password: '123456', first_name: 'this', last_name: 'user', role: :admin)
User.create!(email: '2@2.com', first_name: 'test', last_name: 'user', password: 'ultra_secure')

project = Project.create!(name: 'Project 1', project_owner: user, repo_link: '1.1.1.1', web_link: '1.1.1.1')

Task.create!(name: 'Task 1', project: project, creator: user, description: 'Lorem')
Task.create!(name: 'Task 2', project: project, creator: user, description: 'Ipsum')
