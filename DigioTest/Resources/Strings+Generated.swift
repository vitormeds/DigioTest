// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum DigioTestStrings {
  internal enum Animations {
    /// Localizable.strings
    ///   DigioTest
    /// 
    ///   Created by Vitor Mendes on 31/07/23.
    internal static let loading = DigioTestStrings.tr("Localizable", "Animations.loading", fallback: "loading")
  }
  internal enum Cash {
    /// digio Cash
    internal static let title = DigioTestStrings.tr("Localizable", "Cash.title", fallback: "digio Cash")
    /// Cash
    internal static let titleCashColor = DigioTestStrings.tr("Localizable", "Cash.titleCashColor", fallback: "Cash")
    /// Digio
    internal static let titleDigioColor = DigioTestStrings.tr("Localizable", "Cash.titleDigioColor", fallback: "Digio")
  }
  internal enum CustomModal {
    /// Recarregar
    internal static let buttonTitle = DigioTestStrings.tr("Localizable", "CustomModal.buttonTitle", fallback: "Recarregar")
    /// Ocorreu um erro de rede por favor tente novamente mais tarde
    internal static let errorDescription = DigioTestStrings.tr("Localizable", "CustomModal.errorDescription", fallback: "Ocorreu um erro de rede por favor tente novamente mais tarde")
    /// Ocorreu um erro inesperado
    internal static let errorTitle = DigioTestStrings.tr("Localizable", "CustomModal.errorTitle", fallback: "Ocorreu um erro inesperado")
  }
  internal enum Header {
    /// Olá, %@
    internal static func title(_ p1: Any) -> String {
      return DigioTestStrings.tr("Localizable", "Header.title", String(describing: p1), fallback: "Olá, %@")
    }
  }
  internal enum Utils {
    /// Voltar
    internal static let back = DigioTestStrings.tr("Localizable", "Utils.back", fallback: "Voltar")
    /// https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products/
    internal static let homeApi = DigioTestStrings.tr("Localizable", "Utils.homeApi", fallback: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products/")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension DigioTestStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
