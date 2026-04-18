// Grimoire [ C++ ] { Qt6, Linux, QsciScintilla }
// ... this file is just a cheat sheet for C++, Qt6 and QsciScintilla development.
// -- BEGIN 

// Template
/* Inventory [ ] { C++ } */

// =================================================================================
// Runomancy : basics

/* Inventory [ Using and Namespace ] { C++ } 
 * namespace Name { ... }; // Defines a scope to prevent name collisions between code blocks.
 * using namespace Name; // Brings all members of a namespace into the current scope (use sparingly).
 * using Name::Member; // Brings a specific member into the scope (cleaner alternative to the above).
 * namespace New = Old::Nested; // Namespace Aliasing: Creates a shorter nickname for long namespaces.
 * using NewType = OldType; // Type Aliasing: Modern C++ replacement for typedef; improves readability.
 * ::Member; // Global Scope Resolution: Accesses a name defined in the global (root) namespace.
 * namespace { ... }; // Anonymous Namespace: Limits variables/functions to the current file only (internal linkage).
 * inline namespace Name { ... }; // Versioning: Members are treated as if they belong to the parent namespace.
 * */

/* Inventory [ CMake ] { C++, Linux } 
 * cmake_minimum_required();    // Sets the lowest CMake version allowed
 * project(Name);               // Defines project name and programming language
 * find_package(Qt6 REQUIRED);  // Locates and loads Qt6 library configuration
 * set(CMAKE_AUTOMOC ON);       // Automatically generates Qt Meta-Object code
 * add_executable(bin main.cpp);// Compiles source files into a runnable binary
 * target_link_libraries();     // Connects external libraries (like Qt) to binary
 * cmake -B build               // Configures the project into a 'build' directory
 * cmake --build build          // Executes the compilation process
 * */
/* Inventory [ CMake Dependency Analysis ] { Shell } 
 * COMMAND // SHORTDESCRIPTION 
 * // -- Built-in Graphing --
 * cmake --graphviz=out.dot . ; // Generate Graphviz dot files for the project
 * // -- Conversion --
 * dot -Tpdf out.dot -o deps.pdf; // Convert dot file to PDF (requires graphviz package)
 * // -- External Tools --
 * cmake-format; // Formats CMakeLists.txt (pip install cmake-format)
 * cmake-gui; // Visual interface to see variables and linked dependencies
 * // -- Inspection --
 * cmake --system-information; // Dump all internal variables and include paths
 * ldd [binary]; // Linux tool to see shared library dependencies at runtime
 * */

/* Inventory [ std::function ] { C++ } 
 * SYNTAX // SHORTDESCRIPTION 
 * #include <functional> // Header required to use std::function
 * // -- Declaration & Basics --
 * std::function<return_type(arg_types)> name; // Declares a polymorphic function wrapper
 * std::function<void(int)> func = nullptr; // Initialize as empty/null
 * if (func) { func(10); } // Safe check: operator bool() returns true if callable is stored
 * // -- Assignments --
 * func = myRegularFunction; // Wrap a standard function pointer
 * func = [](int x) {  }; // Wrap a lambda expression (closure)
 * func = std::bind(&Class::Method, &obj, _1); // Wrap a class member function using bind
 * func = MyFunctor(); // Wrap a class that implements operator()
 * // -- Advanced Operations --
 * func.target<T>(); // Access the underlying function pointer or object of type T
 * func.target_type(); // Returns typeid information of the stored callable
 * func = {}; // Clears the function wrapper (assigns empty state)
 * std::invoke(func, args...); // Invoke the function wrapper using standard utility
 * */

// =================================================================================
// Incantation : Graphical User Interface 
// Incantation || Qt6 Framework 

// -- basic 
/* Inventory [ Qt Framework ] { C++, Linux } 
 * QApplication app(argc, argv); // Manages GUI application control flow and settings
 * QPushButton button("Text");   // Creates a clickable push button widget
 * widget.show();               // Schedules the widget for display on screen
 * return app.exec();           // Enters the main event loop to handle user input
 * #include <QWidgets>          // Header for standard desktop UI elements
 * QObject::connect();          // Mechanism to link signals (events) to slots (logic)
 * */
