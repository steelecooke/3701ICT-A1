#  Assignment 1

## MileStone 1

### Summary

This first milestone requires me to create a CheckList App that runs on iOS in the XCode simulator.

It will be a simple user interface that displays the following:
- A static check list with a title
- At least four check list items
- Some check list items should be checked and some unchecked

I'll need to implement version control for the project using git with XCode's built in source control.

I'll be referencing the iOS "Reminders" application for the user interface as it has a similar functionality and a good user interface.

### What I've learnt

- Generic Swift syntax (functions, if statements, variable declaration)
- Tables and regular/compact formatting
- Lists and how to strcuture them
- System UI Icons and Images
- Checklists aren't an inbuilt type but can be implemented using a list and images
- Expanding component views into other functions to make code more readable
- Structs and classes
- Basic Swift Unit Testing
- Swift best practice is to use PascalCase for structs and lowerCamelCase for variables
- Swift / iOS development code modularization

### What I've implemented

#### Technical notes

- A list using a custom struct
- Updated the list to be a checklist using a HStack and system icons
- A function that generates and returns an example list 
- Unit tests that validates the example list returned by the function
- An additional unit test to validate the ListItem struct creation itself 
- Object naming conventions - PascalCase for structs and lowerCamelCase for variables
- Code modularization
- Struct functions

#### Functional Requirements notes

- A static check list with a title
- At least four check list items
- Some check list items should be checked and some unchecked

### What I've encountered issues with

- I initially tried to create a struct for the checklists that would contain the multiple arrays of ListItems to help with future code. Though unlike golang (which I've been using lately) where I can just include the struct inside it as a variable and be able to call it and the related functions I ran into issues with this. Since I didn't have to implement this feature immediatly I decided to come back to it later.
