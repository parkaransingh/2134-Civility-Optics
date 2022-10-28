# 2134-Civility-Optics
Civility Optics is a mobile application for rating the social civility of businesses and public venues. The 
platform provides access to ratings that commend businesses with fair social treatment and ratings that hold 
businesses accountable for unfair social treatment. 
The native application interfaces with the backend to authenticate user 
activity, provide civility information about local venues, and collect civility ratings for venues. The backend 
will integrate an authentication service for managing user accounts, connect to the Google Places API to find 
local businesses, and host a database for logging user’s ratings.



## Team members
Madhura Gangal,
Keith Tan,
Parkaranjot Singh,
Menelik Gebremariam,
Alexander Goebel,
William Silva



# Civility Optics iOS Release Notes

## v 1.3.0, build 4
### Features:
- Log out/in to multiple accounts on the same device
- Verify a users email
- Banned users are unable to log in or get authentication
- Indicate helpful reviews
- Flag/report a user/review
- Authenticate user actions

### Bug fixes:
- auth now uses correct request body field.

### Known Issues and Limitations:
- Date time submitted for reviews still wrong.
- Latency with helpful count (missing model refresh?)
- Submit single ratings without a review
- Move mongo key to env
- Contradicting tags

## v 1.2.0, build 3
### Features
- View past ratings and revuews on profile page
- Personalize what information to provide, with the option to include race, gender, and disabilities
- View username of the person who wrote a particular review
- View the date that a particular review was written
- Select between creating a reviewer account and a business account
### Bug Fixes

### Known Issues and Limitations:
- Date that a review was written defaults to incorrect date
- Authentication logic not working (currently disabled in the current build) 
- Submitting only a rating for one submission causes future reviews to not show up
- Currently able to select polar opposites for tags for a single review


## v 1.1.0, build 2 
### Features
  - Confirm password entry on registration page 
  - Profile page with user login information
  - Lower navigation tab bar
  - Scrollable list of Past Reviews
  - Review comments include tag of incivility type and rating
  - Five Fist Icon for view place average rating
  - Live cloud MongoDB
### Bug Fixes

### Known Issues and Limitations:
  - Authentication logic not working (currently disabled in the current build) 
  - Submitting only a rating for one submission causes future reviews to not show up
  - Currently able to select polar opposites for tags for a single review


#### Previous Development by previous team
## v 1.0.0, build 1

### Features
- Create new accounts
- Login to existing accounts
- Search for nearby venues
- View venue ratings and comments
- Submit a Five Fist Rating
- Select a date visited for ratings
- Add tags to ratings
- Add a comment to ratings
- View past ratings and reviews on profile page
- View username of person who wrote a particular review, and the date it was written
- Select business user or reviewer as the user type when creating an account

### Known Issues and Limitations
- The login page is unintentionally accessible through the back navigation arrow. This may freeze the app and require a reboot.
- Errors related to login or account creation (such as invalid password or failed attempts) are not shown to the user. Instead, only valid login and registration attempts change the page.
- The date that a review was created automatically defaults to 