/* Inventory [ Common Qt Libraries ] { C++, Linux, Qt Framework } 
 * QtCore      // Core non-GUI logic: event loops, signals/slots, file I/O, containers
 * QtGui       // Low-level GUI: windows, events, images, fonts, OpenGL integration
 * QtWidgets   // Classic desktop UI: buttons, layouts, dialogs, complex widgets
 * QtNetwork   // Networking: TCP/UDP sockets, HTTP clients, SSL/TLS management
 * QtSql       // Database integration: SQL drivers, query execution, model/view
 * QtMultimedia// Multimedia: audio/video playback, recording, camera control
 * QtQuick     // Modern UI: declarative QML engine and high-level UI components
 * QtSvg       // Vector graphics: classes for rendering and displaying SVG files
 * */
/* Inventory [ Widget Hierarchy ] { C++, Qt6 } 
 * parentWidget(); // Returns the immediate QWidget parent.
 * parent(); // Returns the QObject parent (may need casting to QWidget).
 * window(); // Returns the top-level window containing this widget.
 * nativeParentWidget(); // Returns the next ancestor that has a system window handle.
 * isAncestorOf(child); // Returns true if this widget is a parent/grandparent of child.
 * findAncestor<T>(); // (Logic pattern) Recursively searches up for type T.
 * */
/* Inventory [ Widget ] { C++, qt6 } 
 * setObjectName() //
 * objectName() // 
 * */

// -- strings
/* Inventory [ QString ] { C++, Linux, Qt6 } 
 * QString str = "text"; // Implicitly converts a C-string (UTF-8) to a UTF-16 Unicode string.
 * bool isEmpty(); // Returns true if the string has no characters (length 0).
 * bool isNull(); // Returns true if the string is uninitialized (no data pointer).
 * int length() / int size(); // Returns the number of characters in the string.
 * QString arg(value); // Replaces numbered placeholders (e.g., %1) with formatted variables.
 * bool contains(QString sub); // Checks if a substring exists within the string.
 * QString section(sep, start, end); // Extracts a portion of the string based on a separator.
 * QString split(sep); // Breaks the string into a QStringList based on a delimiter.
 * void append(QString) / +=; // Appends data to the end of the current string.
 * QString trimmed(); // Returns a copy with leading and trailing whitespace removed.
 * QString toUpper() / toLower(); // Returns the string in all uppercase or lowercase.
 * QByteArray toUtf8(); // Converts the Unicode string to a UTF-8 encoded byte array.
 * static QString number(val); // Static method to convert numeric types into a string.
 * const QChar at(int i); // Returns the character at a specific index (read-only).
 * endsWith(const QString &s, Qt::CaseSensitivity cs = Qt::CaseSensitive) const // ... 
 * startsWith(const QString &s, Qt::CaseSensitivity cs = Qt::CaseSensitive) const // ... 
 * */
/* Inventory [ QString Comparison ] { C++, Linux, Qt6 } 
 * str1 == str2; // Case-sensitive comparison using overloaded operator.
 * str1.compare(str2, Qt::CaseInsensitive); // Returns 0 if equal; allows toggling case sensitivity.
 * str1.localeAwareCompare(str2); // Compares strings based on local Linux system language rules.
 * str1.startsWith(prefix, cs); // Checks if string begins with a specific sequence.
 * str1.endsWith(suffix, cs); // Checks if string ends with a specific sequence.
 * QString::compare(s1, s2, cs) == 0; // Static method version for clean logic checks.
 * */
/* Inventory [ QTextStream ] { C++, Linux, Qt6 } 
 * QTextStream(QIODevice *device); // Wraps a QFile to handle character encoding and text formatting.
 * << operator; // Overloaded operator to write strings, ints, or floats directly to the stream.
 * >> operator; // Overloaded operator to read whitespace-separated tokens into variables.
 * QString readLine(); // Reads one line of text, excluding the newline character.
 * void setEncoding(QStringConverter::Encoding); // Defines codec (e.g., UTF-8) for cross-platform compatibility.
 * void flush(); // Forces any buffered data to be written to the underlying QFile.
 * bool atEnd(); // Returns true if there is no more data to be read from the stream.
 * */

