# frozen_string_literal: true

user = User.create!(email: '1@1.com', password: '123456')

project = Project.create!(name: 'Project 1')

Task.create!(name: 'Task 1', project: project, creator: user)
Task.create!(name: 'Task 2', project: project, creator: user)
