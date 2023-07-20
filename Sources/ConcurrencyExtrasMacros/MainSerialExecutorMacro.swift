import SwiftSyntax
import SwiftSyntaxMacros
import SwiftDiagnostics

public struct MainSerialExecutorMacro: MemberMacro {
  public static func expansion(
    of node: AttributeSyntax,
    providingMembersOf declaration: some DeclGroupSyntax,
    in context: some MacroExpansionContext
  ) throws -> [DeclSyntax] {
    // Can only be applied to functions at the moment
    guard let funcDecl = declaration.as(FunctionDeclSyntax.self) else {
      let functionError = Diagnostic(
        node: node._syntaxNode,
        message: MacroError.message("@withMainSerialExecutor only works on functions")
      )
      context.diagnose(functionError)
      return []
    }
    
    guard funcDecl.signature.effectSpecifiers?.asyncSpecifier != nil else {
      throw MacroError.message(
        "@withMainSerialExecutor requires an async function"
      )
    }
    
    dump(funcDecl)
    
    return [
    ]
  }
}

