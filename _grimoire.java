// Grimoire [ Java ]
/* ... */

// ========================== Runomancy : Basic Programming Logic 

/* Inventory [ Java ] { Basic Syntax }
1. public class ClassName { ... } ; Defines a class, the basic building block of Java programs.
2. public static void main(String[] args) { ... } ; Entry point for a Java application.
3. System.out.println("text"); ; Prints text with a newline to the standard output.
4. int x = 5; ; Declares and initializes an integer variable.
5. String name = "Alice"; ; Declares and initializes a string variable.
6. if (condition) { ... } else { ... } ; Basic conditional structure for decision-making.
7. for (int i = 0; i < n; i++) { ... } ; For loop for repeated iteration with index.
8. while (condition) { ... } ; While loop for conditional repetition.
9. do { ... } while (condition); ; Executes block at least once before checking condition.
10. // comment ; Single-line comment.
12. import package.ClassName; ; Imports a class from a package.
13. return value; ; Returns a value from a method.
14. new ClassName(); ; Creates a new object instance.
15. ClassName obj = new ClassName(); ; Declares and initializes an object.
--------------------------------------------------------------------------------------------
? It's necessary to put main inside a class 
? It's possible to define a function outside a class 
*/

/* Inventory [ String ] { Java }
1. String s = "Hello"; ; Declares and initializes a string.
2. s.length(); ; Returns the length of the string.
3. s.charAt(0); ; Gets the character at a specific index.
4. s.substring(1, 4); ; Extracts a substring from index 1 (inclusive) to 4 (exclusive).
5. s.indexOf("lo"); ; Returns index of first occurrence of substring.
6. s.lastIndexOf("l"); ; Returns index of last occurrence.
7. s.equals("Hello"); ; Checks if strings are equal.
8. s.equalsIgnoreCase("hello"); ; Compares ignoring case.
9. s.toUpperCase(); ; Converts to uppercase.
10. s.toLowerCase(); ; Converts to lowercase.
11. s.trim(); ; Removes leading and trailing whitespace.
12. s.replace("l", "x"); ; Replaces all occurrences.
13. s.split(","); ; Splits string by delimiter, returns array.
14. s.startsWith("He"); ; Checks if string starts with prefix.
15. s.endsWith("lo"); ; Checks if string ends with suffix.
16. String.format("Value: %d", 42); ; Formats a string.
17. String.join("-", "a", "b"); ; Joins multiple strings with delimiter.
18. String[] arr = s.split(" "); ; Splits by space.
19. String.valueOf(123); ; Converts number to string.
20. s.contains("el"); ; Checks if substring exists.
21. s.isEmpty(); ; Checks if string is empty ("").
22. s.isBlank(); ; Checks if string is empty or whitespace only.
23. StringBuilder sb = new StringBuilder(); ; Mutable string buffer.
24. sb.append("text"); ; Appends text to StringBuilder.
25. sb.toString(); ; Converts StringBuilder to String.
*/

/* Inventory [ Data Types and Variables ] { Java }
1. int num = 42; ; 32-bit signed integer.
2. long bigNum = 10000000000L; ; 64-bit signed integer with 'L' suffix.
3. double pi = 3.14159; ; 64-bit floating-point number.
4. float rate = 0.85f; ; 32-bit floating-point number with 'f' suffix.
5. char letter = 'A'; ; A single 16-bit Unicode character.
6. boolean isValid = true; ; Logical value: true or false.
7. byte b = 127; ; 8-bit signed integer.
8. short s = 32000; ; 16-bit signed integer.
9. String text = "Hello"; ; Reference type for sequences of characters.
10. var count = 10; ; Type inference (Java 10+).
11. final int MAX = 100; ; Constant value (cannot be reassigned).
12. int[] numbers = {1, 2, 3}; ; Array of integers.
13. Object obj = new Object(); ; Base class for all Java objects.
14. null ; Special literal representing "no object".
15. enum Direction { NORTH, SOUTH } ; Custom type with fixed values.
*/

/* Inventory [ Control Structures ] { Java }
1. if (condition) { ... } ; Executes block if condition is true.
2. if-else ; Provides alternate path if condition is false.
3. else if (otherCondition) { ... } ; Chain multiple conditions.
4. switch (variable) { case X: ... } ; Multi-branch selection.
5. for (int i = 0; i < n; i++) { ... } ; Standard for loop.
6. while (condition) { ... } ; Pre-condition loop.
7. do { ... } while (condition); ; Post-condition loop.
8. for-each (T item : list) { ... } ; Iterates over collections or arrays.
9. break; ; Exits a loop or switch early.
10. continue; ; Skips current iteration of a loop.
11. return value; ; Exits a method and returns a value.
12. try { ... } catch (Exception e) { ... } ; Handles exceptions.
13. finally { ... } ; Executes code after try/catch regardless of outcome.
14. throw new Exception("msg"); ; Throws an exception.
15. assert condition : "message"; ; Asserts that a condition is true during debugging.
*/

/* Inventory [ Collections Framework ] { Java }
1. ArrayList<Type> list = new ArrayList<>(); ; Resizable array.
2. list.add(item); ; Adds an item to the list.
3. list.get(index); ; Retrieves item at specified index.
4. list.remove(index); ; Removes item at index.
5. list.size(); ; Returns the number of elements.
6. HashMap<Key, Value> map = new HashMap<>(); ; Key-value pair storage.
7. map.put(key, value); ; Inserts key-value pair.
8. map.get(key); ; Gets value by key.
9. map.containsKey(key); ; Checks if key exists.
10. Set<Type> set = new HashSet<>(); ; Unordered collection of unique elements.
11. for (Type item : collection) { ... } ; Iterates over a collection.
12. Collections.sort(list); ; Sorts a list.
13. List.of(...); ; Creates an immutable list.
14. Arrays.asList(...); ; Converts array to list.
15. Iterator<Type> it = collection.iterator(); ; Iterates using manual control.
*/

/* Inventory [ Object-Oriented Concepts ] { Java }
1. class ClassName { ... } ; Basic unit of encapsulation.
2. extends ParentClass ; Inheritance — reuse and specialize behavior.
3. implements InterfaceName ; Implements contract defined by interface.
4. this.field ; Refers to current object's field.
5. super.method(); ; Calls method from parent class.
6. ConstructorName(...) ; Initializes new objects.
7. @Override ; Marks a method as overriding.
8. final class X ; Class cannot be extended.
9. abstract class Y ; Class with unimplemented (abstract) methods.
10. interface Z { ... } ; Defines a contract for implementation.
11. public/private/protected ; Access modifiers.
12. static ; Belongs to the class, not instances.
13. polymorphism ; One interface, many implementations.
14. encapsulation ; Hiding internal state via private fields and public methods.
15. instanceof ; Checks if an object is of a certain type.
*/