// -- collections
/* Inventory [ String Set ] { Qt6, C++, QSet }
1. QSet<QString> mySet; // Declaration
2. mySet.insert("myString"); // Add a string to the set
3. bool exists = mySet.contains("myString"); // Check if string exists (High performance)
4. mySet.remove("myString"); // Remove an item
5. mySet << "string1" << "string2"; // Stream operator for batch insertion
6. int count = mySet.size(); // Get number of unique strings
7. mySet.clear(); // Empty the set
*/
/* Inventory [ QSet Initialization ] { Qt6, C++, QSet }
1. QSet<QString> s1 = {"a", "b", "c"}; // Initializer list (Most common)
2. QSet<QString> s2({"a", "b", "c"}); // Constructor with initializer list
3. QSet<QString> s3 = QSet<QString>::fromList(myStringList); // Deprecated in Qt6, use below instead
4. QSet<QString> s4(myList.begin(), myList.end()); // Iterator-based (Convert from QList/std::vector)
5. QSet<QString> s5; s5.reserve(100); // Empty initialization with memory optimization
*/

// -- layout and frame containers
/* Inventory [ qApp->setStyleSheet ] { C++, Linux, Qt Framework } 
 * QWidget { ... }           // Targets all widgets; use for global background/fonts
 * QPushButton { ... }       // Targets specific class types (and their subclasses)
 * #objectName { ... }       // ID Selector: targets a specific unique widget name
 * .ClassName { ... }        // Class Selector: targets instances of exact class only
 * :hover / :pressed         // Pseudo-states for interactive visual feedback
 * background-color: #hex;   // Sets the primary surface color of the widget
 * border: 1px solid color;  // Defines thickness, style, and color of boundaries
 * color: rgb(r, g, b);      // Sets the foreground color (usually the text)
 * border-radius: 5px;       // Rounds the corners of the widget box model
 * selection-background-color;// Color of highlighted text or selected items
 * */
/* Inventory [ Qt Layouts ] { C++, Linux, Qt Framework } 
 * QVBoxLayout         // Arranges widgets in a vertical stack
 * QHBoxLayout         // Arranges widgets in a horizontal line
 * QGridLayout         // Arranges widgets in rows and columns
 * layout->addWidget() // Adds a widget to the layout's control
 * layout->addStretch()// Adds empty space to push widgets to one side
 * widget->setLayout() // Assigns the layout manager to a container widget
 * */
/* Inventory [ QSplitter ] { C++, Linux, Qt Framework } 
 * QSplitter(Qt::Horizontal) // Creates a side-by-side draggable layout
 * QSplitter(Qt::Vertical)   // Creates a top-and-bottom draggable layout
 * splitter->addWidget(w);   // Inserts a widget into the split sequence
 * splitter->setSizes(list); // Sets the pixel ratio for the internal widgets
 * splitter->setCollapsible(i, false); // Prevents a widget from being hidden
 * QSplitter::handle         // QSS selector to style the draggable divider
 * */
/* Inventory [ QSettings ] { C++, Linux, Qt6 } 
 * QSettings(Organization, Application); // Constructor to manage persistent app settings in ~/.config.
 * void setValue(const QString &key, const QVariant &value); // Saves a setting; handles types automatically.
 * QVariant value(const QString &key, defaultValue); // Retrieves a setting; returns default if key missing.
 * void sync(); // Explicitly writes changes to permanent storage (usually handled automatically on destruction).
 * QStringList allKeys(); // Returns a list of all setting keys currently stored in the file.
 * void beginGroup(const QString &prefix); // Prefixes all subsequent keys to organize settings into sections.
 * void endGroup(); // Resets the key prefixing started by beginGroup().
 * */

// -- dialogs
/* Inventory [ QFile ] { C++, Linux, Qt6 } 
 * QFile file(QString name); // Constructor to initialize with a specific file path.
 * bool open(OpenMode mode); // Opens file using flags like QIODevice::ReadOnly or QIODevice::WriteOnly.
 * qint64 write(const QByteArray &data); // Writes raw binary data to the device.
 * QByteArray readAll(); // Reads all remaining data from the file into memory.
 * void close(); // Flushes buffers and closes the file handle.
 * bool exists(); // Returns true if the file physically exists on the Linux filesystem.
 * bool remove(); // Deletes the file specified by the current name.
 * */
