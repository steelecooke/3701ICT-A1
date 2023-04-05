# Assignment 1

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
- Git source control tagging

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
- Git source control (commits, push, tagging)

#### Functional Requirements notes

- A static check list with a title
- At least four check list items
- Some check list items should be checked and some unchecked

### What I've encountered issues with

- I initially tried to create a struct for the checklists that would contain the multiple arrays of ListItems to help with future code. Though unlike golang (which I've been using lately) where I can just include the struct inside it as a variable and be able to call it and the related functions I ran into issues with this. Since I didn't have to implement this feature immediatly I decided to come back to it later.

### Video Demonstration

The video demonstration of the milestone 1 checklist application has been uploaded to the following YouTube URL as an unlisted video:

Youtube: https://www.youtube.com/watch?v=wAAPAC1GjZc

## MileStone 2

### Summary

The second milestone requires me to update the existing CheckList App that runs on iOS in the XCode simulator.

It will need the following functionaility:
- Master View that displays a list of CheckList and their titles
- Add new CheckLists in the MasterView by clicking a plus button
- Edit existing CheckLists in the MasterView by clicking the Edit button allowing CheckLists to be deleted
- The MasterView list of CheckLists needs to be embeded in a navigation view that shows the respective checklist DetailView when a user taps on the CheckList in the MasterView.
- The DetailView should be implemented as the work completed in MileStone 1.
- The DetailView should have functionaility to edit the checklist by adding new items and an edit button that allows users to delete existing items.
- The DetailView should also include a Reset button that changes the checked status of all items to unchecked and an Undo button that reverts the action of the Reset button changing all items back to their origin checked state.
- The DetailView should also include a Back button that returns the user to the parent MasterView.   

I'll need to continue implementing version control for the project using git with XCode's built in source control.

I'll be referencing the iOS "Reminders" application for the user interface as it has a similar functionality and a good user interface.

### What I've learnt

- Basics of implementing Model-View-ViewModel (MVVM) in Swift
- Optional varibales
- Unwrapping variables
- Swift Classes
- Focusing SwiftUI components
- Further understanding of the ForEach loop when using item indexs
- Popovers
- Component styling such as font and scale
- SF Symbols for system UI images
- ZStack item formating
- SwiftUI component spacing and styling
- SwiftUI variable bindings (Being able to bind from parent view to child)
- Navigation View toolbar components
- Enviroment variables
- SwiftUI list edit mode
- OnTap, OnGesture, OnDelete properities for SwiftUI components

### What I've implemented

#### Technical notes

- Model-View-ViewModel with separate ViewModels for the respective View
- A new struct for checklists
- Bindings for variables so changes in child views are reflected in the parent and passed to other child views
- Formatting and styling of the various swift UI components
- Automatic focusing of text field components
- NavigationView parent/child view
- SwiftUI SF Symbols for display images
- Popover for creating a new checklist
- Checklist edit mode using enviroment variable
- Git source control (commits, push, tagging)

#### Functional Requirements notes

- MasterView called CheckListCollectionView that displays a list of all checklists
- DetailView called CheckListView that displays the contents of a checklist
- Ability to add and remove checklists in the MasterView
- Ability to add, edit and remove list items in the DetailView
- Ability to change the checklist's name in the DetailView
- Ability to "reset" all items in a checklist to unchecked in the DetailView
- Ability to "undo" the changes done by the "reset" button 
- Ability to navigate back to the MasterView from the ChildView

### What I've encountered issues with

- I've experienced issues with changing the binding variables from @Binding to be used in the ViewModels. I've seen some people recommend using a single view model the contains the data needing to be passed between multiple different views though that didn't seem like a best practice approach and the other methods seemed overly complicated.
- I encountered a number of issues when trying to style the application with weird behavior from the NavigationView causing a number of issues that I eventually resolved though it took significantly longer than expected.  

### Video Demonstration

The video demonstration of the milestone 2 checklist application has been uploaded to the following YouTube URL as an unlisted video:

Youtube: 