/* Inventory [ Classes Attributes ] { Java }
1. type name; ; Declares an attribute (field) inside a class.
2. public int age; ; A public attribute accessible from anywhere.
3. private String name; ; A private attribute accessible only within the class.
4. protected double salary; ; Accessible within the same package and subclasses.
5. static int counter; ; A static (class-level) attribute shared across all instances.
6. final String ID = "123"; ; A constant attribute — cannot be changed once assigned.
7. transient int tempData; ; Not serialized when saving object state.
8. volatile boolean flag; ; Ensures visibility across threads in concurrent programming.
9. this.attributeName ; Refers to the current object's attribute (useful when names conflict).
10. ClassName.attributeName ; Accesses a static attribute from outside the class.
11. obj.attributeName ; Accesses a public (or accessible) attribute of an object.
12. private int value = 42; ; Declares and initializes an attribute with a default value.
13. getAttribute() / setAttribute(...) ; Standard getter and setter method pair.
14. @Getter / @Setter (Lombok) ; Automatically generates getters and setters using annotations.
15. public static final double PI = 3.14159; ; Common pattern for defining a constant.
*/

/* Inventory [ Classes, Functions and Methods ] { Java }
1. class MyClass { ... } ; Declares a class, the basic structure of an object.
2. public class MyClass { ... } ; A class that is accessible from other packages.
3. class MyClass extends ParentClass { ... } ; Inherits from another class.
4. interface MyInterface { ... } ; Declares an interface with abstract methods.
5. class MyClass implements MyInterface { ... } ; Implements an interface.
6. public static void main(String[] args) { ... } ; Entry point method of Java applications.
7. returnType methodName(parameters) { ... } ; General method declaration.
8. public int add(int a, int b) { return a + b; } ; A public method with return type and parameters.
9. private void log(String msg) { ... } ; A private method, accessible only inside the class.
10. static void greet() { ... } ; Static method, callable without an object instance.
11. this.variable ; Refers to the current object's variable (used for clarity or disambiguation).
12. MyClass obj = new MyClass(); ; Instantiates an object from a class.
13. obj.methodName(); ; Calls a method on an object.
14. public MyClass() { ... } ; Constructor: special method called when object is created.
15. @Override ; Annotation used to indicate a method is overriding a superclass or interface method.
--------------------------------------------------------------------------------------------
? It's possible to detach implementation from declaration of functions 
*/

/* Inventory [ Importing Package ] { Java }
1. import package.ClassName; ; Imports a specific class from a package.
2. import package.*; ; Imports all classes from a package (wildcard).
3. import static package.ClassName.member; ; Imports a specific static member (method or variable).
4. import static package.ClassName.*; ; Imports all static members of a class.
5. package mypackage; ; Declares the package that the current class belongs to.
6. // No import needed for java.lang.* ; Core classes like String, Math, and System are auto-imported.
7. java.util.* ; Contains utility classes like ArrayList, HashMap, Date, etc.
8. java.io.* ; Contains classes for input and output (e.g., File, BufferedReader).
9. javax.swing.* ; Provides classes for GUI components.
10. import mypackage.MyClass; ; Imports a class you created in another package.
11. import org.example.lib.ClassName; ; Imports a class from a third-party library.
12. classpath settings ; Used by the compiler/VM to locate external packages or JARs.
13. javac -cp path ClassName.java ; Compiles Java file using custom classpath.
14. java -cp path ClassName ; Runs compiled class with classpath.
15. import static java.lang.Math.*; ; Allows direct use of Math methods (e.g., sin, pow) without prefix.
*/

/* Inventory [ java.util ] { Java }
1. import java.util.*; ; Imports the entire utility package.
2. Arrays.asList(array); ; Converts an array into a fixed-size list.
3. Collections.sort(list); ; Sorts elements in a list in natural order.
4. Collections.reverse(list); ; Reverses the order of elements in a list.
5. Collections.shuffle(list); ; Randomly shuffles elements in a list.
6. Collections.unmodifiableList(list); ; Creates an immutable view of a list.
7. List<Type> list = new ArrayList<>(); ; Dynamic resizable array.
8. Set<Type> set = new HashSet<>(); ; Unordered set of unique values.
9. Map<Key, Value> map = new HashMap<>(); ; Key-value store with fast lookup.
10. Queue<Type> queue = new LinkedList<>(); ; FIFO queue.
11. Stack<Type> stack = new Stack<>(); ; LIFO stack structure.
12. PriorityQueue<Type> pq = new PriorityQueue<>(); ; Queue with priority-based ordering.
13. Random rand = new Random(); ; Generates pseudo-random values.
14. UUID id = UUID.randomUUID(); ; Generates a universally unique identifier.
15. Date now = new Date(); ; Legacy date and time class.
16. Calendar cal = Calendar.getInstance(); ; Legacy calendar class.
17. Timer timer = new Timer(); ; Schedules repeated or delayed tasks.
18. Arrays.copyOf(array, newLength); ; Creates a resized copy of an array.
19. Collections.frequency(collection, element); ; Counts element occurrences.
20. Comparator.comparing(obj -> obj.prop); ; Builds comparator for sorting.
*/

/* Inventory [ Lambda Expressions & Functional Interfaces ] { Java 8+ }
1. (a, b) -> a + b ; Basic lambda expression with two parameters and return.
2. () -> System.out.println("Hello"); ; Lambda with no parameters.
3. x -> x * x ; Lambda with inferred type and single expression.
4. (int x, int y) -> { return x + y; } ; Lambda with explicit types and block body.
5. Runnable r = () -> System.out.println("Run"); ; Assigning lambda to functional interface.
6. Comparator<String> cmp = (a, b) -> a.length() - b.length(); ; Lambda for comparison logic.
7. list.forEach(item -> System.out.println(item)); ; Iterating with lambda.
8. Predicate<String> isEmpty = s -> s.isEmpty(); ; Predicate: boolean-valued function.
9. Function<Integer, String> toStr = i -> String.valueOf(i); ; Converts one type to another.
10. Consumer<String> printer = msg -> System.out.println(msg); ; Action-taking lambda.
11. Supplier<Double> rng = () -> Math.random(); ; No-arg, returns a value.
12. UnaryOperator<Integer> inc = x -> x + 1; ; One-arg function returning same type.
13. BinaryOperator<Integer> sum = (x, y) -> x + y; ; Two-arg function, same type in and out.
14. Stream.of(1, 2, 3).map(x -> x * 2).collect(Collectors.toList()); ; Functional stream chain.
15. Optional.of("A").filter(s -> s.length() > 1); ; Functional condition on optional.
*/

// ========================== Enchanting : Graphical Interface 

/* Inventory [ Java ] { Graphical User Interface }
1. import javax.swing.*; ; Imports Swing components for GUI development.
2. JFrame frame = new JFrame("Title"); ; Creates a main application window.
3. frame.setSize(width, height); ; Sets the window dimensions.
4. frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); ; Closes app when window is closed.
5. frame.setVisible(true); ; Makes the window appear on screen.
6. JButton button = new JButton("Click me"); ; Creates a clickable button.
7. JLabel label = new JLabel("Text"); ; Displays a static text label.
8. JTextField textField = new JTextField(columns); ; Input field for single-line text.
9. JPanel panel = new JPanel(); ; Container to organize components.
10. panel.add(component); ; Adds a component to a panel.
11. frame.add(panel); ; Adds a panel (or component) to the frame.
12. button.addActionListener(e -> { ... }); ; Adds click behavior to a button using lambda.
13. setLayout(new FlowLayout()); ; Sets layout manager to arrange components in flow.
14. setLayout(new BorderLayout()); ; Sets layout with regions: North, South, East, West, Center.
15. SwingUtilities.invokeLater(() -> { ... }); ; Ensures GUI is created on the Event Dispatch Thread.
*/