/* Inventory [ QFileDialog ] { C++, Linux, Qt6 } 
 * QString getOpenFileName(QWidget *parent, ...); // Static call to get a single existing file path string.
 * QString getSaveFileName(QWidget *parent, ...); // Static call to get a destination path for saving a file.
 * QStringList getOpenFileNames(...); // Allows the user to select multiple files for batch processing.
 * QString getExistingDirectory(...); // Modal dialog for selecting a folder/directory rather than a file.
 * void setNameFilter(QString filter); // Limits visible files (e.g., "Images (*.png *.jpg);;Text (*.txt)").
 * void setDirectory(QString dir); // Sets the initial folder displayed when the dialog opens.
 * */
/* Inventory [ QJsonDocument ] { C++, Linux, Qt6 } 
 * static QJsonDocument fromJson(const QByteArray &json); // Parses raw JSON text into a document object.
 * QByteArray toJson(); // Converts the document object into a formatted or compact JSON byte array.
 * void setArray(const QJsonArray &array); // Sets a JSON array as the main content of the document.
 * void setObject(const QJsonObject &object); // Sets a JSON object (key-value pairs) as the main content.
 * bool isObject() / bool isArray(); // Validation checks to determine the root data structure type.
 * QJsonObject object(); // Returns the root QJsonObject for manipulation of keys and values.
 * static QJsonDocument fromVariant(const QVariant &variant); // Converts a Qt container (like QMap) to JSON.
 * */
/* Inventory [ QMessageBox ] { C++, Linux, Qt6 } 
 * QMessageBox::information(parent, title, text); // Standard blue "i" icon dialog.
 * QMessageBox::warning(parent, title, text); // Standard yellow "!" icon dialog.
 * QMessageBox::critical(parent, title, text); // Standard red "X" icon dialog.
 * QMessageBox::question(parent, title, text, buttons); // Dialog with Yes/No/Cancel options.
 * msgBox.setDetailedText("string"); // Adds a "Show Details..." button with a text area.
 * msgBox.setStyleSheet("color: white;"); // Essential for visibility if using dark themes on Linux.
 * */
/* Inventory [ QInputDialog ] { C++, Qt6 } 
 * getText(); // Static: Prompts for a string. Returns QString.
 * getInt(); // Static: Prompts for an integer within a range. Returns int.
 * getDouble(); // Static: Prompts for a decimal number. Returns double.
 * getItem(); // Static: Prompts for a selection from a QStringList (combobox).
 * getMultiLineText(); // Static: Prompts for a block of text (QTextEdit style).
 * setOkButtonText(QString); // Customizes the 'OK' label.
 * setCancelButtonText(QString); // Customizes the 'Cancel' label.
 * // Note: Use the static methods for simple tasks; instantiate for advanced config.
 * */

// -- image
/* Inventory [ QImage ] { C++, Linux, Qt6 } 
 * QImage(const QString &fileName); // Loads an image file optimized for direct pixel access and manipulation.
 * bool load(const QString &fileName); // Attempts to load an image; returns false if format is unsupported.
 * bool save(const QString &fileName); // Saves the image; format is inferred from the file extension.
 * QImage scaled(int w, int h, AspectRatioMode); // Returns a resized copy of the image.
 * QRgb pixel(int x, int y); // Retrieves the color value of a specific pixel (hardware independent).
 * void setPixel(int x, int y, uint index_or_rgb); // Modifies the color value of a specific pixel.
 * int width() / int height(); // Returns the dimensions of the image in pixels.
 * */
/* Inventory [ QPixmap ] { C++, Linux, Qt6 } 
 * QPixmap(const QString &fileName); // Loads an image optimized for display on screen (off-screen stored in GPU).
 * bool load(const QString &fileName); // Loads the pixmap; typically faster for UI rendering than QImage.
 * bool save(const QString &fileName); // Exports the pixmap to a file.
 * static QPixmap fromImage(const QImage &image); // Converts a QImage (pixel data) to a QPixmap (display data).
 * QImage toImage(); // Converts a QPixmap back to a QImage for pixel-level editing.
 * void fill(const QColor &color); // Fills the entire pixmap area with a solid color.
 * int devicePixelRatio(); // Returns the scale factor (important for high-DPI/Retina displays on Linux).
 * */

