import Foundation
import Testing

@testable import Lanyard

@Suite("Auth URL builder tests") struct AuthURLBuilderTests {
  @Test("Builds a valid URL") func buildAuthURLWorks() {
    let sampleAuthURL = Lanyard.buildAuthorizationURL(
      withAuthorizationEndpoint: "https://example.org/auth",
      responseType: .code,
      clientID: "test"
    )

    #expect(sampleAuthURL != nil)

    let sampleURLComponents = URLComponents(
      url: sampleAuthURL!,
      resolvingAgainstBaseURL: false
    )!

    #expect(
      sampleURLComponents.queryItems!.contains(where: { $0.name == "client_id" })
    )
    #expect(
      sampleURLComponents.queryItems!.contains(where: {
        $0.name == "response_type" && $0.value == "code"
      })
    )
  }

  @Test("Includes redirect URL when provided") func includesRedirectURL() {
    let sampleAuthURL = Lanyard.buildAuthorizationURL(
      withAuthorizationEndpoint: "https://example.org/auth",
      responseType: .code,
      clientID: "test",
      redirectURL: "lanyard://auth_result"
    )!

    let sampleURLComponents = URLComponents(
      url: sampleAuthURL,
      resolvingAgainstBaseURL: false
    )!

    #expect(
      sampleURLComponents.queryItems!.contains(where: { $0.name == "redirect_uri" })
    )
  }

  @Test("Includes state when provided") func includesState() {
    let sampleAuthURL = Lanyard.buildAuthorizationURL(
      withAuthorizationEndpoint: "https://example.org/auth",
      responseType: .code,
      clientID: "test",
      state: "sample_state"
    )!

    let sampleURLComponents = URLComponents(
      url: sampleAuthURL,
      resolvingAgainstBaseURL: false
    )!

    #expect(sampleURLComponents.queryItems!.contains(where: { $0.name == "state" }))
  }

  @Test("Includes scopes when provided") func includesScope() {
    let sampleAuthURL = Lanyard.buildAuthorizationURL(
      withAuthorizationEndpoint: "https://example.org/auth",
      responseType: .code,
      clientID: "test",
      scopes: ["sample", "scopes"]
    )!

    let sampleURLComponents = URLComponents(
      url: sampleAuthURL,
      resolvingAgainstBaseURL: false
    )!

    let scopeItem = sampleURLComponents.queryItems?.first(where: {
      $0.name == "scope"
    })

    #expect(scopeItem != nil)
    #expect(scopeItem!.value == "sample scopes")
  }
}