/* Inventory [ Positioning and Resizing ] { Java Swing }
1. setBounds(x, y, width, height); ; Sets the exact position and size of a component (absolute positioning).
2. setSize(width, height); ; Sets the size of a component (e.g., JFrame).
3. setLocation(x, y); ; Moves the component to specified (x, y) on screen or container.
4. setPreferredSize(new Dimension(w, h)); ; Suggests a size for layout managers to honor.
5. pack(); ; Sizes the window to fit its components' preferred sizes.
6. setLayout(null); ; Disables layout manager (enables absolute positioning).
7. setResizable(boolean); ; Enables/disables window resizing by the user.
8. setMinimumSize(new Dimension(w, h)); ; Sets the minimum size a component can be resized to.
9. setMaximumSize(new Dimension(w, h)); ; Sets the maximum size a component can be resized to.
10. getSize(); ; Returns the current size of the component as a Dimension object.
11. getLocation(); ; Returns the component's current location.
12. getBounds(); ; Returns the component's position and size in one call.
13. setAlignmentX(Component.LEFT_ALIGNMENT); ; Aligns component horizontally within container (layout-dependent).
14. frame.setLocationRelativeTo(null); ; Centers the frame on screen.
15. component.setVisible(true); ; Displays the component (often used after positioning/resizing).
16. c.getWidth()
17. c.getHeight() 
18. c.getX();
19. c.getY(); 
*/

/* Inventory [ GUI Components ] { Java Swing }
1. JLabel label = new JLabel("Text"); ; Displays static text or images.
2. JButton button = new JButton("Click"); ; A clickable button component.
3. JTextField input = new JTextField(20); ; Single-line text input field.
4. JTextArea area = new JTextArea(rows, columns); ; Multi-line text input.
5. JCheckBox check = new JCheckBox("Accept"); ; Toggle option with a checkbox.
6. JRadioButton radio = new JRadioButton("Option"); ; Single-choice selection.
7. ButtonGroup group = new ButtonGroup(); ; Groups radio buttons.
8. JComboBox<String> combo = new JComboBox<>(items); ; Drop-down selector.
9. JList<String> list = new JList<>(items); ; Scrollable list of items.
10. JScrollPane scroll = new JScrollPane(component); ; Scrollable view for content.
11. JPanel panel = new JPanel(); ; Container to group components.
12. JTabbedPane tabs = new JTabbedPane(); ; Tabs to switch between views.
13. JSlider slider = new JSlider(min, max); ; Select numeric value by sliding.
14. JProgressBar bar = new JProgressBar(); ; Shows task progress.
15. JTable table = new JTable(data, headers); ; Displays data in a grid table.
*/

/* Inventory [ GUI Layout Managers ] { Java Swing }
1. setLayout(new FlowLayout()); ; Arranges components left-to-right, top-to-bottom.
2. setLayout(new BorderLayout()); ; Regions: North, South, East, West, Center.
3. setLayout(new GridLayout(rows, cols)); ; Uniform grid of components.
4. setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS)); ; Vertical stacking layout.
5. setLayout(null); ; Absolute positioning (manual placement).
6. GridBagLayout layout = new GridBagLayout(); ; Flexible, complex layout manager.
7. GridBagConstraints gbc = new GridBagConstraints(); ; Constraints for GridBagLayout.
8. Box box = Box.createVerticalBox(); ; Creates vertical layout box.
9. panel.setAlignmentX(Component.LEFT_ALIGNMENT); ; Aligns child inside layout.
10. panel.setPreferredSize(new Dimension(w, h)); ; Suggests component dimensions.
11. panel.setBorder(BorderFactory.createLineBorder(Color.BLACK)); ; Adds border to panel.
12. setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT); ; Changes layout direction.
13. panel.setOpaque(false); ; Makes panel transparent.
14. revalidate(); ; Re-applies layout after adding/removing components.
15. repaint(); ; Requests redraw of component.
*/

/* Inventory [ Event Handling ] { Java Swing }
1. button.addActionListener(e -> { ... }); ; Handles button click with lambda.
2. ActionListener listener = new ActionListener() { ... }; ; Traditional ActionListener implementation.
3. textField.addKeyListener(new KeyAdapter() { ... }); ; Handles keyboard input.
4. component.addMouseListener(new MouseAdapter() { ... }); ; Handles mouse clicks.
5. checkbox.addItemListener(e -> { ... }); ; Handles checkbox state changes.
6. radio.addChangeListener(e -> { ... }); ; Handles radio button changes.
7. combo.addActionListener(e -> { ... }); ; Handles combo box selection.
8. slider.addChangeListener(e -> { ... }); ; Handles slider movements.
9. table.getSelectionModel().addListSelectionListener(...); ; Detects table row selection.
10. window.addWindowListener(new WindowAdapter() { ... }); ; Handles window events (open/close).
11. focusField.addFocusListener(new FocusAdapter() { ... }); ; Detects focus changes.
12. timer = new Timer(1000, e -> { ... }); ; Repeats action every interval (ms).
13. SwingUtilities.invokeLater(() -> { ... }); ; Ensures code runs on GUI thread.
14. e.getSource(); ; Gets the component that triggered the event.
15. e.getActionCommand(); ; Gets the string associated with the triggered action.
*/

/* Inventory [ KeyEvent ] { Java, Swing } !
1. KeyEvent e = new KeyEvent(Component, int id, long when, int modifiers, int keyCode, char keyChar); ; Constructor to create a KeyEvent.
2. e.getKeyCode() ; Returns the integer key code (e.g., KeyEvent.VK_ENTER).
3. e.getKeyChar() ; Returns the char associated with the key press (e.g., 'a', 'A', etc).
4. e.getKeyLocation() ; Returns the location of the key on the keyboard (e.g., standard, left, right, numpad).
5. e.getModifiers() ; Returns any modifier keys pressed (Shift, Ctrl, Alt).
6. e.isActionKey() ; Checks if the key is an action key (arrows, function keys, etc).
7. e.consume() ; Marks this event as consumed so it won't be processed further.
8. e.isConsumed() ; Checks if the event was consumed.
9. e.getWhen() ; Returns the timestamp of the event.
10. KeyEvent.VK_* ; Static constants for key codes (e.g., KeyEvent.VK_A, KeyEvent.VK_ESCAPE).
11. KeyEvent.KEY_PRESSED, KeyEvent.KEY_RELEASED, KeyEvent.KEY_TYPED ; Event ID constants for event type checks.
*/

