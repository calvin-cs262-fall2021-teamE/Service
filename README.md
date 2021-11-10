This is based on https://cs.calvin.edu/courses/cs/262/kvlinden/09is/homework.html

This is the data service fo the Monoloply application with updated join query and updated client for the mobile application to read that data.


a.
   https://cs262-monopoly.herokuapp.com/playerScore
   https://cs262-monopoly.herokuapp.com/players
   https://cs262-monopoly.herokuapp.com/games


b. The /playerScore URL can only be used to implement nullipotent actions. The /players and /games URLs can be used to implement nullipotent and itempotent actions.

c. This is a RESTful data service because it is based on HTTP methods to access data using GET, POST, PUT and DELETE. It is a stateless and client-server application. It separates the UI from the server system.

d. There is no evidence of impedance mismatch in our implementation.
