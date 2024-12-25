import Foundation

/// A helper class to contain various utilities. The `class func`s you see on
/// the landing page will be in this class. For example,
/// `Lanyard.buildAuthorizationURL(...)`.
public class Lanyard {
  /// Creates an authorization URL given a base endpoint and response type.
  ///
  /// - Parameters:
  ///   - authEndpoint: The base endpoint to append the OAuth
  ///     parameters to.
  ///   - responseType: The response type (`.code` for a token-exchange flow or
  ///     `.token` for an implicit flow).
  ///   - clientID: The client ID that the API provider created for you when you
  ///     registered your OAuth application.
  ///   - redirectURL: The URL the API provider should redirect to with the
  ///     result of the authentication request. It can be omitted if it's not
  ///     required by the API provider.
  ///   - scopes: The string values of the scopes that you want permission from
  ///     the API provider to access. These can be omitted if the API provider
  ///     doesn't require them (because it provides some default scopes, for
  ///     example).
  ///   - state: The `state` value you want the API provider to return in their
  ///     response. It can be omitted, but it is *strongly* recommended to
  ///     include a `state` value for security reasons.
  ///
  /// - Returns: The completed authorization URL. This can be passed directly to
  ///   a `WebAuthenticationSession`, for example. If the base endpoint that was
  ///   passed in wasn't a valid URL, this function will return `nil`.
  public class func buildAuthorizationURL(
    withAuthorizationEndpoint authEndpoint: String,
    responseType: LanyardResponseType,
    clientID: String,
    redirectURL: String? = nil,
    scopes: [String]? = nil,
    state: String? = nil
  ) -> URL? {
    guard var authEndpointComponents = URLComponents(string: authEndpoint) else {
      return nil
    }

    var authQueryItems = authEndpointComponents.queryItems ?? []

    authQueryItems.append(
      URLQueryItem(name: "response_type", value: responseType.rawValue)
    )
    authQueryItems.append(URLQueryItem(name: "client_id", value: clientID))

    if let redirectURL = redirectURL {
      authQueryItems.append(URLQueryItem(name: "redirect_uri", value: redirectURL))
    }

    if let scopes = scopes {
      authQueryItems.append(
        URLQueryItem(name: "scope", value: scopes.joined(separator: " "))
      )
    }

    if let state = state {
      authQueryItems.append(URLQueryItem(name: "state", value: state))
    }

    authEndpointComponents.queryItems = authQueryItems
    return authEndpointComponents.url
  }
}
