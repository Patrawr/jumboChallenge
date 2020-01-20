# Jumbo Challenge
##### Author: Patrick Wawrzoszek, January 2020

## Overview
The challenge was to design a native iOS app that communicates with javascript in a webview, can trigger javascript functions in said webview and receive and handle messages from that same webview. It then visually displays these messages, which describe "operations" in the native app, concurrently.

The entire system comprises of a few main architectural components:

- A storyboard where the interface is laid out and connected to a viewController class
- A UIViewController class which contains and/or initializes:
    - A WebKit webview
    - A UiTableView
    - A class which defines the contents of a custom tableView cell
- An Operation class describing a single operation's data model
- A operationsHandler class that contains all business logic on how to handle different messages and update the data model accordingly

## Design
### Main View Controller
The main scene of the app contains a single view controller, defined in the ViewController class. This view controller contains all the elements needed to display and run this single-page app, including a webkit webview and a uiTableView with a custom uiTableCell.

The webkit view exists solely to run the javascript provided in the challenge and is hidden behind the uiTableView as it is not needed for any display purposes. I would have preferred to hide the webView entirely but all research online seemed to indicate that if I did, then the javascript would no longer continue to be executed.

The webview is setup and loaded with a small piece of html in the view controller's viewDidLoad method. Also, the viewController is made a delegate of the table view so that it may modify and display the table's data. I wanted to try and separate the tableView from the main view controller, as it would make for more modular and easy to read code, but could not get it working. This is something I would look into again for future improvements and refactoring. 

A custom table view cell is defined in MessageProgressTableViewCell and it is also defined as the cell to use for the table in the viewController. It contains a progressView that is used to visually represent the progress of an operation, as well as some labels to indicate which operation it pertains to and the current/final state (if there was an error success etc.) 


### Message Handling
There are two main methods that pertain to operations: 

    - startNewOperation()
    - handleMessage()

##### func startNewOperation     
Calling this:

- sets up a new operation which involves generating a random string
- invoking the operationHandler's startOperation method. 
- call the javascript's startOperation() function with the generated ID string which will cause messages to start being sent
- insert a new row into the uiTableView for the given operation id


##### func handleMessage()
The UI view controller is registered to receive messages from the javascript with a schema of "jumbo". When it does, it will invoke the operationsHandler's handleMessage function (discussed below), which is the starting point of processing the message and determining whether to and how to update the data model. This function also returns an index path to tell the tableView which particular row to update. 

This is far more efficient than calling reloadTable() for every update which would get resource intensive quickly with a large table. 


### Operations Handler Class
In doing this challenge, I tried to separate concerns as much as I could to keep class sizes small and only contain functionality directly related to their purpose. 

Where the view controller handles setting up all the views and display, the operationsHandler actually parses the JSON string received from the javascript, as it is passed along from the viewController. It also contains an array of operations, keeping track of all the operations that have been started during the app's execution.

 This all begins with the handleMessage function which in short: converts the JSON string to a dictionary, retrieves what index in the operations array the current message is meant for and then actually parses the struture of the JSON to determine what sort of data mutation to perform. Once this is all complete, a new IndexPath is calculated and returned to the view controller so that it may update the appropriate cell with the new data.

## Testing
 The operationHandler class was also where the majority of my testing took place. I implemented a button to use during runtime to trigger operations and catch any errors that may occur from receiving the json message from javascript to parsing it out and updating the data model. I also had helper fuctions that could fire off operations automatically, or preload data into a cell to see how my app handled it. These all could be scripted as unit tests to help find the application's edge cases when implemented on a larger scale.

## Challenges
1. Figuring out when the javascript had been loaded and evaluated and the view had been presented

I had a bit of trouble at the beginning getting the javascript to execute at all. I was calling it in the viewDidLoad() method which I assumed meant the view had already loaded at this point. It didn't necessarily mean that the webview had been setup and the javascript was evaluated. During development I changed this to a button and eventually moved to use the viewDidAppear with a bit of delay to ensure no operation was started before the javascript had loaded.

2. Parsing the JSON string, loading into a dictionary and then accessing the value in the dictionary proved a bit troublesome.

Because the dictionary is of type [String: Any] to accommodate the possible different types in the JSON, I had to cast the values from an Any? to my desired type. This took a little finessing but I eventually settled on downcasting to a new variable to properly unwrap and convert the variable to the type I needed.


## Next Steps/Potential Improvements
1. Minimize the impact of the webview as it is only being used to execute javascript. I can remove the html file from the bundle and just generate one within the code to make the bundle slightly smaller, and also toy with where and how the webview exists in the view heirarchy. I'd also delve further into seeing if it is possible at all to remove the webview from the view heirarchy somehow an still have the benefits of the javascript executing, perhaps somewhere in the background?

2. Properly detect when the webview and javascript have been evaluated and the view controller has drawn everything to the string, so the operations start as a result of those finishing rather than a delayed start. I realize the current implementation is not foolproof as different devices would take a different amount of time to load everything, and operations may kick off before everything is fully loaded.

3. Separate setting up the table view into another class if possible, and use a delegate to communicate with the view controller; need to investigate if/how this is possible.

4. Try to animate the progress bar rather than refreshing the table cell row. Currently it just refreshes the whole row in and looks like the progress bar is fading from state to the next. I would try to refine it to avoid that if possible and update the progress and other elements without that fade in-out animation look.

5. Handle the parsing of the json and casting of data in the operationsHandler a bit cleaner. 
