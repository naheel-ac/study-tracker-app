why using authWrapper
already logged user
App Launch → AuthLoading → AuthAuthenticated → BtmNavBar
↓ ↓ ↓ ↓
Start      "Checking..."   "User exists!"   Go to main app

new user
App Launch → AuthLoading → AuthUnauthenticated → SignInScreen
↓ ↓ ↓ ↓
Start      "Checking..."   "No user found"    Show login page