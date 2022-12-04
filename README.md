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

## v 2.0.0, build 3: 12/4/2022
### Features
  - Confirm password entry on registration page 
  - Profile page with user login information
  - Lower navigation tab bar
  - Scrollable list of Past Reviews
  - Review comments include tag of incivility type and rating
  - Five Fist Icon for view place average rating
  - Live cloud MongoDB
  - Authenticated user actions 
    - Log-out functionality
    - User profile and detail retrieval
  - Email verification and password reset
  - Report/like functionality for reviews
  - Education activism page
  - Business accounts
    - Link to place through Google Places API
    - Provide description/message on place profile
### Bug Fixes
  - Deprecated authentication procedures updated

### Known Issues and Limitations:
  - Submitting only a rating for one submission causes future reviews to not show up
  - Currently able to select polar opposites for tags for a single review
  - Date-time for submitted reviews submitted as in 1970 (issue isolated to front-end)
  - Business account functionality limited to branch off of development

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

### Known Issues and Limitations
- The login page is unintentionally accessible through the back navigation arrow. This may freeze the app and require a reboot.
- Errors related to login or account creation (such as invalid password or failed attempts) are not shown to the user. Instead, only valid login and registration attempts change the page.
