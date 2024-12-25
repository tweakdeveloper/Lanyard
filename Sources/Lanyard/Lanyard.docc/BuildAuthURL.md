# ``Lanyard/Lanyard/buildAuthorizationURL(withAuthorizationEndpoint:responseType:clientID:redirectURL:scopes:state:)``

## OAuth response types

The OAuth specification provides several flows that can be used to obtain
credentials
(called "[authorization grants](https://datatracker.ietf.org/doc/html/rfc6749#section-1.3)")
to interact with an API. Which response type you will need to use can usually be
found in the API's documentation.

## Redirect URLs

After the sign-in page is displayed to the user, the OAuth provider will
redirect the browser to the _redirect URL_. The redirect URL will be appended
with the results of the authorization attempt in the form of query parameters.

Whether or not you will need to provide a redirect URL depends on the API
provider's OAuth implementation. Certain providers allow you to specify a
default redirect URL.

The redirect URL itself can vary in format. In the case of SwiftUI's
`WebAuthenticationSession`, one of the available options is specifying a custom
URL scheme. If you choose to use this option, the redirect URL could be
something like `lanyard://...`. You would then give `lanyard` as the custom
scheme when you attempt authentication with the `WebAuthenticationSession`.
