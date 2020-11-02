This is a Alpha-Blog Project developed using Rails 6.
Production Link:  https://alpha-blog-demo.herokuapp.com

This Projects contains major features of Blog like Articles,Categories, Users, Authentication and related modules with CRUD operations.

Resource

    Users - create users table and model - add validations 
    * username must be present and unique, min 3 max 25 
    * email address must be present and unique, max 105 
    * email must be valid email format, check with email regex

Associations

    One-to-many between users and articles

REST for users

Authentication

    Login using secure password

Restriction of actions

    Based on logged in/logged out state

Security

    Admin user functionality and access level

