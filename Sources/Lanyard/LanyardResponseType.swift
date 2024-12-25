/// The response type for the initial authorization request.
public enum LanyardResponseType: String {
  /// The response type for a token exchange flow.
  case code = "code"
  /// The response type for an implicit flow.
  case token = "token"
}
