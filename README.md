sencha-rest-signup-module
=========================

Pluggable User Signup Module for Sencha Touch. The module uses RESTful service for server communication. This module is created to avoid repeatative work developers have to do add sign-up/sign-in functionality in all Sencha Touch applications. 

For sample back-end for this project, please refer to my other project "sencha-backend-roo"

All handlers are inside the component and not in controllers. This has been done to make sure component is pluggable easily in other Sencha Touch Projects.
Application wide event is triggered so that it can be captured anywhere. 
For example signUpSuccess event is fired application wide.

Features:
* Follows "Snap Sign Up"(T) method for signup. Here is little bit about this approach.
The signup process allowes users to signup in one click using just user name and temporary password.
Temporary password is kept purposely visible to make signup far easier.

The user name is saved in localStorage. If username is already taken, server should generate unique with any algorithm. Curently, my other github project, sencha-backend-roo does it for you. Please use that as an example.
If user wants to sign up securely , module gives chance to further sign up with more details and secure password. In secure signup, users get chance to change userid as they wish.

All server calls are done using REST paradigm. Create user is done using POST method. Update user is done using PUT method etc. 

userObject received from server is kept in localStorage and also passed in event signUpSuccess. Currently plainPassword is also saved in localStorage to support stateless server communication later. Client side encryption of plainPassword will be done in future. It is assumed that communication to server is using HTTPS. 
