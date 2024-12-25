# Lanyard

Lanyard is a Swift library to handle various tasks involved in OAuth
authorization.

## Motivation

Current OAuth implementations for Swift
([AppAuth](https://github.com/openid/AppAuth-iOS) and
[OAuthSwift](https://github.com/OAuthSwift/OAuthSwift) are some I've looked at)
don't seem to work in a way that's ergonomic with modern Swift.

For example, AppAuth doesn't support modern Swift concurrency features
(`async`/`await`) in a large portion of their networking calls. Instead, I found
myself in [callback hell](https://callbackhell.com) quite a bit.

Similarly, OAuthSwift seems to prefer callbacks to `async`. This could be a
misunderstanding on my part: there wasn't a documentation page that I could find
from their GitHub repository, so I briefly skimmed their code to make this
determination. Additionally, at first glance this library doesn't seem like it
would work well with SwiftUI's `WebAuthenticationSession`: you're locked in to
their way of handling web-based authentication with the system browser and
custom URL schemes.

This library aims to provide an idiomatic authentication experience for modern
Swift.

## Features

* Concurrency (`async`) support

## License

This library is licensed under the MIT license.
