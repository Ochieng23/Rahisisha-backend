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
```json
{
  "username": "string",
  "password": "string",
  "password_confirmation": "string",
  "role": "ADMIN"

}
```

- Response:

```json
{
    "user_code": "string",
    "username": "string",
    "role": "ADMIN"
}
```
POST/generate-token - Generate Token<br>
```json
{
  "username": "string",
  "password": "string"
}
```

- Response:

```json
{
  "token": "string"
}
```
POST/admins - Complete Admin Account<br>
```json
{
  "full_name": "string",
  "email":"user@example.com",
  "user_code": "string"
}
```

- Response:

```json
{
    "admin_code": "string",
    "full_name": "string",
    "email": "user@example.com",
    "user_code": "string"
}
```
GET/admins - View All Admins<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
  [
    {
        "admin_code": "string",
        "full_name": "string",
        "email": "user@example.com",
        "user_code": "string"
    },
    {
        "admin_code": "string",
        "full_name": "string",
        "email": "user@example.com",
        "user_code": "string"
    }
]
}
```
GET/admins/{{admin-code}} - Find an Individual Admin<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
        "admin_code": "string",
        "full_name": "string",
        "email": "user@example.com",
        "user_code": "string"
}
```
GET/users - Get All Platform Users<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
  [
    {
        "user_code": "string",
        "username": "string",
        "role": "ADMIN"
    },
    {
        "user_code": "string",
        "username": "string",
        "role": "EMPLOYER"
    }
]
}
```
DELETE/user/{{user-id}} - Delete User<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
    "success": "Deleted successfully"
}
```

EMPLOYER<br>
POST/users - Create a User Account<br>
```json
{
  "username": "string",
  "password": "string",
  "password_confirmation": "string",
  "role": "EMPLOYER"

}
```

- Response:

```json
{
    "user_code": "string",
    "username": "string",
    "role": "EMPLOYER"
}
```
POST/generate-token - Generate Token<br>
```json
{
  "username": "string",
  "password": "string"
}
```

- Response:

```json
{
  "token": "string"
}
```
POST/employers - Complete Employer Account<br>
```json
{
   "company_name": "string",
    "email": "user@example.com",
    "phone_number": "string",    
    "verified": false,
    "user_code": "string"
}
```

- Response:

```json
{
    "employer_code": "string",
    "company_name": "string",
    "email": "user@example.com",
    "location": "string",
    "avatar": "",
    "description": "",
    "verified": false
}
```
PATCH/employers/{{employee-code}} - Modify/Update Employer<br>
```json
{
   "location": "string",
    "avatar": "url",
    "description": "string"
}
```

- Response:

```json
{
    "employer_code": "string",
    "company_name": "string",
    "email": "user@example.com",
    "location": "string",
    "avatar": "url",
    "description": "string",
    "verified": false
}
```
PATCH//employers/{{employee-code}}/verify - Verify Employer<br>
```json
{
    "verified": true
}
```

- Response:

```json
{
   "employer_code": "string",
    "company_name": "string",
    "email": "user@example.com",
    "location": "string",
    "avatar": "url",
    "description": "string",
    "verified": true
}
```
GET/employers - View all Employers<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
  [
    {
        "employer_code": "string",
        "company_name": "string",
        "email": "user@example.com",
        "location": "string",
        "avatar": "url",
        "description": "string",
        "verified": true
    }
]
}
```

GET/employers//{{employee-code}} - View an Individual Employer<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
    "employer_code": "string",
    "company_name": "string",
    "email": "user@example.com",
    "location": "string",
    "avatar": "url",
    "description": "string",
    "verified": true
}
```
JOB-SEEKER<br>
POST/users - Create a User Account<br>
```json
{
  "username": "string",
  "password": "string",
  "password_confirmation": "string",
  "role": "SEEKER"

}
```

- Response:

```json
{
    "user_code": "string",
    "username": "string",
    "role": "SEEKER"
}
```
POST/generate-token - Generate Token<br>
```json
{
  "username": "string",
  "password": "string"
}
```