// -- tabs
/* Inventory [ QTabWidget ] { C++, Qt6 } 
 * addTab(QWidget*, QString); // Appends a new tab with label.
 * insertTab(int, QWidget*, QString); // Inserts a tab at a specific index.
 * removeTab(int); // Removes tab at index (does not delete the widget).
 * setCurrentIndex(int); // Programmatically switches to a specific tab.
 * currentIndex(); // Returns the index of the currently visible tab.
 * currentWidget(); // Returns pointer to the widget in the active tab.
 * widget(int); // Returns the widget at a specific index.
 * count(); // Returns the total number of tabs.
 * setTabText(int, QString); // Updates the label of an existing tab.
 * tabText(int index) // ...
 * setTabIcon(int, QIcon); // Adds an icon to the tab label.
 * setTabsClosable(bool); // Enables/disables close buttons on tabs.
 * setMovable(bool); // Allows user to reorder tabs via drag-and-drop.
 * setTabPosition(QTabWidget::North); // Positions tabs (North, South, West, East).
 * clear(); // Removes all tabs and their widgets.
 * signal &currentChanged(int); // Emitted when the active tab changes.
 * signal &tabCloseRequested(int); // Emitted when a tab's close button is clicked.
 * tabWidget->tabBar() // get tabbar object 
 * */
/* Inventory [ QTabBar ] { C++, Qt6 } 
 * addTab(QString); // Appends a new tab and returns its index.
 * insertTab(int, QString); // Inserts a tab at a specific position.
 * removeTab(int); // Removes the tab at the specified index.
 * count(); // Returns the number of tabs in the bar.
 * currentIndex(); // Returns the index of the currently active tab.
 * setCurrentIndex(int); // Switches focus to the tab at the given index.
 * tabText(int); // Gets the label text of a specific tab.
 * setTabText(int, QString); // Updates the label text of a specific tab.
 * tabData(int); // Retrieves the QVariant extra data associated with a tab.
 * setTabData(int, QVariant); // Stores custom data/tags at the specified index.
 * setTabsClosable(bool); // Shows or hides close buttons on all tabs.
 * setMovable(bool); // Enables user-driven drag-and-drop reordering.
 * setDrawBase(bool); // Controls if the thin line under the bar is painted.
 * setExpanding(bool); // If true, tabs expand to use all available width.
 * setTabButton(int, QTabBar::RightSide, QWidget*); // Places a custom widget (like a button) on a tab.
 * signal &currentChanged(int); // Emitted when a different tab is selected.
 * signal &tabBarClicked(int); // Emitted when a tab is clicked (even if already active).
 * signal &tabCloseRequested(int); // Emitted when the "X" button on a tab is pressed.
 * setTabTextColor(idx, QColor("orange")); // ...
 * */
/* Inventory [ QVariant ] { C++, Qt6 } 
 * QVariant(value); // Constructor: wraps almost any type (int, QString, QPoint, etc.).
 * setValue(T); // Replaces the current content with a new value of type T.
 * fromValue(T); // Static method to create a QVariant from a specific value.
 * typeId(); // Returns the MetaType ID of the stored data.
 * typeName(); // Returns the string name of the stored type (e.g., "int").
 * isValid(); // Returns true if the variant is not null/uninitialized.
 * isNull(); // Returns true if the variant contains a null value.
 * canConvert<T>(); // Checks if the variant can be cast to type T.
 * convert(int targetTypeId); // Attempts to cast the variant to a different type in-place.
 * toString(); // Converts and returns content as a QString.
 * toInt(bool *ok); // Converts to integer; 'ok' tracks success.
 * toDouble(); // Converts to double precision floating point.
 * toBool(); // Converts to boolean.
 * value<T>(); // Template method to extract the value as type T.
 * userType(); // Returns the user-defined type ID (for custom classes).
 * clear(); // Resets the variant to an invalid state.
 * */

