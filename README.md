# mycv
This is a personal project to create a one page style resume website using Ruby on Rails. <br/>
Environment:<br/>
Ruby 2.4.3<br/>
Rails 5.1.4<br/>
MySQL 5.7<br/>
<br/>
To setup the environment, here is a nice tutorial at: https://gorails.com/setup/ubuntu/16.04
<br/>
This project also use a CMS gem call Camaleon: https://github.com/owen2345/camaleon-cms

To run this project, following the steps:<br/>
1 clone this project to your workspace<br/>
2 create database for your environment<br/>
3 modify config/database.yml to fill in your database setting<br/>
4 run 'rake db:migrate RAILS_ENV=[environment]' (replace [environment] with your environment name)<br/>
5 run 'bundle install' at the project folder<br/>
6 run 'rails s -e [environment]' at the project folder (replace [environment] with your environment name)<br/>
7 a setup page should be viewable at http://localhost:3000