/* Inventory [ ActionEvent ] { Java }
1. new ActionEvent(source, id, command) ; Creates a new ActionEvent manually (rare, usually generated by Swing)
2. getSource() ; Returns the object that triggered the event
3. getActionCommand() ; Returns the command string associated with the event (e.g. button label or setActionCommand)
4. getWhen() ; Returns the timestamp (in milliseconds) when the event occurred
5. getModifiers() ; Returns a bitmask of any modifier keys (e.g., Ctrl, Shift) held during the event
6. paramString() ; Returns a string with a summary of the event parameters (mainly for debugging)
*/

/* Inventory [ Dialogs and Messages ] { Java Swing }
1. JOptionPane.showMessageDialog(null, "Hello"); ; Shows simple message.
2. JOptionPane.showConfirmDialog(null, "Continue?"); ; Shows Yes/No/Cancel dialog.
3. JOptionPane.showInputDialog("Enter name:"); ; Prompts for text input.
4. JOptionPane.showOptionDialog(...); ; Fully customizable dialog.
5. JDialog dialog = new JDialog(frame, "Title"); ; Creates custom dialog window.
6. dialog.setModal(true); ; Makes dialog block other input until closed.
7. dialog.add(panel); ; Adds content to dialog.
8. dialog.pack(); ; Resizes dialog to fit content.
9. dialog.setVisible(true); ; Displays the dialog.
10. JOptionPane.INFORMATION_MESSAGE ; Constant for dialog type.
11. JOptionPane.ERROR_MESSAGE ; Constant for error icon.
12. JOptionPane.WARNING_MESSAGE ; Constant for warning icon.
13. dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE); ; Closes dialog properly.
14. dialog.setLocationRelativeTo(frame); ; Centers dialog on parent window.
15. dialog.dispose(); ; Destroys the dialog window.
*/

/* Inventory [ Custom Drawing and Graphics ] { Java Swing / AWT }
1. class MyPanel extends JPanel { public void paintComponent(Graphics g) { ... } } ; Custom drawing panel.
2. super.paintComponent(g); ; Preserves default background rendering.
3. g.drawString("Text", x, y); ; Draws text.
4. g.drawLine(x1, y1, x2, y2); ; Draws a line.
5. g.drawRect(x, y, width, height); ; Draws a rectangle.
6. g.fillRect(x, y, width, height); ; Fills a rectangle.
7. g.setColor(Color.RED); ; Changes drawing color.
8. g.setFont(new Font("Arial", Font.BOLD, 14)); ; Sets font.
9. repaint(); ; Requests panel to be redrawn.
10. setDoubleBuffered(true); ; Enables double buffering for smoother animation.
11. Timer timer = new Timer(16, e -> repaint()); ; 60fps animation loop.
12. Graphics2D g2 = (Graphics2D) g; ; Enhanced 2D rendering features.
13. g2.setRenderingHint(...); ; Enables antialiasing or quality rendering.
14. g.drawImage(img, x, y, this); ; Draws image in panel.
15. Toolkit.getDefaultToolkit().getImage("path.png"); ; Loads image from file.
*/

/* Inventory [ Window Management ] { Java Swing }
1. JFrame frame = new JFrame("Title"); ; Creates a top-level window.
2. frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); ; Closes program when window closes.
3. frame.setSize(500, 500); ; Sets window dimensions.
4. frame.setLocationRelativeTo(null); ; Centers window on screen.
5. frame.setVisible(true); ; Displays the window.
6. frame.setResizable(false); ; Prevents resizing.
7. frame.setAlwaysOnTop(true); ; Keeps window above others.
8. frame.setUndecorated(true); ; Removes title bar and borders.
9. frame.toFront(); ; Brings window to front.
10. frame.requestFocus(); ; Gives window focus.
11. frame.getContentPane().add(component); ; Adds UI element.
12. frame.setLayout(new FlowLayout()); ; Sets how elements are arranged.
13. frame.pack(); ; Sizes frame based on contents.
14. frame.repaint(); ; Redraws the entire frame.
15. frame.dispose(); ; Closes and destroys the frame.
*/

/* Inventory [ Context Menu ] { Java, Swing }
1. JPopupMenu popup = new JPopupMenu();  
	; Creates a popup menu instance for right-click context menus.
2. popup.add(new JMenuItem("Label")); 
	; Adds a menu item with a label to the popup.
3. JMenuItem item = new JMenuItem("Label"); popup.add(item); 
	; Creates and stores a menu item for later customization (e.g. action listener).
4. item.addActionListener(e -> {  }); 
	; Attaches a click action to a menu item.
5. popup.show(component, x, y);  
   ; Displays the popup menu at the given coordinates relative to a component.
6. component.setComponentPopupMenu(popup);  
   ; Binds the popup menu to the component, auto-shown on right-click.
7. JMenu submenu = new JMenu("Submenu"); popup.add(submenu);  
   ; Adds a submenu item to the context menu.
8. UIManager.put("PopupMenu.consumeEventOnClose", Boolean.TRUE);  
   ; Ensures mouse events are consumed when the popup closes (optional).
9. popup.setLightWeightPopupEnabled(false); ; Forces heavyweight popup rendering (helps on top of heavyweight components like OpenGL).
*/

/* Inventory [ Dialog ] { Java, GUI }
1. JOptionPane.showMessageDialog(parent, message) ; Shows a simple alert dialog with an OK button.
2. JOptionPane.showInputDialog(prompt) ; Prompts the user to enter a value and returns it as a String.
3. JOptionPane.showConfirmDialog(parent, message) ; Asks a Yes/No/Cancel question and returns an int constant (e.g., JOptionPane.YES_OPTION).
4. JOptionPane.showOptionDialog(...) ; Displays a custom dialog with full control over message, options, and icon.
5. JOptionPane.setDefaultLocale(locale) ; Sets the locale used in standard dialogs.
6. JDialog dialog = new JDialog(owner, title, modal) ; Creates a custom dialog with specified modality and title.
7. dialog.setVisible(true) ; Displays the dialog window.
8. dialog.setModal(true) ; Makes the dialog block input to other windows until it's closed.
9. dialog.setContentPane(component) ; Replaces dialog content with a custom panel or layout.
10. dialog.dispose() ; Closes and releases the dialog from memory.
*/

/* Inventory [ SwingUtilities ] { Java }
1. SwingUtilities.invokeLater( runnable ) ; Run code on the Event Dispatch Thread (EDT).
2. SwingUtilities.isLeftMouseButton( MouseEvent ) ; Check if the event used the left mouse button.
3. SwingUtilities.isRightMouseButton( MouseEvent ) ; Check if the event used the right mouse button.
4. SwingUtilities.isMiddleMouseButton( MouseEvent ) ; Check if the event used the middle mouse button.
5. SwingUtilities.getWindowAncestor( Component ) ; Get the top-level Window containing a given component.
6. SwingUtilities.getRoot( Component ) ; Get the root pane container (e.g., JFrame, JDialog).
7. SwingUtilities.updateComponentTreeUI( Component ) ; Update the UI for a component and its children to reflect current Look & Feel.
8. SwingUtilities.convertPoint( Component src, Point pt, Component dest ) ; Convert a point’s coordinates from one component’s space to another’s.
9. SwingUtilities.convertRectangle( Component src, Rectangle rect, Component dest ) ; Convert a rectangle’s coordinates from one component’s space to another’s.
10. SwingUtilities.convertMouseEvent( Component src, MouseEvent, Component dest ) ; Convert a MouseEvent’s coordinates for another component.
11. SwingUtilities.getDeepestComponentAt( Component parent, int x, int y ) ; Find the deepest visible child component at a point.
12. SwingUtilities.invokeAndWait( runnable ) ; Run code on the EDT and wait for it to finish.
13. SwingUtilities.windowForComponent( Component ) ; (Alias for getWindowAncestor.)
*/

