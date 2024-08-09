# Threader

Threader is a SwiftUI-based clone of the popular iOS Threads app. It replicates the core functionality of the original app, providing users with a seamless experience to interact, post, and engage with threads.

## Features

- **User Authentication**: Users can sign up, log in, and manage their sessions.
- **Activity Feed**: A view to display user activities and interactions.
- **User Registration**: New users can create accounts directly from the app.
- **Explore**: Users can discover new threads and profiles through the Explore section.
- **Thread Interaction**: Users can like, share, and comment on threads.
- **Profile Management**: Display and manage user profiles, including profile images.
- **Main Feed**: A timeline where users can browse through posts and threads.
- **Create Post**: Users can create new posts or threads directly from the app.
- **User Profiles**: Users can view their own profile as well as others, with options to edit and manage their information.
- **User Content**: View a list of all content posted by a user, including threads and replies.
- **Profile Editing**: Users can edit their profiles, including updating their profile picture, bio, and other personal information.
- **Thread Details**: View detailed information about a thread, including content and user replies.
- **Thread Replies**: Users can reply to threads and view replies from others.
- **Firebase Integration**: The app uses Firebase for backend services, including user authentication and possibly data storage.
- **Image Uploading**: Users can upload images, such as profile pictures or attachments to threads.
- **Custom UI Modifiers**: Consistent button and text field styling across the app through reusable modifiers.

## Installation

To run the project locally, follow these steps:

```bash
# Clone the repository
git clone https://github.com/yourusername/Threader.git

# Navigate to the project directory
cd Threader

# Open the project in Xcode
xed .

# Ensure all dependencies are installed, especially Firebase
# Install any CocoaPods if required
pod install

# Build and run the project

## Usage
Upon launching the app, users are presented with a login screen.
New users can sign up by navigating to the registration screen.
Once authenticated, users can explore threads, interact with content, and manage their profiles.
The main feed provides a timeline of posts, and users can create new posts through the dedicated creation view.
Profiles can be viewed and edited, with the ability to see all posts made by a user.
Users can navigate between different sections of the app using the tab view, explore detailed thread content, and interact by posting and viewing replies.
Image uploading functionality is integrated, allowing users to upload profile pictures or attach images to posts.

## File Structure
Threader/
│
├── MDPfinalProjectApp.swift            # Entry point of the app, setting up the app lifecycle and initial view
├── ActivityView.swift                  # Handles UI components related to user activity and interactions
├── AuthService.swift                   # Manages user authentication, including login and registration processes
├── LoginViewModel.swift                # ViewModel for managing data and logic for the login view
├── RegistrationViewModel.swift         # ViewModel for managing data and logic for the registration view
├── LoginView.swift                     # UI for the login screen, handling user input for authentication
├── RegistrationView.swift              # UI for the registration screen, allowing new users to sign up
├── ContentActionButtonsViewModel.swift # Manages the logic behind action buttons for threads, such as liking and sharing
├── ContentActionButtonsView.swift      # UI for displaying action buttons associated with thread content
├── ThreadCell.swift                    # UI component representing a single thread, displaying content and user information
├── CircularProfileImageView.swift      # Custom view for displaying circular user profile images
├── UserCell.swift                      # UI component for displaying user information in lists, such as followers or search results
├── ExploreView.swift                   # Main view for the explore section, allowing users to discover new content
├── ExploreViewModel.swift              # Manages data and business logic for the explore section, including content discovery
├── FeedView.swift                      # Displays the main feed of posts and threads, similar to a social media timeline
├── FeedViewModel.swift                 # Manages the logic and data flow for the feed, including fetching and displaying posts
├── CreatePostView.swift                # UI for creating a new post or thread, allowing users to compose and submit content
├── CreatePostViewModel.swift           # Manages the data and logic for the post creation process, handling input, validation, and submission
├── ProfileHeaderView.swift             # Defines the header for user profiles, displaying key user information like profile picture, name, and bio
├── ThreadReplyProfileCell.swift        # UI component for displaying a user’s profile in a thread reply, including their profile picture and reply content
├── UserContentListView.swift           # Displays a list of content posted by a user, such as their threads or replies
├── UserContentListViewModel.swift      # Manages the data and logic for the user content list view, handling the fetching and display of user-generated content
├── CurrentUserProfileView.swift        # UI for displaying and managing the currently logged-in user’s profile, allowing them to view and edit their information
├── CurrentUserProfileViewModel.swift   # Manages the logic and data flow for the current user profile view, handling profile updates and data retrieval
├── EditProfileView.swift               # UI for editing a user’s profile, allowing them to update their profile picture, name, bio, and other details
├── EditProfileViewModel.swift          # Manages the data and logic for the profile editing process, handling validation and submission of updates
├── ProfileThreadFilter.swift           # Defines a filter mechanism for sorting or filtering threads within a user profile
├── ProfileView.swift                   # UI for displaying a user’s profile, including their threads, followers, and other personal information
├── ContentView.swift                   # A general-purpose content view that integrates various sections of the app, possibly serving as a container for other views
├── ContentViewModel.swift              # Manages the data and logic for the ContentView, coordinating different sections and content flows
├── TabView.swift                       # Defines the main tab navigation structure of the app, allowing users to switch between different sections like the feed, explore, and profile
├── ThreadDetailsView.swift             # Displays the details of a thread, including content and associated replies
├── ThreadDetailsViewModel.swift        # Manages the logic for displaying and interacting with thread details and replies
├── ThreadReply.swift                   # Model representing a reply to a thread, capturing details such as content, author, and timestamp
├── ThreadReplyService.swift            # Handles backend interactions for thread replies, including fetching, posting, and possibly deleting replies
├── ThreadReplyViewModel.swift          # Manages the logic for creating and displaying replies within a thread, interacting with the ThreadReplyService
├── ThreadReplyCell.swift               # UI component for displaying a single reply within a thread, showing reply content and user information
├── ThreadReplyView.swift               # UI for displaying and composing replies to a thread, integrating with the ThreadReplyViewModel
├── PreviewProvider.swift               # Provides preview data for SwiftUI views, aiding in the development and testing process
├── String.swift                        # Contains extensions or utilities related to the String class, providing additional functionality for string operations
├── Timestamp.swift                     # Manages timestamp formatting and utilities, handling the display and manipulation of dates and times
├── GoogleService-Info.plist            # Configuration file for Firebase services, used to integrate Firebase into the app for backend support
├── Thread.swift                        # Defines the model for a thread, capturing details like content, author, creation date, and metadata
├── User.swift                          # Defines the model for a user, including attributes like ID, name, profile picture, and other personal information
├── ImageUploader.swift                 # Handles the logic for uploading images, such as profile pictures or post attachments
├── ThreadService.swift                 # Manages backend interactions related to threads, including creation, fetching, updating, and deleting threads
├── UserService.swift                   # Handles backend interactions related to users, including fetching profiles, updating user data, and managing other user-related operations
├── Constants.swift                     # Defines application-wide constants, such as API endpoints, keys, and configuration values
├── ButtonModifiers.swift               # Contains custom modifiers for styling buttons throughout the app, ensuring consistent UI/UX
└── TextFieldModifiers.swift            # Contains custom modifiers for styling text fields, promoting consistent design and behavior across the app

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments
Inspired by the Threads app.
Built with SwiftUI and Firebase.