// -- QsciScintilla 
/* Inventory [ Qt6 Scintilla ] { C++, Linux } 
 * #include <Qsci/qsciscintilla.h> // Include main widget class.
 * #include <Qsci/qscilexercpp.h> // Include C++ syntax highlighter.
 * * --- CORE SETUP ---
 * QsciScintilla *view = new QsciScintilla(this); // Instantiate editor widget.
 * view->setLexer(new QsciLexerCPP(view)); // Attach syntax logic to widget.
 * view->setUtf8(true); // Enable modern character encoding.
 * view->setMarginLineNumbers(1, true); // Display line numbers in margin.
 * view->setMarginWidth(1, "0000"); // Set margin width based on string length.
 * view->setFolding(QsciScintilla::BoxedTreeFoldStyle); // Enable code folding.
 * view->setCaretLineVisible(true); // Highlight the current line.
 * view->setCaretLineBackgroundColor(QColor("gray")); // Set current line color.
 * * --- TEXT MANIPULATION ---
 * setText(QString); // Replaces all content with the provided string.
 * text(); // Returns the entire content of the editor as a QString.
 * append(QString); // Adds text to the end of the document.
 * insert(QString); // Inserts text at the current cursor position.
 * selectedText(); // Returns the currently highlighted string.
 * removeSelectedText(); // Deletes the current selection.
 * replaceSelectedText(QString); // Swaps selection for new string.
 * * --- CURSOR & SELECTION ---
 * getCursorPosition(int* line, int* col); // Gets current line/column via pointers.
 * setCursorPosition(int line, int col); // Moves cursor to specific coordinates.
 * selectAll(); // Highlights the entire document.
 * hasSelectedText(); // Returns true if a selection exists.
 * lineAt(QPoint); // Returns the line index at a specific pixel coordinate.
 * * --- SEARCH & REPLACE ---
 * findFirst(QString, bool re, bool cs, bool wo, bool wrap); // Basic search engine.
 * replace(QString); // Replaces the find selection with new text.
 * * --- SIGNALS ---
 * signal &textChanged(); // Emitted when any text is modified.
 * signal &cursorPositionChanged(int l, int c); // Emitted on cursor move.
 * signal &linesChanged(); // Emitted when the line count changes.
 * */
/* Inventory [ QsciCommandSet ] { C++, Linux, Qt6, Scintilla } 
 * QsciCommandSet *cmds = view->standardCommands(); // Accesses the internal key-to-action mapper.
 * cmds->readSettings(QSettings &s); // Loads custom keybindings from a Linux config file.
 * cmds->writeSettings(QSettings &s); // Saves current keybindings to a config file.
 * QsciCommand *c = cmds->boundToKey(int key); // Finds which command is currently using a key.
 * c->setKey(int key); // Rebinds a specific Scintilla action to a new key combination.
 * */
/* Inventory [ QsciScintilla Folding ] { C++, Linux, Qt6 } 
 * setFolding(QsciScintilla::FoldStyle); // Enables folding (e.g., BoxedTreeFoldStyle).
 * foldAll(bool flatten); // Folds or unfolds every foldable block in the document.
 * SendScintilla(SCI_TOGGLEFOLD, line); // Toggles the fold state of a specific line.
 * SendScintilla(SCI_FOLDLINE, line, action); // Performs specific fold action (contract/expand).
 * setFoldMarginColors(color, color); // Customizes the background of the fold gutter on Linux.
 * */
/* marker / colors 
 * setBraceMatching(BraceMatch bm)
 * setBraceMatching(BraceMatch bm) 
 * setAutoIndent (bool autoindent)
 * setMatchedBraceBackgroundColor (const QColor &col) 
 * setMarkerForegroundColor (const QColor &col, int markerNumber=-1)
 * setUnmatchedBraceBackgroundColor (const QColor &col)
 * BraceMatch { NoBraceMatch, StrictBraceMatch, SloppyBraceMatch }
 * */

/* Inventory [ Lexer ] { Qt6, C++, Linux, QsciScintilla } 
1. QsciLexerCPP* lexer = new QsciLexerCPP(parent); // Initialize standard C++ lexer
2. editor->setLexer(lexer); // Attach lexer to the Scintilla editor instance
3. lexer->setColor(QColor("red"), QsciLexerCPP::Keyword); // Set specific color for syntax category
4. lexer->setFont(QFont("Monospace", 10)); // Set global font for the lexer
5. lexer->setPaper(QColor("#2b2b2b")); // Set background color (dark mode)
6. editor->SendScintilla(QsciScintilla::SCI_SETKEYWORDS, 0, "int float void"); // Define custom keywords
7. editor->setFolding(QsciScintilla::BoxedTreeFoldStyle); // Enable code folding markers
8. editor->setAutoIndent(true); // Enable basic auto-indentation logic
9. lexer->setEolFill(true); // Ensure background color extends to end of line
*/

