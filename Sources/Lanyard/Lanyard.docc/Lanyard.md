# ``Lanyard``

Ergonomic OAuth handling for modern Swift.

Current OAuth helper libraries for Swift don't take advantage of modern advances
in Swift. For example, support for the `async`/`await` keywords isn't built in.
Most of these frameworks also inadvertantly make it difficult to interface with
SwiftUI's `WebAuthenticationSession` in their efforts to make streamline OAuth
flows. Lanyard aims to fix these issues.

## Topics

### Library-level helpers

- ``Lanyard``

### Setting up the OAuth flow

- ``Lanyard/buildAuthorizationURL(withAuthorizationEndpoint:responseType:clientID:redirectURL:scopes:state:)``
- ``LanyardResponseType``
