# README for Ruby on Rails Backend

# Job Seekers - Ruby on Rails Backend

This is the Ruby on Rails backend for the Job Seekers application. It provides the server-side functionality required for the application to work properly, built with ruby on rails,  and deployed on Railways. The application includes a User table with one to may relationship to the posts and follows table, it will also include admins table, employer profiles table and job seeker profiles tables

# Features

-User authentication and authorization.
-Admin Authentication and authorization
-API endpoints to handle CRUD operations for job listings, user -profiles, and job applications.
-Integration with PostgreSQL database to store application data.

# Api Endpoints

ADMIN<br>
POST/users - Create a User Account<br>
POST/generate-token - Generate Token<br>
POST/admins - Complete Admin Account<br>
GET/admins - View All Admins<br>
GET/admins/{{admin-code}} - Find an Individual Admin<br>
GET/users - Get All Platform Users<br>
DELETE/user/{{user-id}} - Delete User<br>

EMPLOYER<br>
POST/users - Create a User Account<br>
POST/generate-token - Generate Token<br>
POST/employers - Complete Employer Account<br>
PATCH/employers/{{employee-code}} - Modify/Update Employer<br>
PATCH//employers/{{employee-code}}/verify - Verify Employer<br>
GET/employers - View all Employers<br>
GET/employers//{{employee-code}} - View an Individual Employer<br>

JOB-SEEKER<br>
POST/users - Create a User Account<br>
POST/generate-token - Generate Token<br>
POST/seekers - Complete Job-Seekers Account<br>
PATCH/seekers/{{job-seeker-code}} - Modify/Update Job-Seeker<br>
PATCH/seekers/{{job-seeker-code}}/verify - Verify a Job-Seeker<br>
GET/seekers - View all Job-Seekers<br>
GET/seekers/{{job-seeker-code}} - View an Individual Job-Seeker<br>

# Requirements

-Ruby version: 3.0.0 or higher
-Rails version: 6.1.4 or higher
-SQL database

# Setup

-Clone the repository to your local machine.
-Install the required gems by running bundle install.
-Setup the database by running rails db:create and rails -db:migrate.
-Start the server by running rails s.



# Routes
POST

Configure Job types
http://127.0.0.1:3000/jobtags

Post Job listing
http://127.0.0.1:3000/jobs

Create a Post
http://127.0.0.1:3000/posts

Comment on a Post
http://127.0.0.1:3000/comments

GET

Get Job tags
http://127.0.0.1:3000/jobtags

Get All Jobs
http://127.0.0.1:3000/jobs

View Job listings Per User Preference
http://127.0.0.1:3000/jobs/search/{{jobtag_code}}

Browse Posts
http://127.0.0.1:3000/posts

Get User Posts
http://127.0.0.1:3000/posts/users/{{user-id}}

Get Individual Post
http://127.0.0.1:3000/posts/{{post-id}}

Get All Post Comments
http://127.0.0.1:3000/comments

DELETE

Delete Job listing
http://127.0.0.1:3000/jobs/{{job_code}}

Delete Post
http://127.0.0.1:3000/posts/{{post-id}}

Delete A Comment
http://127.0.0.1:3000/comments/{{comment-code}}


# Contributing

-Fork the repository and create a new branch.
-Make changes to the codebase and commit the changes.
-Submit a pull request to merge the changes into the main branch.     

# Credits

-Job Seekers is inspired by LinkedIn.

# Technology

-Ruby on Rails

# License

Approved by Moringa school

# Authors

Group 6