/* Inventory [ Downcasting Lexer ] { Qt6, C++, QsciScintilla } 
1. QsciLexer* baseLexer = editor->lexer(); // Get generic lexer
2. QsciLexerCPP* cppLexer = qobject_cast<QsciLexerCPP*>(baseLexer); // Try to convert
3. if (cppLexer) { cppLexer->setFoldAtElse(true); } // Use only if successful
*/

/* Inventory [ Lexer Auto-Picker ] { Qt6, C++, QsciScintilla } 
1. QFileInfo fi(path); // Extract extension
2. QString ext = fi.suffix().toLower(); // Normalize to lowercase
3. if (ext == "cpp" || ext == "h") return new QsciLexerCPP(parent); // Map C++
4. if (ext == "py") return new QsciLexerPython(parent); // Map Python
5. if (ext == "lua") return new QsciLexerLua(parent); // Map Lua
6. return nullptr; // Fallback to no lexer (plain text)
*/

/* Inventory [ Event Callbacks ] { C++, Linux, Qt6, Scintilla } 
 * * -- QWidget / QTabWidget (Qt6 Core) --
 * virtual void mousePressEvent(QMouseEvent* event) // Handles mouse click interactions
 * virtual void keyPressEvent(QKeyEvent* event) // Captures keyboard input
 * void currentChanged(int index) // Signal: Tab selection changed
 * void tabCloseRequested(int index) // Signal: User clicked tab close button
 * * -- QScintilla (Scintilla Qt Port) --
 * void textChanged() // Signal: Any modification to the document text
 * void cursorPositionChanged(int line, int index) // Signal: Caret moved or text inserted
 * void marginClicked(int margin, int line, Qt::KeyboardModifiers state) // Signal: Click in gutter (folding/breakpoints)
 * void indicatorClicked(int line, int index, Qt::KeyboardModifiers state) // Signal: Click on styled indicator/hover
 * void modificationAttempted() // Signal: User tried to edit a read-only document
 * void userListSelection(const char* list, int id) // Signal: Selection made in custom autocomplete list
 * * -- Linux / System Level --
 * void QObject::timerEvent(QTimerEvent* event) // Handles periodic background tasks/polling
 * bool QObject::eventFilter(QObject* watched, QEvent* event) // Intercepts events before reaching the target
 * */

/* Inventory [ Signal/Slot Connections ] { C++, Linux, Qt6 } 
 * SYNTAX // SHORT_DESCRIPTION 
 * // -- Standard Pointer Syntax (Recommended) --
 * connect(sender, &SenderClass::signalName, receiver, &ReceiverClass::slotName); // Type-safe connection between two QObjects
 * connect(sender, &SenderClass::signalName, receiver, [=](params){ ... }); // Connect signal to a modern C++ Lambda function
 * // -- Connection Management --
 * disconnect(sender, &SenderClass::signalName, receiver, &ReceiverClass::slotName); // Break a specific existing connection
 * disconnect(connectionObject); // Disconnect using the QMetaObject::Connection handle returned by connect()
 * // -- Connection Types (Qt::ConnectionType) --
 * Qt::AutoConnection // Default: Direct if same thread, Queued if different threads
 * Qt::DirectConnection // Slot invoked immediately in the sender's thread (fast, but thread-unsafe)
 * Qt::QueuedConnection // Event posted to receiver's loop (thread-safe, asynchronous)
 * Qt::BlockingQueuedConnection // Sender thread pauses until receiver thread finishes slot (risk of deadlocks)
 * Qt::UniqueConnection // Prevents duplicate connections between the same signal and slot
 * // -- Advanced Utilities --
 * sender(); // Inside a slot: returns pointer to the QObject that triggered the signal
 * senderSignalIndex(); // Returns the index of the signal currently calling the slot
 * QSignalBlocker blocker(object); // RAII-style: temporarily silences all signals for an object
 * */

// =================================================================================
// Conjuration : Integration




















// -- END 
