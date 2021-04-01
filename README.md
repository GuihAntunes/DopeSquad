# DopeSquad
# Requirements
- Xcode 12
- Swift 5
- CocoaPods
- iOS 12.1+

# Before running the project
Before running the project, please run 'pod install' inside the folder where Podfile is located via the terminal and open the .xcworkspace file after installing the dependencies.

# Application's Patterns
- **APIModel:** Represents the data that the API knows
- **AppModel:** Represents the data that the UI knows
- **Adapter:** Adapter pattern layer that adapts the APIModel to the AppModel. This abstracts the app from the API response a bit more.
- **View:** UI layer
- **ViewModel:** Presentation rules and views data provider
- **Service:** Layer that gets data from API or Locally (In that case, using Core Data)
- **Repository:** Layer that decides where to find or send the data (Locally or from API) through an interface. Also provides the proper operation queue for each one of them.
- **Coordinator:** Layer the holds presentation streams
- **Injector:** Layer that injects the dependencies of each controller / view model / repository

# Layers Scheme (How layers communicate)

AppDelegate -> Coordinator (Injector) <-> View <- ViewModel (Repository/Service)

# Dependencies
- **MapleBacon:** Swift library for downloading images and image request thread handling. I opted for using that one because is still being mantained (commits from this week) and proper image download handling on iOS UI collections is a bit time consuming to make the way it supposed to work or work as well as MapleBacon already does.
