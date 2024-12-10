### **1. Einstiegspunkt und Hauptstruktur**
1. **Einstiegspunkt analysieren (`main.dart`):**
  **[ ]** Finde die `main`-Funktion.
  **[ ]** Identifiziere das Haupt-Widget der App (z. B. `MaterialApp` oder `CupertinoApp`).
  **[ ]** Überprüfe die Navigation:
     - Welche Route oder welches Widget wird als `home` gestartet?
     - Gibt es ein `onGenerateRoute` oder `routes`-Mapping?

1. **Globale Konfiguration:**
   - **[ ]** Schaue, ob globale Provider, States oder Services initialisiert werden (z. B. `Provider`, `GetIt` oder ähnliche Pakete).
   - **[ ]** Überprüfe die Lokalisierung:
     - Ist Lokalisierung (`l10n`) aktiv?
     - Welche Sprachen werden unterstützt?

2. **Theme und Design:**
   - **[ ]** Schaue, wie das Theme konfiguriert ist (`ThemeData`).
   - **[ ]** Gibt es ein spezielles Design-System (z. B. eigene Widgets oder Farbschemata)?

---

### **2. Allgemeine Funktionen (`common/`)**
1. **Utilities und Hilfsklassen:**
   - **[ ]** Welche Helper-Dateien oder Utilities sind vorhanden (z. B. für Datum, Formatierung, etc.)?
   - **[ ]** Sind allgemein wiederverwendbare Widgets enthalten? Falls ja, welche?

2. **Gemeinsame State-Management-Lösungen:**
   - **[ ]** Gibt es zentrale State-Management-Tools (z. B. `Provider`, `Bloc`)?
   - **[ ]** Wie werden globale Events und Daten gehandhabt?

---

### **3. Module und Features**
Analysiere die Module in `lib/`. Gehe jedes Modul durch:

1. **Modulübersicht:**
   - **[ ]** Welche Dateien oder Widgets gehören zum Modul?
   - **[ ]** Gibt es spezifische Logik, die das Modul definiert (z. B. State-Management, Controller)?

2. **Modul-spezifische Funktionen:**
   - **[ ]** Wie wird die Navigation zwischen Modulen gehandhabt?
   - **[ ]** Welche Abhängigkeiten hat das Modul (z. B. API-Calls, Datenbanken)?

Beispiele:
- **Coiffeur (`coiffeur/`):**
  - **[ ]** Was ist die Hauptlogik dieses Moduls?
  - **[ ]** Gibt es spezifische Widgets oder Datenstrukturen?
- **Schieber (`schieber/`):**
  - **[ ]** Wie interagiert dieses Modul mit anderen Teilen der App?

---

### **4. Lokalisierung (`l10n/`)**
1. **Sprachen und Lokalisierung:**
   - **[ ]** Wie werden Übersetzungen geladen (z. B. `.arb`-Dateien)?
   - **[ ]** Welche Schlüsselwörter werden in der App verwendet, um Übersetzungen abzurufen?

---

### **5. Tests**
1. **Integrationstests:**
   - **[ ]** Was wird in den Tests geprüft? (z. B. Logik, UI-Interaktionen).
   - **[ ]** Gibt es Mock-Daten oder spezifische Testfälle?

2. **Unit-Tests:**
   - **[ ]** Welche Funktionen und Widgets werden in den Unit-Tests abgedeckt?
   - **[ ]** Wie sind die Tests organisiert (z. B. nach Modulen)?

---

### **6. Ressourcen und Assets**
1. **Analyse der Ressourcen:**
   - **[ ]** Welche Arten von Assets werden genutzt (z. B. Bilder, Icons)?
   - **[ ]** Wie und wo werden sie eingebunden?

2. **Plattform-spezifische Assets:**
   - **[ ]** Gibt es spezielle Ressourcen für Android/iOS/Web (z. B. Icons, Splash-Screens)?

---

### **7. Daten und externe Abhängigkeiten**
1. **API-Integration:**
   - **[ ]** Werden externe APIs genutzt? Falls ja:
     - Welche APIs?
     - Wie wird die Kommunikation abgewickelt (z. B. `http`, `dio`)?

2. **Datenmanagement:**
   - **[ ]** Gibt es lokale Datenbanken oder Speicher (z. B. `sqflite`, `shared_preferences`)?
   - **[ ]** Wie werden Daten gelesen, geschrieben und synchronisiert?

---

### **8. Plattform-spezifischer Code**
1. **Android:**
   - **[ ]** Gibt es plattformspezifische Features in `android/` (z. B. Benachrichtigungen, Services)?
   - **[ ]** Welche Konfigurationen werden in `AndroidManifest.xml` vorgenommen?

2. **iOS:**
   - **[ ]** Wie ist die iOS-spezifische Konfiguration in `ios/` organisiert?

3. **Web:**
   - **[ ]** Welche Anpassungen gibt es für die Web-Version in `web/`?

---

### **9. Build- und Deployment-Prozesse**
1. **Build-Prozesse:**
   - **[ ]** Wie wird die App gebaut (z. B. `flutter build apk`, `flutter build web`)?
   - **[ ]** Gibt es spezielle Konfigurationsdateien wie `build.yaml`?

2. **Fastlane und Deployment:**
   - **[ ]** Welche Informationen sind in `fastlane/` gespeichert?
   - **[ ]** Gibt es Automatisierungen für die Veröffentlichung der App?

---

### **10. Zusätzliche Tools und Konfigurationen**
1. **`pubspec.yaml`:**
   - **[ ]** Welche Abhängigkeiten werden verwendet?
   - **[ ]** Gibt es relevante `dev_dependencies` (z. B. für Tests, Builds)?

2. **Code-Analyse:**
   - **[ ]** Welche Regeln sind in `analysis_options.yaml` definiert?
   - **[ ]** Gibt es automatisierte Linter oder Formatierer?

---

### **11. Dokumentation**
1. **README.md:**
   - **[ ]** Gibt es eine Beschreibung der App?
   - **[ ]** Wurden Anweisungen für die Installation oder Nutzung bereitgestellt?

2. **Interne Dokumentation:**
   - **[ ]** Gibt es Code-Kommentare, die spezifische Logik erklären?
