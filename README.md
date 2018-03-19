# Smack
Messaging app using REST API

# Purpose:

Messaging app built to better understand server-side interaction. Allows user to create an account, create channels and chat with other users. Users data are hosted on a back-end server to which the user device communicates using a REST API (with Token identification). 

# Key learnings:

- Leveraging of a back-end server (incl. Sockets) to handle key features like user creation, log-in, data retrievals (list of channels, messages, user avatars, etc.), user messaging, etc.
- Use of asynchronous task handling to avoid having the app "stuck" when waiting for server to send data back
- Use of notification center to trigger updates to UI/ Data models when certain events happen (e.g., user logs out, user select a channel, data received from server, etc.)
- Leveraging of key UI elements like gesture recognizer, TableView (incl. auto-scroll), shift vertical translation of textbox when keyboard pops up (so as to avoid keyboard covering it)
- Succesful use of 3rd party libraries (Cocopods) for communication handling (Socket IO, AlamoFire), JSON handling (Swifty JSON) and SWRevealView
