# React Auth

Authentication/authorization is a common problem in web apps. This lecture focuses on one strategy for solving this problem, though keep in mind, there are many!

There are a lot of moving parts to this lecture, which makes it a great exercise in solving problems that are full-stack in nature. 

Auth involves a lot of technologies/tools that you may have had limited interaction:
1. BCrypt
2. JWT
3. React Router
4. localStorage

Coordinating these can be tough, but with some clever abstraction, we can compose them in such a way that we only have to write everything once. 

## Authentication
Logging in and granting the right credentials

#### What does this look like on other sites?
1. Type in username and password
2. Click sign in or sign up
3. Get redirected to some page

#### What are the big pieces of this?
1. Sign up!
	a. 2 event handlers - one for the input fields and the other for submitting
	b. Buttons to decide to show the sign in form 
	c. Validations on the backend
	d. Write a route to receive data
	e. Write an HTTP request to send form data to backend
	f. Use form data to *create* a User
	g. Redirect depending on response from server

2. Log in!
 	a. 2 event handlers - one for the input fields and the other for submitting
	b. Buttons to decide to show the log in form 
	c. Write a route to receive data
	e. Write an HTTP request to send form data to backend
	f. Use form data to *authenticate* a User
	g. Redirect depending on response from server


#### What "credentials" are being saved in the front-end?
- *JWT!!!* - JSON Web Token. A secure "box" that can only be unlocked with a *super secret key* of your choice. What you put in here is up to you, but ideally, it should contain information that can be used to identify the user. So ask yourself: what's the most *id*entifying of *id*entifiers? 
- When a user signs in or signs up, a token should be generated and stored in the front end, typically something that persists even when the browser closes, something like `localStorage`!

#### Why do we need the token at all?
- To prevent people from faking their authenticated credentials (remember the problem of storing the ID). We're now entering the land of...


## Authorization
A way of identifying who a user is and what permissions do they have

#### What does this look like on other sites?
- Edit buttons on a user's profile only appear when the profile is owned by the user who is currently logged in
- Automatically logging in users upon page refresh and browser reload
- Preventing users from seeing certain resources (only your friends can see certain parts of your Facebook profile) 

#### When do we authorize?
- When we want to protect some resource or prevent certain users from having access to certain features of your application
	- EX: editing user information, seeing user information, seeing a dashboard that is personalized to the current user, allowing only friends to see a user's status

#### How do we handle authorization on the front end?
- If the user is authorized to use this feature/ see this view, great! Proceed as normal
- If not, user router to *redirect* the user to some other page!


