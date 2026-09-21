# SensiAuraKeys

Biblioteca Swift para una app iOS propia. Proporciona inicialización de KeyAuth, login por licencia, fecha de expiración, estado de licencia y cierre de sesión.

## Configuración incluida

- **Name:** `Dylanbrandonsmith123's Application`
- **OwnerID:** `MQqz402Fyv`
- **Version:** `1.0`
- **API:** `https://keyauth.win/api/1.3/`

## Uso

```swift
import SensiAuraKeys

let keys = SensiAuraKeys()

Task {
    do {
        try await keys.initialize()
        let license = try await keys.login(withLicense: keyFromUser)
        print("Válida hasta: \(license.expiry?.description ?? "sin expiración")")
    } catch {
        print(error.localizedDescription)
    }
}
```

`SensiAuraKeys` es un `actor`, por lo que sus métodos asíncronos se llaman con `await`. Los métodos disponibles son `initialize()`, `login(withLicense:)`, `isLicenseValid()`, `expirationDate()`, `activeLicense()` y `logout()`.

## Compilar como `.dylib`

La compilación final de una biblioteca iOS requiere macOS, Xcode y la firma correspondiente. En macOS, desde la raíz del paquete:

```bash
swift package generate-xcodeproj
xcodebuild -scheme SensiAuraKeys \
  -destination 'generic/platform=iOS' \
  -configuration Release build
```

Para distribución entre arquitecturas y simulador, es preferible crear un `XCFramework` desde Xcode. El paquete declara el producto como biblioteca dinámica (`type: .dynamic`), por lo que Xcode puede producir el binario dinámico para la plataforma seleccionada.

## Nota de seguridad

El código está pensado para integrarse en una app propia. No incluye inyección, modificación de otras aplicaciones ni bypass de licencias. En producción, considera un backend intermedio para no exponer secretos administrativos. El OwnerID de KeyAuth debe ser exactamente el valor válido de 10 caracteres que proporciona tu aplicación.