- Response:

```json
{
  "token": "string"
}
```
POST/seekers - Complete Job-Seekers Account<br>
```json
{
    "full_name": "string",
    "email": "user@example.com",   
    "verified": false,
    "user_code": "string"
}
```

- Response:

```json
{
    "seeker_code": "string",
    "full_name": "string",
    "email": "user@example.com",
    "location": null,
    "gender": null,
    "date_of_birth": null,
    "avatar": null,
    "phone_number": null,
    "preferred_job": null,
    "availability": null,
    "minimum_salary": null,
    "verified": false
}
```
PATCH/seekers/{{job-seeker-code}} - Modify/Update Job-Seeker<br>
```json
{
    "location": "string",
    "gender": "string",
    "date_of_birth": "string",
    "avatar": "url",
    "phone_number": "string",
    "preferred_job": "string",
    "availability": "string",
    "minimum_salary": "integer"
}
```

- Response:

```json
{
    "seeker_code": "string",
    "full_name": "string",
    "email": "user@example.com",
    "location": "string",
    "gender": "string",
    "date_of_birth": "string",
    "avatar": "url",
    "phone_number": "string",
    "preferred_job": "string",
    "availability": "string",
    "minimum_salary": "integer",
    "verified": false
}
```
PATCH/seekers/{{job-seeker-code}}/verify - Verify a Job-Seeker<br>
```json
{
    "verified": true
}
```

- Response:

```json
{
    "seeker_code": "string",
    "full_name": "string",
    "email": "user@example.com",
    "location": "string",
    "gender": "string",
    "date_of_birth": "string",
    "avatar": "url",
    "phone_number": "string",
    "preferred_job": "string",
    "availability": "string",
    "minimum_salary": "integer",
    "verified": true
}
```
GET/seekers - View all Job-Seekers<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
  [
    {
        "seeker_code": "string",
        "full_name": "string",
        "email": "user@example.com",
        "location": "string",
        "gender": "string",
        "date_of_birth": "string",
        "avatar": "url",
        "phone_number": "string",
        "preferred_job": "string",
        "availability": "string",
        "minimum_salary": "integer",
        "verified": true
    }
]
}
```
GET/seekers/{{job-seeker-code}} - View an Individual Job-Seeker<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
   "seeker_code": "string",
    "full_name": "string",
    "email": "user@example.com",
    "location": "string",
    "gender": "string",
    "date_of_birth": "string",
    "avatar": "url",
    "phone_number": "string",
    "preferred_job": "string",
    "availability": "string",
    "minimum_salary": "integer",
    "verified": true
}
``` 

JOB-TAGS<br>
POST/jobtags - Configure Job-Types<br>
```json
{
  "group_name": "Medicine"
}
```

- Response:

```json
{
    "jobtag_code": "string",
    "group_name": "Medicine"
}
``` 
GET/jobtags - Get Job Tags<br>
```json
{
    "token": "string"
}
```

- Response:

```json
{
[
    {
        "jobtag_code": "kxn2-ffac-3fqx",
        "group_name": "Office Work"
    },
    {
        "jobtag_code": "6jqe-77go-fqe6",
        "group_name": "Casual"
    },
    {
        "jobtag_code": "sqr2-nhhp-bl0l",
        "group_name": "Medicine"
    }
]
}
``` 

JOBS<br>
POST/jobs - Post All Job-Listings<br>
```json
{
    "job_name": "string",
    "job_description": "string",
    "employer_code": "string",
    "jobtag_code": "string"
}
```

- Response:

```json
{
    "job_code": "string",
    "job_name": "Engineering",
    "employer_code": "string",
    "employer": {
        "employer_code": "string",
        "company_name": "string",
        "email": "user@example.com",
        "location": "string",
        "avatar": "url",
        "description": "string",
        "verified": true
    },
    "jobtag": {
        "jobtag_code": "string",
        "group_name": "Engineering"
    }
}
``` 
GET/jobs - Get All Jobs<br>
```json
{
    "token": "string"
}
```