/* Inventory [ UIManager ] { Java } 
1 Import 
   import javax.swing.UIManager;
   UIManager sets global Look and Feel properties for Swing.

2 Set Global Colors 
   UIManager.put("Label.foreground", Color.WHITE);
   UIManager.put("Panel.background", Color.BLACK);
   UIManager.put("Button.background", Color.DARK_GRAY);
   UIManager.put("Button.foreground", Color.WHITE);

3 Set Global Fonts 
   UIManager.put("Label.font", new Font("Arial", Font.BOLD, 14));
   UIManager.put("Button.font", new Font("SansSerif", Font.PLAIN, 12));

4 Set Global Borders 
   UIManager.put("ToolTip.border", BorderFactory.createLineBorder(Color.GRAY));

5 Example: Tooltip Colors 
   UIManager.put("ToolTip.background", Color.BLACK);
   UIManager.put("ToolTip.foreground", Color.WHITE);
   UIManager.put("ToolTip.font", new Font("Consolas", Font.PLAIN, 12));

6 Apply custom LookAndFeel 
   UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
   Or use a third-party LAF like FlatLaf or Nimbus.

7 Use before building components 
   Always set UIManager properties before you create components 
   so they pick up the correct defaults.

8 Get current property 
   Object color = UIManager.get("Label.foreground");

9️ Refresh existing components 
   After changing UIManager, you can force existing components 
   to update using SwingUtilities.updateComponentTreeUI(frame);

10 Supported keys depend on LAF 
   Common keys: 
   - "Button.background"
   - "Button.foreground"
   - "Panel.background"
   - "Label.foreground"
   - "ToolTip.background"
   - "ToolTip.foreground"
   - "Menu.background"
   - "Menu.foreground"
*/

/* Inventory [ JLabel ] { Java, Swing }
1. new JLabel(String text) ; Creates a label with text.
2. new JLabel(Icon icon) ; Creates a label with an icon.
3. label.setText(String) ; Sets the label’s text.
4. label.setIcon(Icon) ; Sets the label’s icon.
5. label.setHorizontalAlignment(int) ; Aligns text horizontally (SwingConstants.LEFT, CENTER, RIGHT).
6. label.setVerticalAlignment(int) ; Aligns text vertically (SwingConstants.TOP, CENTER, BOTTOM).
7. label.setForeground(Color) ; Sets text color.
8. label.setFont(Font) ; Sets label font.
9. label.setBorder(Border) ; Adds border around the label.
10. label.setToolTipText(String) ; Shows a tooltip when hovered.
11. label.setOpaque(true) ; Makes background visible.
12. label.setBackground(Color) ; Sets background color (must call setOpaque(true) too!).
13. label.setPreferredSize(Dimension) ; Sets fixed size.
14. label.addMouseListener(MouseListener) ; Adds mouse listener to label.
*/

/* Inventory [ JTextArea ] { Java }
1. new JTextArea(rows, columns); ; Creates a text area with specified size.
2. textArea.setText("text"); ; Sets the text content of the area.
3. String text = textArea.getText(); ; Gets the current content of the text area.
4. textArea.append("text"); ; Appends text at the end.
5. textArea.setEditable(true/false); ; Enables or disables editing.
6. textArea.setLineWrap(true); ; Enables automatic line wrapping.
7. textArea.setWrapStyleWord(true); ; Wraps at word boundaries (if lineWrap is true).
8. textArea.setRows(int); ; Sets the number of visible rows.
9. textArea.setColumns(int); ; Sets the number of visible columns.
10. textArea.setCaretPosition(pos); ; Moves the cursor to a given position.
11. textArea.setFont(new Font("Monospaced", Font.PLAIN, 14)); ; Sets the font for the text area.
12. textArea.select(start, end); ; Selects a range of text from start to end index.
13. textArea.replaceRange("replacement", start, end); ; Replaces a text range with new content.
14. textArea.setBackground(Color.LIGHT_GRAY); ; Changes the background color.
15. JScrollPane scroll = new JScrollPane(textArea); ; Wraps the text area with scrollbars.
16. component.setForeground(Color.COLOR_NAME); 
17. textArea.setCaretColor(Color.RED);
*/ 

/* Inventory [ JTabbedPane ] { Java, Swing } !
1. import javax.swing.JTabbedPane; ; Core class for tabbed panels.
2. JTabbedPane tabs = new JTabbedPane(); ; Create a new tabbed pane.
3. tabs.addTab("Title", Component); ; Add a tab with title and content.
4. tabs.insertTab("Title", Icon, Component, Tip, Index); ; Insert tab at index.
5. tabs.removeTabAt(index); ; Remove tab at specified index.
6. tabs.getTabCount(); ; Get total number of tabs.
7. tabs.getTitleAt(index); ; Get the title of a tab.
8. tabs.setTitleAt(index, "NewTitle"); ; Change the title of a tab.
9. tabs.getComponentAt(index); ; Get the content panel of a tab.
10. tabs.setComponentAt(index, Component); ; Replace tab content.
11. tabs.setEnabledAt(index, boolean); ; Enable or disable a tab.
12. tabs.setSelectedIndex(index); ; Programmatically switch to tab.
13. int index = tabs.getSelectedIndex(); ; Get currently selected tab index.
14. tabs.addChangeListener(ChangeListener); ; React when user switches tabs.
15. tabs.setTabComponentAt(index, Component); ; Set custom tab header (for close buttons, icons).
16. tabs.setIconAt(index, Icon); ; Set icon for a tab.
17. tabs.setToolTipTextAt(index, "Tip"); ; Set tooltip for a tab.
18. tabs.setTabPlacement(JTabbedPane.TOP); ; Position tabs (TOP, BOTTOM, LEFT, RIGHT).
19. Container parent = tabs.getParent(); ; Get parent container.
20. tabs.removeAll(); ; Remove all tabs.
21. tabs.getTabComponentAt() ; ... 
*/

