Sencha Touch Sign-Up Module based On REST principle

This Sencha Touch based Sign-Up/Registration modules provides most of the code required to get user registered. 

User sign-up is important but at the same time it does not add big value to your business logic. I googled but did not find any available , reusable Sencha Touch component which I can use and modify. So I spent several hours and wish other get benefit of this too.

User sign-up is required if you want to let user sign-in from multiple devices but at the same time it should not waste too much time of user which may result user abandoning the app.

So this module uses "Snap Sign-Up !" , user is asked for first name and word-they-like, server creates unique userid based on first name and uses the word as password. User does not have to enter personal details etc. If user wish to go for full secure signup, the choice is given to user to either Secure Sign Up or start using the app right away.

The main app should give user opportunity later too to edit/enhance user details.

Developer needs to set registrationURl property which is used by the module. The module sends application wide event "signUpSuccess" passing object of generated/updated user.

Technical Details:
1- Server should be able to accept firstname and password only. Try firstname as userid, if userid already present, generate another one using firstname sent. For example, firstname sent is "john" and if that userid is already taken, server should be able to generate another unique "john" for example john1234.

2- In case user opts for "Secure Signup" and uses complete signup form, server should be able to check if edited userid is already taken and if taken returns HttpStatus code CONFLICT (409). 

3 - The module expects server working on RESTful calls. While creating user use POST method, for updating user PUT method. In both the methods, server is expected to respond json object of created or updated user.

4 - Server should accept json as request body with fields userid, password, firstName. For complete sign-up server should accept json with additional lastname, userEmail.

5- Returned user json object can have as many fields, all will be passed with signUpSuccess event.

6. Module uses createdOn and updatedON attributes from returned user json to confirm server call was successful. This check is addition to HttpStatus check which Sencha does on its own.
