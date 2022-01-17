Uses mySQL and discord.js

How it works:

User sends message
        |
        |
        V
Check database for responses to that message --------------------------------------Message does not exist
        |                                                                                  |
        |                                                                                  |
Message exists                                                                             V
        |                                                                    Add the message the user said to the database, with no saved responses
        |                                                                             (capped number)
        V                                                                                  |
Get the 3 different responses and thier scores                                             V
        |                                                                       Send a random message from the database
        |                                                                                  |
        V                                                                                  |
Choose a randome response, higher score, more likely                                       |
                                                                                           V
                             already exists--------------------------------------------Save the response
                                    |                                                      |
                                    |                                                      Doesnt exists
                                    V                                                      |
                            increase its score by 1                                        V
                                                                                        Save response to database if theres and open slot
