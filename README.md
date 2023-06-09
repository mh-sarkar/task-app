# Introduction
This is a backend endpoint to test candidates who want to join to our company Silicornya Ltd. \
This backend include websocket and autthentication system. \
To test new flutter developers if they can integrates this apis and build the app.

# Task Details
This app should have authentication system. \
Task 01: User Registration, User Login, User Details. \
Task 02: User can send & receive message using chatbox. (Web Socket) \
NB: (Chat between users and server).In this page user can send message to server and get a message back immediately. You should show that message too.  \
Task 03: State Management

NB: Be carefull about design, code readability and commenting.

##
proxy=http://18.136.192.25 \
port=8000 
# Auth Api
## Registration
url=http://proxy:port/registration/ \
Http Method : POST \
Content-Type: application/json \
body: \
{ \
    "username": "", \
    "email": "", \
    "password1": "", \
    "password2": "" \
} 

Username should be unique. If not it will send you and error and response to you. You should check the response and show to the users.Password 1 and Password 2 must be same.

When username is not unique then error is 400 and will send you a object of errors. \
{ \
    "username": [ \
        "A user with that username already exists." \
    ], \
    "email": [ \
        "A user is already registered with this e-mail address." \
    ] \
} \
You should show the this error to the user. 

If success and http status code is 201 which means user is created successfully , it will send you response like this object: \
{ \
    "key": "cb0389fa588a479ca30191d6d7403e4b15fa84f4" \
} 

This key is the token to Authorize the use. \
One can get and update his user details information , and verify himself as authenticate with the token,

## User Details API
url=http://proxy:port/auth/user/ \
Http Methods: GET , PATCH, \
Content-Type: application/json \
Headers: \
{ \
    "Authorization":"Token cb0389fa588a479ca30191d6d7403e4b15fa84f4" \
} \
Without the correct token you will not be authenticated.

When PATCH \
body: \
{ \
    "first_name": "Salek",  \
    "last_name": "Ahmed" \
} \
available fields: \
{ \
    "pk": 4, \
    "username": "sasaj5", \
    "email": "sasaj5@gmail.com", \
    "first_name": "Sal", \
    "last_name": "Ahm" \
} \
For both GET and PATCH it response this object: \
{ \
    "pk": 4, \
    "username": "sasaj5", \
    "email": "sasaj5@gmail.com", \
    "first_name": "Sal",  \
    "last_name": "Ahm" \
} 

## Login API:

url=http://proxy:port/auth/login/ \
Allow Http Method: POST \
body: \
{ \
    "username": "", \
    "email": "", \
    "password": "" \
} \


If success and http status code is 200 which means user is created successfully , it will send you response like this object: \
{ \
    "key": "cb0389fa588a479ca30191d6d7403e4b15fa84f4" \
} \

When an error occur then error is 400 and will send you a object of errors. \
{ \
    "password": [ \
        "This field may not be blank." \
    ], \
     "non_field_errors": [ \
        "Must include \"username\" and \"password\".", \
         "Unable to log in with provided credentials." \
    ], \
} 

# Websocket API

Websocket endpoint is: \
'ws://proxy:port/connection/<room>/<name>/<email>/' \
where <room> is a unique room Number to listen to this socket channel. You should generate your room number and listen to the number to get back your message. \
<name> is the user's username \
<email> is the user's email 

If user send a message to the socket channel and he/she will get back a message from the server. \
You sould show the server message to the user. 


# API for previous chat Messages
http://proxy:port/chats/getChats/ \
HTTP Method : GET \
headers: \
{ \
    "Authorization":"Token cb0389fa588a479ca30191d6d7403e4b15fa84f4" \
} 

response: \
[ \
    { \
        "id": 4, \
        "name": "sasaj5", \
        "email": "sasaj5@gmail.com", \
        "room": "1", \
        "message": "Hello Server!", \
        "serverMessage": "sasaj5, you have sent this message: Hello Server!. Thanks for contact us. We will message you soon to your email: sasaj5@gmail.com", \
        "created_at": "2023-06-09T17:18:18.553680Z" \
    } \
] 
