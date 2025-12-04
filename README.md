Link to GitHub: https://github.com/BryceWiddoss/dartHeart 

Screens: Hime Screen and Results Page
Home Screen Description: Upon opening the app, the user is greeted with the home screen, which contains the political quiz. 
Questions are RadioListTile, where yes is coded with 1, and no is coded with 0. Unanswered questions receive a value of -1. 
Clicking ‘view results’ takes the user to the results page.

Results Page Description: The second and final page in the application is the results page. 
It lists the politicians coded into the study in descending order of what percentage the user agrees with that politician. 
It uses values from the RadioListTiles on the home screen to determine what % a user agrees with each politician, ignoring -1 values. 
The back button or back arrow will pop the page, returning the user to the homescreen survey.

Current State of Application: Currently, this application successfully serves as a way to consider issues independently of the politicians speaking about them. 
It allows American voters to reflect on their own values without becoming polarized by the current political climate. 
By hardcoding politician values into the survey, users can instantly see upon submitting to what degree their opinions align with the representation they choose to elect. 
The base application works as designed and covers almost all of the technical requirements for the project. 
It also successfully handles edge cases, such as when the user clicks ‘view results’ without filling out any survey questions or while leaving one blank. 
The political questions are also long enough that the user can give a good scope of their political views, but not so long that they become disinterested. 


Aspirations for Application given more resources: One limitation of this application is that I did not conduct a rigorous study in determining what survey questions to ask in a manner that is free from political bias.
If given more time, I would incorporate elements of my political science degree to research survey methods and bias mitigation.
Additionally, while this project successfully satisfies seven of the eight required technical elements, it lacks an element of data storage through either shared preferences or Firebase.
Trying to store a list and rebuild the application with the data saved as it was made itself an apparent roadblock throughout the project, and one that I would have overcome given more time to work on it. 
A future version of this project might also include a ‘not sure’ button on each survey question for respondents who do not fully understand the question or have no strong opinion. 
This would be treated the same as an unanswered value, not factoring into the final score of agreement with each politician. 
