# Ananke

|Production CI|Develop CI|
|:-:|:-:|
|[![Build Status](https://aneshodza.semaphoreci.com/badges/ananke/branches/main.svg)](https://aneshodza.semaphoreci.com/projects/ananke)|[![Build Status](https://aneshodza.semaphoreci.com/badges/ananke/branches/develop.svg)](https://aneshodza.semaphoreci.com/projects/ananke)|



## What is Ananke?
Ananke, coming from ancient greek religion, was seen as the personification of inevitability, compulsion and necessity. Outside of mythology, the name is derived from **ἀνάγκη**, anankaie in latin letters, which means as much as "force, constraint or necessity".   
And that's what Ananke is all about, making the finishing of your projects inevitable with proper managment and planning. It allows you to plan an agile project by creating POs, and assigning tasks to coders, giving you a proper overview of what has been done and what is yet to be done. At the moment there are not much features implemenented (only projects, tasks and users).

## How do I set it up?
All you need is ruby and bundler to set up the entire project. In the `bin` folder there is a `setup` file, which sets everything up for you. All you need to do then is insert your own keys in the `application.yml` file.

### Registrations
The key `registerable` decides if users are allowed to register on your Ananke instance or not. It is adviced to set it to `false`, because permissions aren't set up yet. But even when permissions are in, you may not want everyone to be able to have an account.

### Hosting
Ananke is an open source project and (currently) only exists as a self-hosted platform. That means, there is no website openly hosting this as of now.  
If you want to use this solution you will need to host it yourself. I propose hosting it on Heroku. A single dyno with postgres and redis addons should be enough. A more in-depth guide on how to self-host it will maybe follow.

## How does it work?
When you open up Ananke the first time it won't have a lot. That's because there is (obviously) no test data on prodution.

### Accounts
Currently you can only create accounts from the command line (if you set `registerable` to `false`). It should soon also be possible to create accounts from the `/users` page, where we currently list all users.

#### Permissions
Permissions are currently very basic. There are normal users and there are admins. Admins can do a lot more that normal users, such as: Create users, rename them, change projects etc. Next we have the fact that users can also be POs of certain projects. If a user is a PO he can close tasks in that project and can also edit the project itself. Deleting the project is forbidden for any user, including the admin. That is made to ensure reliable data.

### Projects
Obviously you can create projects. Each project should represent real life projects. You can assign both tasks and also a PO to the project. The PO used to only play a visual role in the project, but now actually has an impact on the permissions. Only the PO can close tasks in that project & rename them.

### Tasks
Every project has tasks. Those can be e.g. "Implement proper CORS rules". Every task has a creator and an assigned user. It's the job of the assigned user to complete the task. Deleting tasks doesn't actually delete them, but just make them private so they don't get listed. That is done for security reasons (deleting tasks that are necessary to billing etc.)

## Other stuff

### CI/CD
This project has a 100% test coverage, with a [public CI configured on semaphoreci](https://aneshodza.semaphoreci.com/projects/ananke). If you are interested in contributing, read the next chapter.

### Tech stack
The project is based on a variaty of different technologies, which are used in componation with eachother.  

#### Web technologies
The used web technology is Ruby on Rails in an MVC architecture, but also has stimulus to help with hydrating the staticaly rendered pages. Rails is directly connected to a postgresql database, but that can be changed depending on your preferences. AWS is primarily used to store images in an s3 container.  

#### Maintenance tools
The project uses semaphoreci, rspec and depfu to keep the code maintainable over a long period of time. Semaphore is the used CI tool, to execute tests automatically on the repository. Depfu keeps all the dependencies up to date, by creating PRs bi-weekly, like for example [here](https://github.com/aneshodza/ananke/pull/30). Finally: We use rspec (in combination with capybara) to write tests. The coverage is 100%

#### Hosting
This repository isn't currently hosted, because everyone is supposed to host their own instances, but I strongly suggest to do it on Heroku. I think there you get the best bang for your buck when it comes to Rails.
![Image of tech stack](https://user-images.githubusercontent.com/75726773/222673730-a3091d13-7e53-4535-b19d-a48a63360aa9.png)

### Contributing/Forking
This project is open source and accepts PRs. Just make sure contributions pass the CI. For more specialized versions, users are expected to create their own forks. Interesting & good features are obviously welcome.  
**Important** is to keep in mind that this project is under a **GNU** license, which forces any forks to be under the same license. More about this in the next chapter

### License
This project is under a **GNU** license, which forces any derivative works (primarily forks) to operate under the same license. I picked the GNU license, because the projects intent is not commercial. To ensure that everyone can benefit form derivative works, just like current users benefit from my work, I saw this as the best option.

## Changelog

### 0.0 (19.01.2023)
The initial commit has been released by Anes Hodza.