- Response:

```json
{
    "job_code": "string",
    "job_name": "Engineering",
    "employer_code": "string",
    "employer": {
        "employer_code": "string",
        "company_name": "string",
        "email": "user@example.com",
        "location": "string",
        "avatar": "url",
        "description": "string",
        "verified": true
    },
    "jobtag": {
        "jobtag_code": "string",
        "group_name": "Engineering"
    }
}
``` 
GET/jobs/search/{{jobtag_code}} - View Job Listings Per User Preferrence<br>
```json
{
    "token": "string"
}
```

- Response:

```json
{
    "jobtag_code": "string",
    "group_name": "string"
}
```
DELETE/jobs/{{job_code}} - Delete Job Listing<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
    "success": "Deleted successfully"
}
```

POSTS<br>
POST/posts - Create a Post<br>
```json
{
    "title": "A green earth for prosperity",
    "media": "url",
    "description": "string",
    "user_code": "string",
    "likes": 0
}
```

- Response:

```json
{
    "post_code": "string",
    "title": "A green earth for prosperity",
    "media": "url",
    "description": "string",
    "likes": 0,
    "user": {
        "user_code": "string",
        "username": "string",
        "role": "EMPLOYER"
    },
    "comments": []
}
``` 
GET/posts - Browse  Posts<br>
```json
{
    "token": "string"
}
```

- Response:

```json
{
[
    "post_code": "string",
    "title": "A green earth for prosperity",
    "media": "url",
    "description": "string",
    "likes": 0,
    "user": {
        "user_code": "string",
        "username": "string",
        "role": "EMPLOYER"
    },
    "comments": []
]
}
``` 
GET/posts/users/{{user-id}}   - Get User Posts<br>
```json
{
    "token": "string"
}
```

- Response:

```json
{
[
    "post_code": "string",
    "title": "A green earth for prosperity",
    "media": "url",
    "description": "string",
    "likes": 0,
    "user": {
        "user_code": "string",
        "username": "string",
        "role": "EMPLOYER"
    },
    "comments": []
]
}
``` 
GET/posts/{{post-id}}  - Get individual post<br>
```json
{
    "token": "string"
}
```

- Response:

```json
{
    "post_code": "string",
    "title": "A green earth for prosperity",
    "media": "url",
    "description": "string",
    "likes": 0,
    "user": {
        "user_code": "string",
        "username": "string",
        "role": "EMPLOYER"
    },
    "comments": []
}
``` 
DELETE/posts/{{post-id}} - Delete Post<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
    "success": "Deleted successfully"
}
```

COMMENTS<br>
POST/comments - Comment on a Post<br>
```json
{
    "content": "Great Ininitive guys, hoping to join you next time!",
    "post_code": "string",
    "user_code": "string"
}
```

- Response:

```json
{
     "comment_code": "string",
    "content": "Great Ininitive guys, hoping to join you next time!",
    "post_code": "string",
    "user_code": "string",
    "user": {
        "user_code": "string",
        "username": "HANNAN",
        "role": "EMPLOYER"
    }
}
``` 
GET/comments/post/{{post-code}} - Get All Post Comments<br>
```json
{
    "token": "string"
}
```

- Response:

```json
{
   {
        "comment_code": "string",
        "content": "Great Ininitive guys, hoping to join you next time!",
        "post_code": "string",
        "user_code": "string",
        "user": {
            "user_code": "string",
            "username": "HANNAN",
            "role": "EMPLOYER"
        }
    }
}
``` 
DELETE/comments/{{comment-code}} - Delete A Comment<br>
```json
{
  "token": "string"
}
```

- Response:

```json
{
    "success": "Deleted successfully"
}
```


# Requirements

-Ruby version: 3.0.0 or higher
-Rails version: 6.1.4 or higher
-SQL database

# Setup

-Clone the repository to your local machine.
-Install the required gems by running bundle install.
-Setup the database by running rails db:create and rails -db:migrate.
-Start the server by running rails s.


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