This is based on https://cs.calvin.edu/courses/cs/262/kvlinden/09is/homework.html

This is the data service fo the Monoloply application with updated join query and updated client for the mobile application to read that data.


a.
   https://cs262-monopoly.herokuapp.com/Players
   https://cs262-monopoly.herokuapp.com/players/:id
   https://cs262-monopoly.herokuapp.com/players/owen
   https://cs262-monopoly.herokuapp.com/


b. The routers that use put and delete are idempotent. The ones that use get are nullipotent and the ones that use post are neither.

c. Yes, because it is based on HTTP methods to access data using GET, POST, PUT and DELETE. It is a stateless and client-server application. It separates the UI from the server system.

d. Yes!
