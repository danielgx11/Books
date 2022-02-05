// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Login {
    public enum Button {
      /// Entrar
      public static let signIn = L10n.tr("Localizable", "Login.Button.signIn")
    }
    public enum Footer {
      public enum Label {
        /// Digite seus dados para continuar.
        public static let title = L10n.tr("Localizable", "Login.Footer.Label.title")
      }
    }
    public enum Header {
      public enum Label {
        /// Boas vindas,\nVocê está no Books.
        public static let title = L10n.tr("Localizable", "Login.Header.Label.title")
      }
    }
    public enum Placeholder {
      /// E-mail
      public static let email = L10n.tr("Localizable", "Login.Placeholder.email")
      /// Password
      public static let password = L10n.tr("Localizable", "Login.Placeholder.password")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