/* Inventory [ JTextPane ] { Java }
1. JTextPane pane = new JTextPane(); ; Create a styled text component.
2. pane.setText("Hello"); ; Set the text content.
3. pane.getText(); ; Get the current text content.
4. pane.setEditable(true/false); ; Allow or disallow editing.
5. pane.setFont(new Font("Monospaced", Font.PLAIN, 12)); ; Set the font.
6. pane.setForeground(Color.BLACK); ; Set the text color.
7. pane.setBackground(Color.WHITE); ; Set the background color.
8. StyledDocument doc = pane.getStyledDocument(); ; Get the styled document for rich text.
9. SimpleAttributeSet attr = new SimpleAttributeSet(); ; Create attributes.
10. StyleConstants.setForeground(attr, Color.RED); ; Example: set text color in attribute.
11. doc.setCharacterAttributes(offset, length, attr, false); ; Apply styles to text range.
12. pane.setEditorKit(new WrapEditorKit()); ; Install custom EditorKit to enable word wrap.
13. pane.replaceSelection("New"); ; Replace selected text.
14. pane.setCaretPosition(int pos); ; Move the caret.
15. pane.getCaretPosition(); ; Get the caret position.
16. pane.setSelectionStart(int pos); ; Set selection start.
17. pane.setSelectionEnd(int pos); ; Set selection end.
18. pane.setToolTipText("Tip"); ; Add a tooltip.
19. JScrollPane scroll = new JScrollPane(pane); ; Add to scroll pane for scrolling.
20. pane.addKeyListener(...); ; Handle keyboard shortcuts.
21. pane.addMouseListener(...); ; Handle mouse events.
*/

/* Inventory [ JTree ] { Java, GUI }
1. new JTree() ; Creates a default tree with a simple root and children (useful for testing).
2. new JTree(TreeNode root) ; Creates a tree with a custom root node (e.g., DefaultMutableTreeNode).
3. new JTree(TreeModel model) ; Creates a tree with a custom TreeModel for advanced dynamic data.
4. setModel(TreeModel model) ; Replaces the tree’s data model.
5. getModel() ; Returns the current TreeModel.
6. addTreeSelectionListener(TreeSelectionListener l) ; Registers a listener for when the selection changes.
7. removeTreeSelectionListener(TreeSelectionListener l) ; Removes a selection listener.
8. getSelectionPath() ; Gets the TreePath for the selected node.
9. getSelectionPaths() ; Gets all selected TreePaths (useful for multi-selection).
10. getLastSelectedPathComponent() ; Gets the last selected node’s user object.
11. expandPath(TreePath path) ; Expands a node by its TreePath.
12. expandRow(int row) ; Expands a node by its row index.
13. collapsePath(TreePath path) ; Collapses a node by its TreePath.
14. collapseRow(int row) ; Collapses a node by its row index.
15. expandAll() (manual) ; No built-in method, but can expand all nodes recursively.
16. setEditable(boolean flag) ; Enables or disables inline editing of node names.
17. isEditable() ; Returns whether the tree allows editing.
18. startEditingAtPath(TreePath path) ; Puts the specified node into edit mode.
19. stopEditing() ; Stops editing and applies any changes.
20. cancelEditing() ; Cancels editing without applying changes.
21. setRootVisible(boolean flag) ; Shows or hides the root node.
22. isRootVisible() ; Returns whether the root node is visible.
23. setShowsRootHandles(boolean flag) ; Shows or hides the expand/collapse handles for root.
24. scrollPathToVisible(TreePath path) ; Scrolls to make a node visible.
25. addTreeExpansionListener(TreeExpansionListener l) ; Adds a listener for expand/collapse events.
26. removeTreeExpansionListener(TreeExpansionListener l) ; Removes an expansion listener.
27. addTreeWillExpandListener(TreeWillExpandListener l) ; Adds a listener that can veto expansion.
28. removeTreeWillExpandListener(TreeWillExpandListener l) ; Removes a will-expand listener.
29. setCellRenderer(TreeCellRenderer x) ; Customizes how nodes are rendered (icons, text, colors).
30. setCellEditor(TreeCellEditor editor) ; Customizes how nodes are edited.
31. setSelectionRow(int row) ; Selects a node by row.
32. setSelectionPath(TreePath path) ; Selects a specific node by TreePath.
33. setSelectionPaths(TreePath[] paths) ; Selects multiple nodes.
34. clearSelection() ; Clears any selection.
35. getPathForRow(int row) ; Gets the TreePath for a row index.
36. getRowForPath(TreePath path) ; Gets the row index for a TreePath.
37. getRowCount() ; Returns the total number of rows (expanded nodes).
38. isExpanded(TreePath path) ; Checks if a node is expanded.
39. isCollapsed(TreePath path) ; Checks if a node is collapsed.
40. requestFocusInWindow() ; Requests keyboard focus for the tree.
41. setToggleClickCount(int count) ; Sets how many clicks expand/collapse nodes (default is 2).
42. setLargeModel(boolean flag) ; Optimize rendering for very large trees.
43. getNextMatch(String prefix, int startingRow, Position.Bias bias) ; Finds a matching node text.
44. setDragEnabled(boolean flag) ; Enables drag-and-drop.
45. setDropMode(DropMode mode) ; Configures drop behavior.
46. addKeyListener(KeyListener l) ; Add custom key bindings.
47. getCellRenderer() ; Gets the current renderer.
48. getCellEditor() ; Gets the current editor.
*/

/* Inventory [ JList ] { Java, GUI } !
1. new JList() ; Creates an empty list.
2. new JList(E[] listData) ; Creates a list from an array of items.
3. new JList(ListModel<E> dataModel) ; Creates a list backed by a custom data model.
4. setModel(ListModel<E> model) ; Sets the data model for the list.
5. getModel() ; Gets the current ListModel.
6. setListData(E[] listData) ; Replaces the contents with the given array.
7. getSelectedIndex() ; Returns the index of the selected item.
8. getSelectedIndices() ; Returns all selected item indices.
9. getSelectedValue() ; Returns the currently selected item.
10. getSelectedValuesList() ; Returns all selected items as a List.
11. addListSelectionListener(ListSelectionListener l) ; Listens for selection changes.
12. setSelectionMode(int mode) ; Sets selection mode: SINGLE_SELECTION, SINGLE_INTERVAL_SELECTION, MULTIPLE_INTERVAL_SELECTION.
13. setCellRenderer(ListCellRenderer<? super E> renderer) ; Customizes how items are displayed.
14. setLayoutOrientation(int orientation) ; Sets horizontal/wrap layout: VERTICAL, HORIZONTAL_WRAP, VERTICAL_WRAP.
15. clearSelection() ; Clears all selections.
16. setVisibleRowCount(int count) ; Suggests the number of rows to display without scrolling.
17. ensureIndexIsVisible(int index) ; Scrolls to make the given index visible.
18. addMouseListener(MouseListener l) ; Detects mouse clicks on list items.
*/

