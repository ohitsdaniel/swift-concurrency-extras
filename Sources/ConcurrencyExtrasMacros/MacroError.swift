import SwiftDiagnostics

public enum MacroError: Error, CustomStringConvertible, DiagnosticMessage {
  case message(String)

  public var description: String {
    switch self {
    case .message(let text):
      return text
    }
  }
  
  public var message: String {
    switch self {
    case .message(let text):
      return text
    }
  }
  
  public var diagnosticID: SwiftDiagnostics.MessageID {
    switch self {
    case .message(let text):
      return .init(
        domain: "ConcurrencyExtrasMacros",
        id: ".message(\(text))"
      )
    }
  }
  
  public var severity: SwiftDiagnostics.DiagnosticSeverity { .error }
}
