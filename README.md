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

JOB-TAGS<br>
POST/jobtags - Configure Job-Types<br>
GET/jobtags - Get Job Tags<br>


JOBS<br>
POST/jobs - Post All Job-Listings<br>
GET/jobs - Get All Jobs<br>
GET/jobs/search/{{jobtag_code}} - View Job Listings Per User Preferrence<br>
DELETE/jobs/{{job_code}} - Delete Job Listing<br>

POSTS<br>
POST/posts - Create a Post<br>
GET/posts - Browse  Posts<br>
GET/posts/users/{{user-id}}   - Get User Posts<br>
GET/posts/{{post-id}}  - Get individual post<br>
DELETE/posts/{{post-id}} - Delete Post<br>

COMMENTS<br>
POST/comments - Comment on a Post<br>
GET/comments/post/{{post-code}} - Get All Post Comments<br>
DELETE/comments/{{comment-code}} - Delete A Comment<br>


# Requirements

-Ruby version: 3.0.0 or higher
-Rails version: 6.1.4 or higher
-SQL database

# Setup

-Clone the repository to your local machine.
-Install the required gems by running bundle install.
-Setup the database by running rails db:create and rails -db:migrate.
-Start the server by running rails s.

# Usage

Access the API endpoints using the base URL http://localhost:3000/.

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