/* Inventory [ JScrollPane ] { Java, GUI } 
1. new JScrollPane(Component view) ; Wraps a component (e.g., JList, JTree, JTextArea) with scrollbars.
2. new JScrollPane() ; Creates an empty scroll pane — content can be set later.
3. setViewportView(Component view) ; Sets or replaces the component inside the scroll pane.
4. setHorizontalScrollBarPolicy(int policy) ; Defines when the horizontal scrollbar appears (e.g., JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS).
5. setVerticalScrollBarPolicy(int policy) ; Defines when the vertical scrollbar appears (e.g., JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED).
6. getViewport() ; Returns the viewport — use to access or modify the contained view.
7. getHorizontalScrollBar() ; Returns the horizontal scrollbar component.
8. getVerticalScrollBar() ; Returns the vertical scrollbar component.
9. setPreferredSize(Dimension size) ; Defines the preferred size of the scroll pane.
10. getPreferredSize() ; Gets the preferred size of the scroll pane.
*/

// ========================== Transmutation : Data Manipulation 

/* Inventory [ Filesystem ] { Java }
1. import java.io.File; ; Provides platform-independent file/directory representation.
2. File file = new File("path/to/file.txt"); ; Creates a file or directory reference.
3. file.exists(); ; Checks whether the file or directory exists.
4. file.isFile(); ; Checks if it's a regular file.
5. file.isDirectory(); ; Checks if it's a directory.
6. file.getName(); ; Gets the name of the file/directory.
7. file.getAbsolutePath(); ; Gets the full filesystem path.
8. file.getParent(); ; Returns the parent directory path.
9. file.length(); ; Returns the size of the file in bytes.
10. file.list(); ; Lists names of all entries in the directory.
11. file.listFiles(); ; Lists `File` objects for all entries in the directory.
12. file.mkdirs(); ; Creates the directory and any necessary parent directories.
13. file.delete(); ; Deletes the file or empty directory.
14. file.renameTo(new File("new_name")); ; Renames or moves a file.
15. file.canRead(); ; Checks if the file is readable.
16. file.canWrite(); ; Checks if the file is writable.
17. file.canExecute(); ; Checks if the file is executable.
18. file.setReadable(true); ; Sets read permission.
19. file.setWritable(false); ; Sets write permission.
20. file.setExecutable(true); ; Sets execute permission.
21. File[] roots = File.listRoots(); ; Gets filesystem root directories (e.g., C:\ or /).
22. new File("path").toPath(); ; Converts to a `Path` (for use with `java.nio.file`).
*/

/* Inventory [ Exceptions ] { Java }
1. Exception ; Superclasse base para exceções verificadas (checked)
2. RuntimeException ; Superclasse base para exceções não-verificadas (unchecked)
3. IOException ; Problemas de entrada/saída (arquivos, streams)
4. FileNotFoundException ; Arquivo não encontrado (subclasse de IOException)
5. EOFException ; Fim de arquivo inesperado ao ler stream (subclasse de IOException)
6. ArithmeticException ; Erros aritméticos, como divisão por zero
7. NullPointerException ; Tentar acessar membro de objeto nulo
8. IndexOutOfBoundsException ; Índice inválido em arrays ou listas
9. ArrayIndexOutOfBoundsException ; Índice fora do tamanho de um array
10. StringIndexOutOfBoundsException ; Índice fora dos limites de uma string
11. ClassCastException ; Conversão de tipos inválida
12. IllegalArgumentException ; Argumento inválido passado a método
13. IllegalStateException ; Método invocado em estado inadequado do objeto
14. NumberFormatException ; Falha ao converter String para número
15. InterruptedException ; Thread interrompida durante espera
16. FileAlreadyExistsException ; Arquivo já existe (java.nio.file)
17. AccessDeniedException ; Sem permissão de acesso (java.nio.file)
18. SecurityException ; Violação de restrições de segurança
19. SQLException ; Erros em operações de banco de dados (JDBC)
20. UnsupportedOperationException ; Operação não suportada pelo objeto
*/

/* Inventory [ File I/O and Streams ] { Java }
1. import java.io.*; ; Core I/O classes for character and byte streams.
2. File file = new File("file.txt"); ; Represents file or directory path.
3. file.exists(); ; Checks whether the file or directory exists.
4. file.delete(); ; Deletes file or directory.
5. file.length(); ; Returns size in bytes.
6. file.isDirectory(); ; Checks if file is a directory.
7. FileReader fr = new FileReader("file.txt"); ; Reads character stream from file.
8. BufferedReader br = new BufferedReader(fr); ; Buffers input for efficient reading.
9. String line = br.readLine(); ; Reads a single line of text.
10. InputStreamReader isr = new InputStreamReader(fis); ; Converts byte stream to character stream.
11. FileWriter fw = new FileWriter("output.txt"); ; Writes characters to a file.
12. BufferedWriter bw = new BufferedWriter(fw); ; Buffers output for efficiency.
13. PrintWriter pw = new PrintWriter(bw); ; Adds formatted printing (e.g., println).
14. FileInputStream fis = new FileInputStream("file.bin"); ; Reads bytes from a binary file.
15. FileOutputStream fos = new FileOutputStream("file.bin"); ; Writes bytes to a binary file.
16. DataInputStream dis = new DataInputStream(fis); ; Reads primitives in binary form.
17. DataOutputStream dos = new DataOutputStream(fos); ; Writes primitives in binary form.
18. Scanner sc = new Scanner(new File("data.txt")); ; Simplifies parsing of text files.
19. try (Closeable res) { ... } ; Try-with-resources for auto-closing streams.
20. new File("dir").mkdirs(); ; Creates directories if they don’t exist.
21. Files.readAllBytes(Paths.get("file.txt")); ; Reads all bytes from file as byte[].
22. Files.readAllLines(Paths.get("file.txt")); ; Reads all lines into List<String>.
23. Files.write(Paths.get("output.txt"), data.getBytes()); ; Writes bytes to file.
24. Files.copy(source, target, StandardCopyOption.REPLACE_EXISTING); ; Copies file or directory.
25. Files.move(source, target, StandardCopyOption.REPLACE_EXISTING); ; Moves or renames file or directory.
26. Files.deleteIfExists(Paths.get("file.txt")); ; Deletes file if exists.
27. Files.newBufferedReader(Paths.get("file.txt")); ; Creates buffered reader (NIO).
28. Files.newBufferedWriter(Paths.get("output.txt")); ; Creates buffered writer (NIO).
29. Files.list(Paths.get("dir")); ; Streams directory contents (Stream<Path>).
30. Files.walk(Paths.get("dir")); ; Recursively streams directory tree.
31. Files.isDirectory(path); ; Checks if path is a directory (NIO).
32. Files.isRegularFile(path); ; Checks if path is a file (NIO).
33. Files.exists(path); ; Checks if path exists.
34. Path path = Paths.get("file.txt"); ; Modern NIO Path.
35. try (Stream<String> lines = Files.lines(path)) { ... } ; Streams file lines (lazy).
36. new ObjectInputStream(fis); ; Reads serialized objects.
37. new ObjectOutputStream(fos); ; Writes serialized objects.
38. new BufferedInputStream(fis); ; Adds buffering to binary input.
39. new BufferedOutputStream(fos); ; Adds buffering to binary output.
40. new SequenceInputStream(fis1, fis2); ; Concatenates multiple streams.
41. file.getAbsolutePath() ; ... 
*/

