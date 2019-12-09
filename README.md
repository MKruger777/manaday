# manaday

## Backstory
This pet project started after following a 3 day Linux course by the legendary (well in the Netherlands anyway) Hendrik-Jan Thomassen. Being super inspired and pumped to continue on my learning journey with bash/ Linux, I was desperately searching for a means or strategy to achieve this.  

## Solution
So somewhere I got onto the idea to apply my new-found knowledge write something in bash that will help me learn more about bash :- ) This will be achieved by delivering a bash/Linux manual in my mailbox every day. From the code, it should be pretty obvious that this so-called "journey" has bearly started for me - a mere novice.

## The mechanism
+ We harvest some manuals from the os via the setup the setupmanlib.sh  
+ packaged these into a folder structure located in a directory called "manlib"  
+ The main logic is run from a script called "manaday.sh"  
+ A random number will be generated within the range (min and max manual ids) we have in the manlib folder.  
+ In order to avoid sending duplicate files, all sent manual's ids are stored in the file: "completed"  
+ The list of subscribers that will receive email is located in the "recipients" folder.

## Tested
+ Currently running on: Ubuntu 18.04.2 LTS

## Requirements
+ Bash shell  
+ AWK
+ Working and configured sendmail  

## Contributing
If you feel that there is still a heartbeat here and think you can contribute to make things beter, please feel free!

## Usage
+ Clone the repo
+ Run setupmanlib.sh
+ Add some recipients (email adresses) to the file recipients. End each emailadress with a line feed (in VI just enter)
+ From this point on you can running of manaday.sh should send a random Linux manual

## Scheduling
For scheduling I used a cron job to handle this. Just configure the interval and point to the script manaday.sh and cron will do the rest. 