/* Inventory [ Serializable ] { Java }
1. implements Serializable ; Marks a class as eligible for Java built-in object serialization
2. private static final long serialVersionUID = N ; Defines class version for safe serialization/deserialization
3. transient TYPE field ; Prevents a field from being saved during serialization
4. writeObject(ObjectOutputStream out) ; Customizes how the object is written to the stream
5. readObject(ObjectInputStream in) ; Customizes how the object is read from the stream
6. ObjectOutputStream.writeObject(Object obj) ; Writes a serializable object to an output stream
7. ObjectInputStream.readObject() ; Reads and returns a deserialized object from the input stream
8. serialver CLASSNAME ; Command-line tool to generate a serialVersionUID for a class
9. import java.io.Serializable; 
*/

/* Inventory [ JSON Handling ] { Java }
1. import org.json.*; ; Popular JSON library for parsing and generation.
2. JSONObject obj = new JSONObject(); ; Creates a new JSON object.
3. obj.put("key", value); ; Adds a key-value pair to the JSON object.
4. obj.getString("key"); ; Retrieves a string value from a JSON object.
5. JSONArray arr = new JSONArray(); ; Creates a new JSON array.
6. arr.put(value); ; Adds a value to the array.
7. JSONObject obj = new JSONObject(jsonStr); ; Parses JSON string to object.
8. arr.getJSONObject(i); ; Gets i-th object in the array.
9. obj.has("key"); ; Checks if key exists in object.
10. obj.remove("key"); ; Removes a key from the object.
11. obj.toString(); ; Converts to JSON string.
12. arr.length(); ; Gets length of JSON array.
13. arr.get(i); ; Retrieves element at index i.
14. obj.optString("key", "default"); ; Safe string extraction with fallback.
15. new JSONObject(Map<String, Object>); ; Converts a map to JSON.
*/

/* Inventory [ Collections and Maps ] { Java }
1. List<String> list = new ArrayList<>(); ; Creates a dynamic list.
2. list.add("item"); ; Adds item to list.
3. list.get(0); ; Gets first item in list.
4. list.remove(0); ; Removes item by index.
5. Map<String, Integer> map = new HashMap<>(); ; Key-value map.
6. map.put("key", 42); ; Stores value by key.
7. map.get("key"); ; Retrieves value for key.
8. map.containsKey("key"); ; Checks if key exists.
9. for (String k : map.keySet()) { ... } ; Iterates over keys.
10. Set<String> set = new HashSet<>(); ; Stores unique values.
11. Collections.sort(list); ; Sorts list in-place.
12. Collections.reverse(list); ; Reverses list.
13. list.clear(); ; Removes all elements.
14. map.entrySet(); ; Allows iteration over key-value pairs.
15. List<String> list = Arrays.asList("a", "b"); ; Creates fixed-size list.
*/

/* Inventory [ Map ] { Java, Util }
1. Import
import java.util.Map;               // Interface for key-value pairs.
import java.util.HashMap;           // Unordered, allows nulls.
import java.util.LinkedHashMap;     // Keeps insertion order.
import java.util.TreeMap;           // Sorted by key.

2. Create 
Map<Key, Value> map = new HashMap<>();         // Basic map.
Map<Key, Value> map = new LinkedHashMap<>();   // Ordered.
Map<Key, Value> map = new TreeMap<>();         // Sorted.

3. Put 
map.put(key, value);                // Add or replace entry.

4. Get 
Value v = map.get(key);             // Get by key.

5. Remove 
map.remove(key);                    // Remove by key.

6. Check
map.containsKey(key);               // True if key exists.
map.containsValue(value);           // True if value exists.

7. Iterate 
for (Map.Entry<K,V> e : map.entrySet()) {}   // Entry loop.
for (K k : map.keySet()) {}                  // Keys only.
for (V v : map.values()) {}                  // Values only.

8. Utilities 
map.size();                        // Number of entries.
map.isEmpty();                     // True if empty.
map.clear();                       // Remove all.
Collections.unmodifiableMap(map); // Make read-only.
Map.of(k1,v1,k2,v2);               // Small immutable map (Java 9+).
*/

/* Inventory [ Reflection and Introspection ] { Java }
1. Class<?> cls = obj.getClass(); ; Gets runtime class.
2. Field[] fields = cls.getDeclaredFields(); ; All fields including private.
3. f.setAccessible(true); ; Allows access to private members.
4. f.get(obj); ; Gets field value.
5. f.set(obj, value); ; Sets field value.
6. Method[] methods = cls.getDeclaredMethods(); ; Lists declared methods.
7. m.invoke(obj, args); ; Calls method reflectively.
8. Constructor<?> c = cls.getConstructor(); ; Gets public constructor.
9. Object inst = c.newInstance(); ; Instantiates object reflectively.
10. obj instanceof ClassName ; Runtime type checking.
11. Class.forName("pkg.ClassName"); ; Loads class dynamically.
12. Modifier.isStatic(f.getModifiers()); ; Checks if field is static.
13. ParameterizedType ; Used for inspecting generic types.
14. Enum.valueOf(MyEnum.class, "CONSTANT"); ; Gets enum from name.
15. annotations = f.getAnnotations(); ; Retrieves annotations on a field.
*/

/* Inventory [ Parsing and Tokenization ] { Java }
1. Scanner sc = new Scanner(input); ; Tokenizes text input.
2. sc.nextLine(); ; Reads a full line.
3. sc.nextInt(); ; Parses next int.
4. sc.hasNext(); ; Checks if more tokens exist.
5. String[] parts = str.split(" "); ; Splits string into tokens.
6. Integer.parseInt("42"); ; Converts string to int.
7. Double.parseDouble("3.14"); ; Converts string to double.
8. String.format("%.2f", num); ; Formats number as string.
9. String.join("-", list); ; Joins elements into string.
10. new StringTokenizer(text, ","); ; Splits using multiple delimiters.
11. pattern.matcher(text).matches(); ; Tests regular expression.
12. regex.replaceAll("a", "b"); ; Regex replacement.
13. str.trim(); ; Removes leading/trailing whitespace.
14. str.toUpperCase(); ; Converts to uppercase.
15. str.contains("substring"); ; Checks substring presence.
*/

/* Inventory [ Data Transformation Utilities ] { Java }
1. Arrays.sort(array); ; Sorts array in-place.
2. Collections.shuffle(list); ; Randomizes list order.
3. Arrays.copyOf(array, newSize); ; Clones and resizes array.
4. Stream.of(array).map(...).toList(); ; Transforms array with stream.
5. IntStream.range(0, n).toArray(); ; Creates int array from 0 to n-1.
6. list.stream().filter(...); ; Filters elements.
7. list.stream().map(...).collect(...); ; Transforms collection.
8. String[] arr = list.toArray(new String[0]); ; Converts list to array.
9. new TreeSet<>(list); ; Removes duplicates and sorts.
10. Collections.unmodifiableList(list); ; Makes list read-only.
*/

// ========================== Projects 

// 1. Notepad - [ok] 
// 2. File Manager - ... 
// 3. Toolbar - ... 
// 4. Plotting Viewer - ... 

// -- END