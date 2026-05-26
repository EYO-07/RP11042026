// Grimoire [ C Sharp ]
// {Notepad--T;Cyan:Inventory;Silver:Logic,Dialetic;Red:Workflow} 

// ================================================ Runomancy 

/* Inventory [ Command-Line Syntax ] { dotnet }
1. dotnet new <template> [-o <output>] [--name <name>] [-f <framework>] ; Creates a new .NET project, solution, or file based on the specified template (e.g., console, winforms, mvc). The -o option sets the output directory, --name sets the project name, and -f specifies the target framework (e.g., net8.0, net8.0-windows).
2. dotnet restore [--source <source>] [--no-cache] ; Restores dependencies and tools specified in the .csproj file, downloading NuGet packages. The --source option specifies a custom NuGet feed, and --no-cache bypasses cached packages for a fresh restore.
3. dotnet build [--configuration <config>] [--no-restore] ; Compiles the project and its dependencies into an executable or library. The --configuration option sets the build configuration (e.g., Debug, Release), and --no-restore skips the restore step.
4. dotnet run [--project <path>] [--configuration <config>] ; Builds and runs the project in the current directory or the specified project path. The --configuration option sets the build mode (e.g., Debug, Release).
5. dotnet add reference <path> ; Adds a project-to-project reference to the .csproj file, allowing one project to use another project's output (e.g., a class library).
6. dotnet add package <package> [--version <version>] ; Adds a NuGet package reference to the .csproj file. The --version option specifies a particular package version (e.g., Microsoft.WindowsDesktop.App for Windows Forms).
7. dotnet remove package <package> ; Removes a NuGet package reference from the .csproj file.
8. dotnet clean [--configuration <config>] ; Removes build artifacts (e.g., bin and obj folders) from the project directory. The --configuration option specifies the build configuration to clean.
9. dotnet publish [--output <path>] [--runtime <rid>] ; Builds and packages the project for deployment, including runtime-specific files. The --output option sets the publish directory, and --runtime specifies the target runtime (e.g., win-x64, linux-x64).
10. dotnet test [--filter <expression>] [--no-build] ; Runs unit tests in the project using a test framework (e.g., xUnit, NUnit). The --filter option runs specific tests, and --no-build skips building before testing.
11. dotnet --version ; Displays the installed version of the .NET SDK.
12. dotnet sln <solution> add <project> ; Adds a project to a solution file (.sln) to manage multiple projects together.
13. dotnet sln <solution> remove <project> ; Removes a project from a solution file.
14. dotnet nuget push <package> [--source <source>] ; Publishes a NuGet package to a specified source (e.g., nuget.org).
15. dotnet watch run ; Runs the project and automatically restarts it when source files change, useful for development.
16. dotnet format ; Formats code in the project to follow a consistent style, based on .editorconfig settings if present.
17. dotnet workload install <workload> ; Installs additional workloads (e.g., maui, wasm-tools) to extend the .NET SDK for specific platforms like Windows Forms or Blazor.
18. dotnet workload update ; Updates installed workloads to their latest versions.
19. dotnet pack ; Creates a NuGet package from the project, typically used for libraries.
20. dotnet --info ; Displays detailed information about the .NET SDK, including installed runtimes, SDKs, and workloads.
21. dotnet list package ; ... 
22. dotnet publish -c Release -r win-x64 --self-contained false /p:PublishSingleFile=true
*/

/* Inventory [ csproj ]
1. <ApplicationIcon>iconname.ico</ApplicationIcon> ; put this on propertygroup for icon display 
2. <ItemGroup> <EmbeddedResource Include="iconname.ico" /> </ItemGroup> ; put this on project tag for icon display
*/

/* Inventory [ Basic Syntax ] { C Sharp }
This inventory covers the fundamental syntax elements of C# (version 9.0 or higher) for basic programming, including Top-Level Statements and essential constructs.
1. using System; Imports the System namespace, providing access to basic classes like Console for input/output operations.
2. Console.WriteLine("text"); Outputs text to the console, followed by a newline.
3. Console.ReadLine(); Reads a line of input from the console as a string.
4. string variableName = "value"; Declares a string variable with an initial value.
5. int variableName = number; Declares an integer variable with an initial value (e.g., int x = 42;).
6. void MethodName(parameters) { ... } Defines a method with no return value; can be inside a class or as a local function in Top-Level Statements.
7. static void Main(string[] args) { ... } Traditional entry point for a C# program; optional with Top-Level Statements in C# 9+.
10. public static class ClassName { ... } Defines a static class to group reusable methods.
11. if (condition) { ... } else { ... } Conditional statement to execute code based on a boolean condition.
12. for (int i = 0; i < count; i++) { ... } Loop to iterate a specific number of times.
13. foreach (var item in collection) { ... } Iterates over elements in a collection (e.g., array or list).
14. args Implicitly available in Top-Level Statements or Main method; represents command-line arguments as a string array.
*/

/* Inventory [ Basic Types ] { C Sharp }
This inventory lists the fundamental data types in C# (version 9.0 or higher), commonly used for variables and basic programming constructs.
1. int variableName = value; Declares a 32-bit signed integer (e.g., int x = 42;), ranging from -2,147,483,648 to 2,147,483,647.
2. double variableName = value; Declares a 64-bit floating-point number for decimal values (e.g., double pi = 3.14;).
3. bool variableName = true/false; Declares a boolean value, either true or false (e.g., bool isActive = true;).
4. string variableName = "text"; Declares a string for text data (e.g., string name = "John";).
5. char variableName = 'c'; Declares a single Unicode character (e.g., char letter = 'A';).
6. float variableName = value; Declares a 32-bit floating-point number, less precise than double (e.g., float temp = 98.6f;).
7. decimal variableName = value; Declares a 128-bit decimal number for high-precision calculations (e.g., decimal price = 19.99m;).
8. byte variableName = value; Declares an 8-bit unsigned integer, ranging from 0 to 255 (e.g., byte b = 255;).
9. long variableName = value; Declares a 64-bit signed integer, ranging from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 (e.g., long bigNum = 123456789L;).
10. var variableName = value; Implicitly typed variable; type is inferred at compile time (e.g., var count = 10; infers int).
*/

/* Inventory [ using statements ] { C#, Basic Syntax }

1. using Namespace;                     // Import namespace so types can be used without full qualification
2. using Namespace.SubNamespace;        // Import nested namespace
3. using static ClassName;              // Import static members (methods, fields, properties) of a class
4. using Alias = Namespace.Type;        // Create alias for a type or namespace
5. using Alias = Namespace.Sub;         // Alias for namespace
6. using System;                        // Most common base namespace (console, types, etc.)

// --- FILE-SCOPED DIRECTIVES ---

7. using System.IO;                     // Access file and stream operations
8. using System.Collections.Generic;    // Access List<T>, Dictionary<K,V>, etc.
9. using System.Linq;                   // LINQ query and extension methods
10. using System.Threading;             // Thread primitives
11. using System.Threading.Tasks;       // async / await task operations

// --- USING STATEMENT (RESOURCE MANAGEMENT) ---

11. using (var r = new Resource()){}    // Dispose object automatically at end of scope
12. using Resource r = new Resource();  // C# 8+ using declaration (dispose at end of scope)

// --- GLOBAL USING (C# 10+) ---

13. global using Namespace;             // Namespace imported for entire project

// --- COMPONENTS ---

14. Namespace                          // Logical container of types
15. Type                               // Class, struct, enum, interface
16. Alias                              // Local shorthand name for namespace/type
17. Static Import                      // Access static members without class prefix
18. Disposable Resource                // Object implementing IDisposable

*/

/* Inventory [ Funções Anônimas ] { C Sharp }
1. delegate (int x, int y) { return x + y; }; ; Expressão anônima (sem nome) de função.
2. Func<int, int, int> soma = delegate (int x, int y) { return x + y; }; ; Atribui função anônima a um delegate.
3. Func<int, int, int> soma = (x, y) => x + y; ; Sintaxe lambda simplificada (expressão).
4. Action<string> print = s => Console.WriteLine(s); ; Lambda para método void com um parâmetro.
5. Func<int, bool> par = n => n % 2 == 0; ; Lambda que retorna booleano.
6. var resultado = ((Func<int, int, int>)((x, y) => x * y))(3, 4); ; Invoca lambda imediatamente.
7. List<int> nums = new() {1,2,3}; nums.Where(n => n > 1); ; Lambda como argumento para métodos LINQ.
8. (int x, int y) => { int z = x + y; return z * 2; }; ; Lambda com corpo de bloco e múltiplas instruções.
9. EventHandler ev = (s, e) => { Console.WriteLine("Evento disparado"); }; ; Lambda para evento.
10. delegate { Console.WriteLine("Sem parâmetros"); }; ; Delegate anônimo sem parâmetros.
11. Func<int, int> f = x => { return x * x; }; ; Lambda com corpo de bloco e return.
12. (string s) => s.ToUpper(); ; Lambda com tipo explícito do parâmetro.
13. (x, y) => { Console.WriteLine(x + y); }; ; Lambda que não retorna valor (Action).
14. Action a = () => Console.WriteLine("Olá"); ; Lambda sem parâmetros.
15. Func<int> getRandom = () => new Random().Next(); ; Lambda que retorna valor e não tem parâmetros.
*/

/* Inventory [ Arrays, Collections, Lists, Maps ] { C Sharp }
1. int[] arr = new int[5]; ; Cria um array de inteiros com 5 posições.
2. int[] arr = { 1, 2, 3 }; ; Inicializa um array com valores.
3. arr.Length ; Retorna o número de elementos no array.
4. foreach (int x in arr) { } ; Itera sobre os elementos do array.
5. List<int> list = new List<int>(); ; Cria uma lista genérica de inteiros.
6. list.Add(10); ; Adiciona um item à lista.
7. list.Remove(10); ; Remove a primeira ocorrência do item.
8. list.Contains(10); ; Verifica se a lista contém o item.
9. list.Count ; Obtém o número de elementos na lista.
10. list.Clear(); ; Remove todos os elementos da lista.
11. list[0] = 42; ; Acessa ou modifica um item pelo índice.
12. list.Insert(1, 99); ; Insere um item na posição especificada.
13. list.RemoveAt(0); ; Remove o item no índice especificado.
14. list.IndexOf(42); ; Retorna o índice do item.
15. List<string> nomes = new() { "Ana", "Bia" }; ; Inicialização abreviada da lista.
16. Dictionary<string, int> map = new(); ; Cria um dicionário (mapa chave-valor).
17. map["x"] = 10; ; Adiciona ou altera um par chave-valor.
18. map.ContainsKey("x"); ; Verifica se a chave existe.
19. map.TryGetValue("x", out int val); ; Tenta obter valor de uma chave com segurança.
20. map.Remove("x"); ; Remove uma entrada pela chave.
21. map.Keys ; Retorna coleção de chaves do dicionário.
22. map.Values ; Retorna coleção de valores do dicionário.
23. foreach (var pair in map) { } ; Itera sobre pares chave-valor.
24. HashSet<int> set = new(); ; Conjunto sem duplicatas.
25. set.Add(1); ; Adiciona um item ao conjunto.
26. set.Contains(1); ; Verifica se o item está no conjunto.
27. Queue<string> fila = new(); ; Estrutura FIFO (primeiro a entrar, primeiro a sair).
28. fila.Enqueue("item"); ; Adiciona ao final da fila.
29. string item = fila.Dequeue(); ; Remove e retorna o primeiro da fila.
30. Stack<int> pilha = new(); ; Estrutura LIFO (último a entrar, primeiro a sair).
31. pilha.Push(10); ; Adiciona ao topo da pilha.
32. int topo = pilha.Pop(); ; Remove e retorna o topo da pilha.
33. pilha.Peek(); ; Retorna o topo sem remover.
34. var arr2 = list.ToArray(); ; Converte uma lista para array.
35. var list2 = arr.ToList(); ; Converte um array para lista.
36. list.Sort(); ; Ordena os elementos da lista.
37. list.Reverse(); ; Inverte a ordem dos elementos.
38. list.Where(x => x > 0); ; Filtra itens com LINQ (requer `using System.Linq`).
39. list.Select(x => x * 2); ; Projeta/transforma cada item da lista.
40. list.ForEach(x => Console.WriteLine(x)); ; Executa ação para cada item da lista.
*/

/* Inventory [ List ] { C# }
1. List<T> list = new List<T>(); ; Cria uma lista genérica vazia.
2. list.Add(item); ; Adiciona um item ao final da lista.
3. list.Insert(index, item); ; Insere um item na posição especificada.
4. list.Remove(item); ; Remove a primeira ocorrência do item.
5. list.RemoveAt(index); ; Remove o item na posição especificada.
6. list.Clear(); ; Remove todos os itens da lista.
7. list.Contains(item); ; Retorna true se o item existir na lista.
8. list.IndexOf(item); ; Retorna o índice da primeira ocorrência do item.
9. list.Count; ; Obtém o número de itens na lista.
10. list.Sort(); ; Ordena os itens da lista.
11. list.Reverse(); ; Inverte a ordem dos itens da lista.
12. list.ToArray(); ; Converte a lista para um array.
13. list.ForEach(action); ; Executa a ação para cada item da lista.
14. list.Find(predicate); ; Retorna o primeiro item que satisfaz o predicado.
15. list.FindAll(predicate); ; Retorna uma nova lista com todos os itens que satisfazem o predicado.
16. list.Exists(predicate); ; Verifica se existe algum item que satisfaz o predicado.
17. list.RemoveAll(predicate); ; Remove todos os itens que satisfazem o predicado.
18. list.Capacity; ; Obtém ou define a capacidade interna da lista.
19. list.TrimExcess(); ; Ajusta a capacidade para o tamanho atual da lista.
20. list.GetRange(index, count); ; Retorna uma sublista a partir do índice com a quantidade especificada.
21. list1.AddRange(list2); ; Adiciona todos os elementos de list2 ao final de list1.
22. list1.Concat(list2); ; Retorna um IEnumerable<T> combinando list1 e list2 (não modifica as originais).
23. list1.Concat(list2).ToList(); ; Cria uma nova lista contendo os elementos combinados.
24. new List<T>(list1) { list2... }; ; Cria uma nova lista com elementos de list1 e adiciona outros (via inicializador ou AddRange).
*/

/* Inventory [ Math Functions ] { C# } 
Math.Abs(x) ; Returns the absolute value of a number.
Math.Round(x) ; Rounds a number to the nearest integer or specified decimal places.
Math.Floor(x) ; Returns the largest integer less than or equal to x.
Math.Ceiling(x) ; Returns the smallest integer greater than or equal to x.
Math.Truncate(x) ; Removes the fractional part of a number.
Math.Max(a, b) ; Returns the larger of two values.
Math.Min(a, b) ; Returns the smaller of two values.
Math.Sqrt(x) ; Returns the square root of x.
Math.Pow(x, y) ; Raises x to the power of y.
Math.Exp(x) ; Returns e^x (Euler's number raised to x).
Math.Log(x) ; Returns the natural logarithm (base e) of x.
Math.Log10(x) ; Returns the base-10 logarithm of x.
Math.Sin(x) ; Returns the sine of x (x in radians).
Math.Cos(x) ; Returns the cosine of x (x in radians).
Math.Tan(x) ; Returns the tangent of x (x in radians).
Math.Asin(x) ; Returns the arcsine of x in radians.
Math.Acos(x) ; Returns the arccosine of x in radians.
Math.Atan(x) ; Returns the arctangent of x in radians.
Math.Atan2(y, x) ; Returns the angle whose tangent is y/x.
Math.Sign(x) ; Returns -1, 0, or 1 depending on the sign of x.
Math.IEEERemainder(x, y) ; Returns the remainder of x ÷ y, following IEEE 754 rules.
Math.Clamp(x, min, max) ; Restricts x to be within the min and max range.
Math.CopySign(x, y) ; Returns x with the sign of y (C# 8+).
Math.ReciprocalEstimate(x) ; Fast estimate of 1/x (hardware-specific, .NET 7+).
Math.BitDecrement(x) ; Returns the next smaller representable value (float/double).
Math.BitIncrement(x) ; Returns the next larger representable value (float/double).
Math.ScaleB(x, n) ; Multiplies x by 2 raised to the power n (x × 2ⁿ).
Math.FusedMultiplyAdd(x, y, z) ; Returns (x * y + z) with reduced rounding error (.NET 7+).
Math.Tau ; Constant: 2 * PI (≈ 6.28318) (.NET 5+).
*/

/* Inventory [ Loops, Iterators ] { C# }
1. for (int i = 0; i < n; i++) { ... } ; Loop clássico com índice.
2. foreach (var item in collection) { ... } ; Itera diretamente sobre elementos da coleção.
3. while (condition) { ... } ; Executa enquanto a condição for verdadeira.
4. do { ... } while (condition); ; Executa pelo menos uma vez, depois verifica condição.
5. break; ; Sai imediatamente do loop atual.
6. continue; ; Pula para a próxima iteração do loop.
7. yield return value; ; Retorna um valor em um iterator (método enumerador).
8. IEnumerable<T> MyIterator() { yield return x; ... } ; Cria um iterator usando yield.
9. var enumerator = collection.GetEnumerator(); ; Obtém enumerador para iteração manual.
10. while (enumerator.MoveNext()) { var item = enumerator.Current; ... } ; Iteração manual com enumerador.
11. LINQ: foreach (var x in collection.Where(cond)) { ... } ; Iteração filtrada usando LINQ.
12. Parallel.For(0, n, i => { ... }); ; Loop paralelo para processamento concorrente.
13. foreach (KeyValuePair<K,V> kvp in dictionary) { ... } ; Itera em dicionário chave-valor.
14. for (int i = collection.Count - 1; i >= 0; i--) { ... } ; Loop reverso útil para remoção em listas.
15. using (var enumerator = collection.GetEnumerator()) { while(enumerator.MoveNext()) { ... } } ; Iteração segura com IDisposable enumerator.
*/

/* Inventory [ string ] { C#, basic types }
1. string.Empty ; Represents the empty string ("").
2. Length ; Property that gets the number of characters in the string.
3. Substring(int startIndex, int length) ; Returns a substring starting at startIndex with specified length.
4. IndexOf(string value) ; Returns the zero-based index of the first occurrence of value within the string or -1 if not found.
5. Contains(string value) ; Returns true if the string contains the specified substring.
6. StartsWith(string value) ; Determines whether the beginning of the string matches the specified value.
7. EndsWith(string value) ; Determines whether the end of the string matches the specified value.
8. ToUpper() ; Returns a copy of the string converted to uppercase.
9. ToLower() ; Returns a copy of the string converted to lowercase.
10. Trim() ; Removes all leading and trailing white-space characters from the string.
11. Replace(string oldValue, string newValue) ; Returns a new string where all occurrences of oldValue are replaced with newValue.
12. Split(params char[] separator) ; Splits the string into an array of substrings based on the specified separator characters.
13. string.Format(string format, params object[] args) ; Returns a formatted string by replacing format items with args.
14. string.Join(string separator, IEnumerable<string> values) ; Concatenates a collection of strings using the specified separator.
15. Equals(string other) ; Determines whether two strings have the same value (case-sensitive).
16. IsNullOrEmpty(string value) ; Static method to check if string is null or empty.
17. IsNullOrWhiteSpace(string value) ; Static method to check if string is null, empty, or consists only of white-space characters.
*/

/* Inventory [ Map ] { Basic types, C# }
The Map interface in C# is typically represented by Dictionary<TKey, TValue>, which stores key-value pairs for efficient lookup, insertion, and removal.
1. Dictionary<TKey, TValue> dict = new Dictionary<TKey, TValue>() ; Initializes a new dictionary with specified key and value types.
2. dict.Add(TKey key, TValue value) ; Adds a key-value pair to the dictionary; throws an exception if the key already exists.
3. dict[Key] = value ; Adds or updates a key-value pair in the dictionary; overwrites the value if the key exists.
4. dict.Remove(TKey key) ; Removes the key-value pair with the specified key; returns true if successful, false if the key is not found.
5. dict.ContainsKey(TKey key) ; Checks if the specified key exists in the dictionary; returns true if found, false otherwise.
6. dict.TryGetValue(TKey key, out TValue value) ; Attempts to get the value for a specified key; returns true and sets the value if found, false otherwise.
7. dict.Keys ; Gets a collection of all keys in the dictionary.
8. dict.Values ; Gets a collection of all values in the dictionary.
9. dict.Clear() ; Removes all key-value pairs from the dictionary.
10. dict.Count ; Gets the number of key-value pairs in the dictionary.
*/

/* Inventory [ Conditional Control Structures ] { C#, Basic control flow }
Conditional control structures in C# direct the flow of execution based on specified conditions, enabling decision-making in code.
1. if (condition) { ... } ; Executes a block of code if the condition evaluates to true.
2. else if (condition) { ... } ; Executes a block of code if the previous if condition is false and this condition is true.
3. else { ... } ; Executes a block of code if all preceding if and else if conditions are false.
4. switch (expression) { case value: ... break; } ; Evaluates an expression and executes the matching case block; break exits the switch.
5. switch (expression) { default: ... } ; Executes the default block in a switch statement if no case matches.
6. condition ? valueIfTrue : valueIfFalse ; Ternary operator that evaluates a condition and returns one of two values based on the result.
7. if (condition1 && condition2) { ... } ; Logical AND in an if statement; executes if both conditions are true.
8. if (condition1 || condition2) { ... } ; Logical OR in an if statement; executes if at least one condition is true.
9. if (!condition) { ... } ; Logical NOT in an if statement; executes if the condition is false.
10. switch (expression) { case value when condition: ... } ; C# 8.0+ switch case with a when clause; executes if the case matches and the condition is true.
*/

/* Inventory [ HashSet ] { c#, data structures }
1. new HashSet<T>() ; Creates an empty HashSet of type T.
2. new HashSet<T>(IEnumerable<T> collection) ; Initializes a HashSet with elements from a collection.
3. hashSet.Add(item) ; Adds an item to the set. Returns false if the item already exists.
4. hashSet.Remove(item) ; Removes the specified item from the set.
5. hashSet.Contains(item) ; Checks whether the set contains the specified item.
6. hashSet.Clear() ; Removes all elements from the set.
7. hashSet.Count ; Gets the number of elements in the set.
8. hashSet.UnionWith(collection) ; Adds all elements from the specified collection, ignoring duplicates.
9. hashSet.IntersectWith(collection) ; Modifies the set to contain only elements present in both sets.
10. hashSet.ExceptWith(collection) ; Removes all elements in the specified collection from the set.
11. hashSet.SetEquals(collection) ; Determines whether the current set and the specified collection contain the same elements.
12. hashSet.IsSubsetOf(collection) ; Checks if the set is a subset of the specified collection.
13. hashSet.IsSupersetOf(collection) ; Checks if the set is a superset of the specified collection.
*/

/* Inventory [ ConcurrentDictionary ] { C#, Concurrency Programming }
1. new ConcurrentDictionary<TKey, TValue>() ; Initializes a new thread-safe dictionary.
2. TryAdd(key, value) ; Attempts to add the specified key and value if the key does not already exist.
3. TryRemove(key, out value) ; Attempts to remove the key/value pair and returns the value if successful.
4. TryUpdate(key, newValue, comparisonValue) ; Updates the value associated with a key if it matches a specified comparison value.
5. GetOrAdd(key, valueFactory) ; Returns the value for the key if it exists, or adds a new value generated by a factory function.
6. AddOrUpdate(key, addValue, updateValueFactory) ; Adds a new key/value pair or updates an existing key with a new value.
7. ContainsKey(key) ; Checks if the dictionary contains the specified key.
8. Keys ; Gets a thread-safe collection of keys.
9. Values ; Gets a thread-safe collection of values.
10. Count ; Gets the number of key/value pairs contained in the dictionary.
11. foreach (string key in ConcurrentDictionary.Keys) {}
*/

// ================================================ Transmutation 

/* Inventory [ System.Text.Json ] { C# }
1. JsonSerializer.Serialize(obj); ; Serializa objeto para string JSON.
2. JsonSerializer.Serialize(obj, options); ; Serializa com opções personalizadas.
3. JsonSerializer.Deserialize<T>(json); ; Desserializa string JSON para tipo T.
4. JsonSerializer.Deserialize(json, typeof(T)); ; Desserializa para tipo usando reflexão.
5. new JsonSerializerOptions(); ; Cria opções de serialização/desserialização.
6. options.WriteIndented = true; ; Gera JSON formatado (indentado).
7. options.PropertyNameCaseInsensitive = true; ; Ignora diferença de maiúsculas/minúsculas.
8. options.PropertyNamingPolicy = JsonNamingPolicy.CamelCase; ; Usa camelCase nos nomes das propriedades.
9. options.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull; ; Ignora propriedades com valor nulo.
10. JsonSerializer.SerializeToUtf8Bytes(obj); ; Serializa diretamente para bytes UTF-8.
11. JsonSerializer.Deserialize<T>(ReadOnlySpan<byte>); ; Desserializa de bytes UTF-8.
12. [JsonPropertyName("alias")]; ; Define nome alternativo para a propriedade no JSON.
13. [JsonIgnore]; ; Ignora a propriedade ao serializar ou desserializar.
14. [JsonInclude]; ; Inclui campos/propriedades públicas sem setter.
15. JsonSerializerOptions.Converters.Add(...); ; Adiciona conversores personalizados.
16. class CustomConverter<T> : JsonConverter<T>; ; Define como serializar e desserializar tipos personalizados.
17. File.WriteAllText(path, JsonSerializer.Serialize(obj)); ; Salva JSON em arquivo.
18. JsonSerializer.Deserialize<T>(File.ReadAllText(path)); ; Carrega JSON de arquivo.
19. options.Encoder = JavaScriptEncoder.UnsafeRelaxedJsonEscaping; ; Permite caracteres especiais no JSON.
20. JsonSerializer.SerializeAsync(stream, obj); ; Serializa assíncrono para Stream.
21. JsonSerializer.DeserializeAsync<T>(stream); ; Desserializa assíncrono de Stream.
22. JsonSerializer.DefaultOptions; ; Opções padrão do runtime (em versões futuras).
23. JsonDocument.Parse(json); ; Lê e navega em JSON como árvore DOM.
24. JsonElement root = doc.RootElement; ; Acessa raiz do JSON parseado.
25. element.GetProperty("nome"); ; Acessa propriedade em `JsonElement`.
*/

/* Inventory [ Regex ] { C#, .NET 10 }
1. using System.Text.RegularExpressions;        // import regex namespace
2. Regex regex = new Regex(pattern);            // create regex from pattern
3. regex = new Regex(pattern, RegexOptions.Compiled); // compiled regex (faster)
4. Match match = regex.Match(text);             // get first match
5. MatchCollection matches = regex.Matches(text); // get all matches
6. match.Success;                               // check if match occurred
7. match.Value;                                 // full matched text
8. match.Index;                                 // start index of match
9. match.Length;                                // length of match
10. match.Groups[index].Value;                  // capture group by index
11. match.Groups["name"].Value;                 // capture group by name
12. GroupCollection groups = match.Groups;       // all groups
13. foreach (Match m in matches) { }            // iterate matches
14. bool isMatch = regex.IsMatch(text);         // quick match check
15. string[] parts = regex.Split(text);         // split using regex
16. string replaced = regex.Replace(text, repl); // replace using regex
17. MatchEvaluator eval = m => ...;             // match evaluator delegate
18. regex.Replace(text, eval);                  // dynamic replace logic
19. Regex.Escape(text);                         // escape literal text
20. Regex.Unescape(text);                       // unescape escaped text
*/

// ================================================ Incantation

/* Inventory [ Console ] { C# }
The Console class provides basic input, output, and interaction functionality for console applications.

1. Console.Title ; Gets or sets the title displayed in the console window title bar.
2. Console.Write() ; Writes text to the standard output stream without a newline.
3. Console.WriteLine() ; Writes text to the standard output stream followed by a newline.
4. Console.ReadLine() ; Reads the next line of characters from the standard input stream.
5. Console.Read() ; Reads the next character from the standard input stream.
6. Console.ReadKey() ; Obtains the next key pressed by the user (optionally intercepting display).
7. Console.Clear() ; Clears the console buffer and corresponding display area.
8. Console.ForegroundColor ; Gets or sets the foreground color of the console text.
9. Console.BackgroundColor ; Gets or sets the background color of the console.
10. Console.ResetColor() ; Resets foreground and background colors to their defaults.
11. Console.CursorLeft ; Gets or sets the column position of the cursor.
12. Console.CursorTop ; Gets or sets the row position of the cursor.
13. Console.SetCursorPosition(int left, int top) ; Sets the cursor position.
14. Console.CursorVisible ; Gets or sets a value indicating whether the cursor is visible.
15. Console.Beep() ; Plays a beep sound through the console speaker.
16. Console.WindowWidth ; Gets or sets the width of the console window.
17. Console.WindowHeight ; Gets or sets the height of the console window.
18. Console.BufferWidth ; Gets or sets the width of the console screen buffer.
19. Console.BufferHeight ; Gets or sets the height of the console screen buffer.
20. Console.SetWindowSize(int width, int height) ; Sets the console window size.
21. Console.SetBufferSize(int width, int height) ; Sets the console buffer size.
22. Console.KeyAvailable ; Gets a value indicating whether a key press is available in the input stream.
23. Console.InputEncoding ; Gets or sets the encoding the console uses to read input.
24. Console.OutputEncoding ; Gets or sets the encoding the console uses to write output.
25. Console.OpenStandardInput() ; Acquires the standard input stream.
26. Console.OpenStandardOutput() ; Acquires the standard output stream.
27. Console.OpenStandardError() ; Acquires the standard error stream.
28. Console.Error ; Gets the standard error output stream.
29. Console.In ; Gets the standard input stream.
30. Console.Out ; Gets the standard output stream.
}
*/

/* Inventory [ GUI ] { C# }
1. Form form = new Form(); ; Cria uma nova janela.
2. form.Text = "Título"; ; Define o título da janela.
3. Button btn = new Button(); ; Cria um botão.
4. btn.Text = "Clique"; ; Texto exibido no botão.
5. btn.Click += (s, e) => { ... }; ; Evento para clique do botão.
6. Label lbl = new Label(); ; Cria um rótulo de texto.
7. lbl.Text = "Texto"; ; Define o texto do rótulo.
8. TextBox txt = new TextBox(); ; Campo para entrada de texto.
9. txt.Multiline = true; ; Permite múltiplas linhas no TextBox.
10. Panel pnl = new Panel(); ; Container para agrupar controles.
11. pnl.Controls.Add(btn); ; Adiciona botão ao painel.
12. form.Controls.Add(pnl); ; Adiciona painel ao formulário.
13. form.Show(); ; Exibe a janela.
14. form.ShowDialog(); ; Exibe a janela de forma modal.
15. MenuStrip menu = new MenuStrip(); ; Cria uma barra de menus.
16. ToolStripMenuItem fileMenu = new ToolStripMenuItem("Arquivo"); ; Item de menu.
17. menu.Items.Add(fileMenu); ; Adiciona item ao menu.
18. form.MainMenuStrip = menu; ; Define a barra de menus principal do formulário.
19. form.Controls.Add(menu); ; Adiciona barra de menus ao formulário.
20. OpenFileDialog dlg = new OpenFileDialog(); ; Caixa de diálogo para abrir arquivos.
21. dlg.ShowDialog(); ; Exibe a caixa de diálogo.
22. dlg.FileName ; Obtém o arquivo selecionado.
23. SaveFileDialog saveDlg = new SaveFileDialog(); ; Caixa para salvar arquivos.
24. saveDlg.ShowDialog(); ; Exibe a caixa de diálogo de salvar.
25. saveDlg.FileName ; Obtém o caminho selecionado para salvar.
26. StatusStrip status = new StatusStrip(); ; Barra de status na parte inferior.
27. ToolStripStatusLabel statusLabel = new ToolStripStatusLabel("Pronto"); ; Texto da barra de status.
28. status.Items.Add(statusLabel); ; Adiciona texto à barra de status.
29. form.Controls.Add(status); ; Adiciona a barra de status ao formulário.
30. Timer timer = new Timer(); ; Temporizador para eventos periódicos.
31. timer.Interval = 1000; ; Intervalo em milissegundos.
32. timer.Tick += (s, e) => { ... }; ; Evento disparado no intervalo.
33. form.FormClosing += (s, e) => { ... }; ; Evento antes do fechamento do formulário.
34. Control.Dock = DockStyle.Fill; ; Ajusta controle para preencher área disponível.
35. Control.Anchor = AnchorStyles.Top | AnchorStyles.Left; ; Mantém controle ancorado em posições específicas.
36. ToolTip tip = new ToolTip(); ; Exibe dicas flutuantes para controles.
37. tip.SetToolTip(btn, "Clique para executar"); ; Define dica para controle.
38. FlowLayoutPanel flow = new FlowLayoutPanel(); ; Layout que organiza controles em sequência.
39. TableLayoutPanel table = new TableLayoutPanel(); ; Layout de grade para controles.
40. Control.Visible = false; ; Esconde um controle da interface.
*/

/* Inventory [ Size and Position ] { winforms, C# }
1. form.Size = new Size(w, h); ; Define o tamanho da janela em pixels.
2. form.ClientSize = new Size(w, h); ; Define a área útil da janela (sem bordas e barra de título).
3. form.Location = new Point(x, y); ; Define a posição da janela na tela.
4. form.StartPosition = FormStartPosition.CenterScreen; ; Centraliza a janela na tela ao iniciar.
5. form.StartPosition = FormStartPosition.Manual; ; Permite definir manualmente a posição via Location.
6. form.Bounds = new Rectangle(x, y, w, h); ; Define posição e tamanho em uma única instrução.
7. form.DesktopLocation = new Point(x, y); ; Posiciona a janela no desktop (sem mudar tamanho).
8. form.Left = x; ; Define ou obtém a coordenada X da janela.
9. form.Top = y; ; Define ou obtém a coordenada Y da janela.
10. form.Width = w; ; Define ou obtém a largura da janela.
11. form.Height = h; ; Define ou obtém a altura da janela.
12. form.MaximumSize = new Size(w, h); ; Define o tamanho máximo que a janela pode ter.
13. form.MinimumSize = new Size(w, h); ; Define o tamanho mínimo da janela.
14. control.Anchor = AnchorStyles.Top | AnchorStyles.Left; ; Fixa um controle à posição relativa da janela.
15. control.Dock = DockStyle.Fill; ; Preenche o controle no contêiner pai.
16. Screen.PrimaryScreen.WorkingArea; ; Obtém a área disponível da tela (sem barra de tarefas).
17. Screen.FromControl(form).WorkingArea; ; Obtém a área da tela onde a janela está.
18. form.CenterToScreen(); ; Centraliza a janela na tela (pode ser chamado em tempo de execução).
19. control.BringToFront(); ; Traz o controle para frente na pilha de exibição.
20. control.SendToBack(); ; Envia o controle para trás na pilha de exibição.
*/

/* Inventory [ Point ] { c#, winforms }
1. Point(int x, int y) ; Initializes a new Point with the specified coordinates.
2. Point.Empty ; Static property that returns a Point with X=0 and Y=0.
3. X ; Gets or sets the x-coordinate of the Point.
4. Y ; Gets or sets the y-coordinate of the Point.
5. IsEmpty ; Gets a value indicating whether this Point is empty (X and Y are both 0).
6. Add(Point pt1, Size sz) ; Returns a new Point by adding a Size to a Point.
7. Subtract(Point pt, Size sz) ; Returns a new Point by subtracting a Size from a Point.
8. Offset(int dx, int dy) ; Translates the Point by the specified amount.
9. Offset(Point p) ; Translates the Point by the specified Point.
10. Equals(object obj) ; Determines whether the specified object is equal to the current Point.
11. ToString() ; Returns a string representation of the Point.
12. GetHashCode() ; Returns the hash code for this Point.
13. Operator +(Point, Size) ; Adds a Size to a Point.
14. Operator -(Point, Size) ; Subtracts a Size from a Point.
15. Operator ==(Point, Point) ; Checks if two Points have the same coordinates.
16. Operator !=(Point, Point) ; Checks if two Points have different coordinates.
*/

/* Inventory [ Rectangle ] { C#, WinForms }
int X { get; set; } ; Gets or sets the x-coordinate of the top-left corner of the rectangle.
int Y { get; set; } ; Gets or sets the y-coordinate of the top-left corner of the rectangle.
int Width { get; set; } ; Gets or sets the width of the rectangle (non-negative).
int Height { get; set; } ; Gets or sets the height of the rectangle (non-negative).
Point Location { get; set; } ; Gets or sets the top-left corner as a Point (x, y).
Size Size { get; set; } ; Gets or sets the size of the rectangle as a Size (width, height).
bool IsEmpty { get; } ; Returns true if the rectangle has zero width, height, and coordinates (0, 0).
Rectangle(int x, int y, int width, int height) ; Constructor to create a rectangle with specified x, y, width, and height.
static Rectangle FromLTRB(int left, int top, int right, int bottom) ; Creates a rectangle from left, top, right, and bottom coordinates.
bool Contains(Point pt) ; Checks if a given point is inside the rectangle's bounds.
void Inflate(int width, int height) ; Increases the rectangle's size by the specified amounts in both directions.
void Offset(int x, int y) ; Moves the rectangle by adding x and y to its coordinates.
*/

/* Inventory [ Windows Forms ] { C Sharp }
1. Form form = new Form(); ; Creates a new window (form) instance.
2. form.Text = "Title"; ; Sets the window's title bar text.
3. form.Size = new Size(w, h); ; Sets the form's width and height.
4. form.StartPosition = FormStartPosition.CenterScreen; ; Centers the form on the screen.
5. form.Controls.Add(control); ; Adds a control (e.g., Button, Label) to the form.
6. form.Show(); ; Displays the form without blocking execution.
7. form.ShowDialog(); ; Displays the form modally (blocking other input).
8. Application.Run(form); ; Starts the main message loop and shows the form.
9. form.Close(); ; Closes the form programmatically.
10. form.BackColor = Color.LightGray; ; Sets the background color of the form.
11. form.FormBorderStyle = FormBorderStyle.None; ; Removes window borders and title bar.
12. form.TopMost = true; ; Keeps the form always on top of other windows.
13. form.KeyPreview = true; ; Allows the form to receive key events before controls.
14. form.WindowState = FormWindowState.Maximized; ; Maximizes the form on start.
15. form.Load += (s, e) => { ... }; ; Event handler for when the form finishes loading.
16. form.FormClosing += (s, e) => { ... }; ; Event triggered just before the form closes.
17. form.Icon = new Icon("path.ico"); ; Sets a custom icon for the form.
18. form.AcceptButton = myButton; ; Pressing Enter triggers this button's click.
19. form.CancelButton = myCancelButton; ; Pressing Esc triggers this button's click.
20. form.AutoScaleMode = AutoScaleMode.Font; ; Adjusts scaling based on font size.
21. form.MinimumSize = new Size(w, h); ; Sets the minimum size of the form.
22. form.MaximumSize = new Size(w, h); ; Sets the maximum size of the form.
23. form.Opacity = 0.8; ; Sets transparency level (0.0 to 1.0).
24. form.BringToFront(); ; Brings the form to the front of the Z-order.
25. form.SendToBack(); ; Sends the form to the back of the Z-order.
26. form.DoubleBuffered = true; ; Reduces flicker for smoother drawing.
27. form.ShowInTaskbar = false; ; Hides the form from the taskbar.
28. form.Cursor = Cursors.WaitCursor; ; Changes the mouse cursor for the form.
29. form.Padding = new Padding(10); ; Sets internal spacing between edges and controls.
30. form.ClientSize = new Size(w, h); ; Sets the size of the form's client area.
31. form.IsMdiContainer = true; ; Enables MDI (Multiple Document Interface) support.
32. form.Activated += (s, e) => { ... }; ; Triggered when the form becomes active.
33. form.Deactivate += (s, e) => { ... }; ; Triggered when the form loses focus.
34. form.Resize += (s, e) => { ... }; ; Triggered when the form is resized.
35. form.Move += (s, e) => { ... }; ; Triggered when the form is moved.
36. form.HelpButton = true; ; Displays a help button on the title bar.
37. form.ControlBox = false; ; Hides minimize, maximize, and close buttons.
38. form.MaximizeBox = false; ; Disables the maximize button.
39. form.MinimizeBox = false; ; Disables the minimize button.
40. form.Owner = parentForm; ; Sets the owner of the form (modal relationships).
*/

/* Inventory [ ctrl.Controls ] { c#, winforms }
1. ctrl.Controls.Add(Control child) ; Adds a child control to the parent control.
2. ctrl.Controls.Remove(Control child) ; Removes a specific child control from the parent.
3. ctrl.Controls.Clear() ; Removes all child controls from the parent.
4. ctrl.Controls.Count ; Gets the number of child controls.
5. ctrl.Controls[index] ; Accesses a child control by index.
6. ctrl.Controls["name"] ; Accesses a child control by its Name property.
7. ctrl.Controls.Contains(Control child) ; Checks if the specified control is a child.
8. ctrl.Controls.GetEnumerator() ; Returns an enumerator for iterating child controls.
9. ctrl.Controls.SetChildIndex(Control child, int index) ; Sets the z-order index of a child control.
10. ctrl.Controls.GetChildIndex(Control child) ; Gets the z-order index of a child control.
*/

/* Inventory [ TextBox ] { C Sharp }
1. TextBox txt = new TextBox(); ; Cria um novo campo de entrada de texto.
2. txt.Text = "exemplo"; ; Define ou obtém o texto contido no TextBox.
3. txt.Multiline = true; ; Permite várias linhas de texto.
4. txt.ReadOnly = true; ; Torna o campo somente leitura.
5. txt.Enabled = false; ; Desativa a interação do usuário com o campo.
6. txt.Visible = false; ; Oculta o campo da interface.
7. txt.PasswordChar = '*'; ; Substitui os caracteres digitados (ex: senha).
8. txt.MaxLength = 50; ; Limita o número máximo de caracteres.
9. txt.TextAlign = HorizontalAlignment.Center; ; Alinha o texto (Left, Center, Right).
10. txt.BorderStyle = BorderStyle.None; ; Remove a borda do TextBox.
11. txt.ScrollBars = ScrollBars.Vertical; ; Adiciona barras de rolagem (em multiline).
12. txt.Dock = DockStyle.Fill; ; Preenche o espaço disponível no contêiner.
13. txt.Anchor = AnchorStyles.Top | AnchorStyles.Right; ; Permite redimensionamento ancorado.
14. txt.SelectionStart = 0; ; Define o início da seleção de texto.
15. txt.SelectionLength = 0; ; Define o comprimento da seleção de texto.
16. txt.Select(0, 5); ; Seleciona uma parte do texto.
17. txt.Clear(); ; Apaga o conteúdo do TextBox.
18. txt.AppendText("mais texto"); ; Adiciona texto ao final.
19. txt.KeyDown += (s, e) => { ... }; ; Evento para pressionamento de tecla.
20. txt.TextChanged += (s, e) => { ... }; ; Evento chamado sempre que o texto muda.
21. txt.Font = new Font("Consolas", 10); ; Define a fonte usada no texto.
22. txt.ForeColor = Color.DarkBlue; ; Define a cor do texto.
23. txt.BackColor = Color.WhiteSmoke; ; Define a cor de fundo do campo.
24. txt.WordWrap = true; ; Quebra automática de linha em multiline.
25. txt.Lines = new string[] { "linha 1", "linha 2" }; ; Define o conteúdo por linhas.
26. string[] linhas = txt.Lines; ; Obtém o texto dividido por linhas.
27. txt.PlaceholderText = "Digite algo..."; ; Texto exibido quando vazio (C# 8+).
28. txt.ShortcutsEnabled = false; ; Desativa atalhos padrão (Ctrl+C, Ctrl+V...).
29. txt.Modified = false; ; Indica se o texto foi modificado.
30. bool mod = txt.Modified; ; Verifica se houve alteração.
31. txt.TabIndex = 0; ; Ordem de navegação com a tecla Tab.
32. txt.AcceptsReturn = true; ; Permite Enter para quebra de linha.
33. txt.AcceptsTab = true; ; Permite Tab dentro do campo (em multiline).
34. txt.TabStop = true; ; Permite ou impede foco via Tab.
35. txt.BringToFront(); ; Traz o campo para frente na hierarquia visual.
36. txt.SendToBack(); ; Envia o campo para trás na hierarquia visual.
37. txt.Size = new Size(300, 100); ; Define largura e altura do campo.
38. txt.Location = new Point(10, 10); ; Define a posição do campo no contêiner.
39. txt.Parent = this; ; Define ou obtém o controle pai.
40. txt.ContextMenuStrip = myMenu; ; Atribui um menu de contexto ao campo.
*/

/* Inventory [ Font ] { Windows Forms, C# }
1. new Font("Arial", 12); ; Creates a font with specified family and size.
2. new Font("Consolas", 10, FontStyle.Bold); ; Font with style (Bold, Italic, etc.).
3. font.Name ; Gets the font family name (e.g., "Segoe UI").
4. font.Size ; Gets the size of the font in points.
5. font.Style ; Returns the style (FontStyle) applied to the font.
6. font.Bold ; Returns true if the font is bold.
7. font.Italic ; Returns true if the font is italic.
8. font.Underline ; Returns true if the font is underlined.
9. font.Strikeout ; Returns true if the font has a strike-through.
10. new Font(existingFont, FontStyle.Italic); ; Creates a new font based on another, changing style.
11. control.Font = new Font("Verdana", 9); ; Sets a font for any control (Label, TextBox, etc.).
12. control.Font = SystemFonts.DefaultFont; ; Applies system default font.
13. SystemFonts.CaptionFont ; Gets the system font used for window captions.
14. SystemFonts.MenuFont ; Gets the system font used in menus.
15. SystemFonts.MessageBoxFont ; Gets the system font used in message boxes.
16. font.ToHfont(); ; Converts Font to GDI+ font handle (used with native interop).
17. font.Equals(otherFont); ; Compares two fonts for equality.
18. font.GdiVerticalFont ; Indicates if font is designed for vertical layout (rare).
19. font.Unit ; Gets the unit of measure (usually GraphicsUnit.Point).
20. new FontFamily("Segoe UI"); ; Creates a font family object (used in advanced scenarios). 
*/

/* Inventory [ TabControl ] { C# }
1. TabControl tab = new TabControl(); ; Cria um controle de abas.
2. tab.Dock = DockStyle.Fill; ; Faz o TabControl preencher o contêiner pai.
3. TabPage page = new TabPage("Título da Aba"); ; Cria uma aba com título.
4. tab.TabPages.Add(page); ; Adiciona uma aba ao TabControl.
5. tab.TabPages.Remove(page); ; Remove uma aba específica.
6. tab.SelectedIndex = 0; ; Define a aba ativa pelo índice.
7. int index = tab.SelectedIndex; ; Obtém o índice da aba ativa.
8. tab.SelectedTab = page; ; Define a aba ativa por referência.
9. TabPage current = tab.SelectedTab; ; Obtém a aba ativa.
10. tab.TabPages.Clear(); ; Remove todas as abas.
11. tab.Appearance = TabAppearance.Normal; ; Define o estilo visual das abas.
12. tab.Multiline = false; ; Permite múltiplas linhas de abas (se true).
13. tab.SizeMode = TabSizeMode.Fixed; ; Define modo de tamanho das abas (Fixed, Normal, FillToRight).
14. tab.ItemSize = new Size(100, 20); ; Define tamanho fixo para as abas.
15. tab.DrawMode = TabDrawMode.Normal; ; Define o modo de desenho (Normal, OwnerDrawFixed).
16. tab.DrawItem += (s, e) => { ... }; ; Evento para desenhar abas customizadas.
17. tab.SelectedIndexChanged += (s, e) => { ... }; ; Evento disparado ao mudar aba ativa.
18. page.Controls.Add(control); ; Adiciona controles à página da aba.
19. tab.HotTrack = true; ; Realça aba quando o mouse passa por cima.
20. tab.RightToLeftLayout = false; ; Altera orientação das abas para RTL.
21. tab.TabStop = true; ; Permite foco no controle via tabulação.
22. tab.Padding = new Point(6, 3); ; Define espaçamento interno das abas.
23. tab.Enabled = true; ; Ativa ou desativa o controle.
24. tab.ContextMenuStrip = menu; ; Define menu de contexto para o TabControl.
25. tab.ShowToolTips = true; ; Mostra dicas ao passar sobre as abas.
26. page.ToolTipText = "Dica da aba"; ; Define dica de ferramenta para a aba.
27. tab.SuspendLayout(); / tab.ResumeLayout(); ; Usado para otimizar atualizações visuais.
28. tab.Multiline = true; ; Permite exibir abas em múltiplas linhas.
29. tab.RightToLeft = RightToLeft.Yes; ; Exibe abas da direita para a esquerda.
30. tab.TabPages.Insert(0, page); ; Insere uma aba na posição especificada.
31. page.BackColor = Color.White; ; Define a cor de fundo da página da aba.
32. page.UseVisualStyleBackColor = true; ; Usa a cor padrão do sistema para o fundo.
33. tab.Alignment = TabAlignment.Top; ; Define a posição das abas (Top, Bottom, Left, Right).
34. tab.SelectTab(0); ; Seleciona a aba pelo índice.
35. tab.SelectTab(page); ; Seleciona a aba por referência.
36. tab.TabIndex = 0; ; Índice para navegação via teclado.
37. page.AutoScroll = true; ; Habilita barra de rolagem na página da aba.
38. tab.Multiline = false; ; Controla se múltiplas linhas de abas são permitidas.
39. tab.Visible = true; ; Controla a visibilidade do controle.
40. tab.SuspendLayout(); ; Suspende o layout para múltiplas mudanças.
41. foreach (TabPage tab in myTabControl.TabPages) {} ; ... 
*/

/* Inventory [ TabPage ] { C# , WinForms }
1. TabPage page = new TabPage("Title"); // Cria uma nova aba com o título especificado.
2. page.Controls.Add(control); // Adiciona um controle à aba (como um TextBox ou Panel).
3. page.Text = "Novo Título"; // Define ou obtém o título da aba.
4. page.BackColor = Color.LightGray; // Define a cor de fundo da aba.
5. page.Enabled = false; // Desativa a aba (não pode ser selecionada).
6. page.UseVisualStyleBackColor = true; // Usa o estilo visual padrão para o fundo.
7. page.ToolTipText = "Texto explicativo"; // Define o texto exibido ao passar o mouse (se suportado).
8. TabControl tabs = new TabControl(); tabs.TabPages.Add(page); // Adiciona a aba ao controle de abas.
9. tabs.TabPages.Remove(page); // Remove a aba do controle de abas.
10. tabs.SelectedTab = page; // Seleciona uma aba específica programaticamente.
11. tabs.TabPages["id"] // Acessa uma aba pelo nome, se ela tiver sido nomeada.
12. page.Name = "Editor1"; // Define um identificador interno para a aba.
13. Control control = page.Controls[0]; // Acessa o primeiro controle da aba.
*/

/* Inventory [ Events ] { C#, WinForms }
1.  control.Click += (s, e) => { }; ; Associa evento Click com lambda anônima.
2.  control.Click += Control_Click; ; Associa evento a método nomeado.
3.  private void Control_Click(object sender, EventArgs e) { } ; Método de tratamento de evento.
4.  control.MouseEnter += (s, e) => { }; ; Evento quando mouse entra no controle.
5.  control.MouseLeave += (s, e) => {  }; ; Evento quando mouse sai do controle.
6.  form.Load += (s, e) => { }; ; Ao carregar o formulário.
7.  form.FormClosing += (s, e) => { e.Cancel = true; }; ; Evento de fechamento.
8.  button.KeyDown += (s, e) => { if (e.KeyCode == Keys.Enter) { } }; ; Tecla pressionada.
9.  timer.Tick += (s, e) => { }; ; Evento de temporizador.
10. event EventHandler MyEvent; ; Declaração de evento.
11. MyEvent += HandlerMethod; ; Associa um handler a evento customizado.
12. MyEvent?.Invoke(this, EventArgs.Empty); ; Dispara evento customizado.
13. control.EnabledChanged += (s, e) => { }; ; Mudança de habilitação.
14. control.TextChanged += (s, e) => { }; ; Alteração de texto.
15. textBox.Validating += (s, e) => { }; ; Validação de controle.
16. comboBox.SelectedIndexChanged += (s, e) => { }; ; Mudança de seleção.
17. control.DragEnter += (s, e) => { }; ; Arrastar entra na área.
18. control.DragDrop += (s, e) => { }; ; Solta item arrastado.
19. control.GotFocus += (s, e) => { }; ; Controle ganhou foco.
20. control.LostFocus += (s, e) => { }; ; Controle perdeu foco.
21. EventHandler<T> genericEvent; ; Evento genérico com argumentos customizados.
22. e.Cancel = true; ; Cancela evento (ex: FormClosing).
23. Control.Invoke(() => { }); ; Executa na thread de interface.
24. WeakEventPattern ; Padrão para evitar vazamento de memória.
25. += and -= ; Adiciona e remove handlers.
26. class MyEventArgs : EventArgs { } ; Classe para argumentos customizados.
27. EventHandler<MyEventArgs> MyEvent; ; Evento com argumentos customizados.
28. control.MouseClick += (s, e) => { }; ; Clique com botão específico.
29. control.DoubleClick += (s, e) => { }; ; Duplo clique.
30. KeyPressEventHandler ; Handler para evento de tecla.
31. e.Handled = true; ; Evento foi tratado (ignorar propagação).
32. += / -= ; Subscrever e desubscrever eventos.
33. Delegate ; Tipo base para todos os eventos.
34. event keyword ; Palavra-chave para declarar eventos.
35. Event accessors ; add/remove customizados para eventos.
36. Command pattern with events ; Design pattern para lógica desacoplada.
37. UI threading and events ; Evite acessar UI fora da thread de interface.
38. Event bubbling and tunneling ; Propagação de eventos (mais comum em WPF).
39. async void Handler(...) { await ... } ; Eventos assíncronos.
40. Event-driven programming ; Paradigma com foco em reatividade.
41. Application.Idle += (s, e) => { }; ; Evento enquanto app está ocioso.
42. Application.ThreadException += (s, e) => { }; ; Exceções da UI.
43. AppDomain.CurrentDomain.UnhandledException += (s, e) => { }; ; Exceções fora da UI.
44. control.Resize += (s, e) => { }; ; Redimensionamento de controle.
45. form.Shown += (s, e) => { }; ; Formulário visível pela primeira vez.
46. form.Activated += (s, e) => { }; ; Quando o formulário ganha foco.
47. form.Deactivate += (s, e) => { }; ; Quando perde foco.
48. control.MouseWheel += (s, e) => { }; ; Rolagem do mouse.
49. control.PreviewKeyDown += (s, e) => { }; ; Antes do KeyDown (útil para Tab, Arrows).
50. control.BindingContextChanged += (s, e) => { }; ; Mudança de contexto de dados.
*/

/* Inventory [ Dialogs ] { GUI, WinForms, C# }
1. MessageBox.Show("Text"); ; Exibe uma caixa de mensagem simples com um botão OK.
2. MessageBox.Show("Text", "Title"); ; Exibe mensagem com título na janela.
3. MessageBox.Show("Text", "Title", MessageBoxButtons.OKCancel); ; Mensagem com botões OK e Cancelar.
4. MessageBox.Show("Text", "Title", MessageBoxButtons.YesNo); ; Mensagem com botões Sim e Não.
5. MessageBox.Show("Text", "Title", MessageBoxButtons.YesNo, MessageBoxIcon.Question); ; Mensagem com ícone de pergunta.
6. DialogResult result = MessageBox.Show("Delete file?", "Confirm", MessageBoxButtons.YesNo);
   if (result == DialogResult.Yes) { ... } ; Obtém resposta do usuário.
7. OpenFileDialog openFile = new OpenFileDialog(); ; Cria diálogo para abrir arquivo.
8. openFile.Filter = "Text files (*.txt)|*.txt|All files (*.*)|*.*"; ; Define filtros de arquivos.
9. if (openFile.ShowDialog() == DialogResult.OK) { string filename = openFile.FileName; } ; Abre diálogo e obtém arquivo selecionado.
10. SaveFileDialog saveFile = new SaveFileDialog(); ; Diálogo para salvar arquivo.
11. if (saveFile.ShowDialog() == DialogResult.OK) { string savePath = saveFile.FileName; } ; Abre diálogo de salvar.
12. FolderBrowserDialog folderDialog = new FolderBrowserDialog(); ; Diálogo para selecionar pasta.
13. if (folderDialog.ShowDialog() == DialogResult.OK) { string folderPath = folderDialog.SelectedPath; } ; Seleciona pasta.
14. InputBox (custom or via Microsoft.VisualBasic.Interaction.InputBox) ; Caixa de entrada simples para texto.
15. Form.ShowDialog(); ; Exibe formulário como diálogo modal.
16. Form.Show(); ; Exibe formulário não modal.
17. Custom dialogs can be created by inheriting Form and customizing controls.
18. MessageBoxIcon.Warning, MessageBoxIcon.Error, MessageBoxIcon.Information ; Ícones para MessageBox.
19. MessageBoxButtons.AbortRetryIgnore ; Botões adicionais para MessageBox.
20. MessageBoxDefaultButton.Button2 ; Define botão padrão na MessageBox.
*/

/* Inventory [ ListView ] { C#, WinForms }
1.  view.Items.Clear() : void ; Limpa todos os itens visíveis da ListView (útil para recarregar diretórios).
2.  view.SelectedItems : ListView.SelectedListViewItemCollection ; Retorna a coleção de itens atualmente selecionados.
3.  view.Columns.Add(string header, int width, HorizontalAlignment align) : void ; Adiciona uma nova coluna à ListView.
4.  view.SmallImageList : ImageList ; Define uma lista de ícones pequenos usados para exibir itens com ícones no modo `Details`.
5.  view.View = View.Details : void ; Define o modo de exibição como tabela detalhada (linhas e colunas).
6.  view.FullRowSelect = true : void ; Permite que a seleção cubra a linha inteira, não apenas a primeira coluna.
7.  view.GridLines = true : void ; Ativa as linhas visuais de grade entre colunas e linhas.
8.  view.Items.Add(ListViewItem item) : int ; Adiciona um item à ListView e retorna sua posição.
9.  new ListViewItem(string[] columns, int imageIndex) : ListViewItem ; Cria um item com múltiplas colunas e ícone associado.
10. view.MultiSelect = false : void ; Impede a seleção de múltiplos itens simultaneamente.
11. view.CheckBoxes = true : void ; Exibe caixas de seleção à esquerda de cada item.
12. view.LabelEdit = true : void ; Permite que o usuário edite o texto dos itens.
13. view.HideSelection = false : void ; Mantém o item selecionado com destaque mesmo quando o controle perde o foco.
14. view.Sorting = SortOrder.Ascending : void ; Define a ordenação automática de itens (Ascending, Descending, None).
15. view.ItemActivate : event ; Evento disparado quando um item é ativado (ex: duplo clique ou Enter).
16. view.SelectedIndices : ListView.SelectedIndexCollection ; Coleção dos índices dos itens selecionados.
17. view.Items[index].SubItems[column] : ListViewItem.ListViewSubItem ; Acessa o conteúdo de uma célula (linha e coluna).
18. view.BeginUpdate() / view.EndUpdate() : void ; Suspende/retoma atualizações visuais para evitar flicker durante alterações em lote.
19. view.Columns.Clear() : void ; Remove todas as colunas da ListView.
20. view.Items.Remove(item) : void ; Remove um item específico da ListView.
21. view.AutoResizeColumns(ColumnHeaderAutoResizeStyle style) : void ; Redimensiona as colunas automaticamente com base no conteúdo.
*/

/* Inventory [ Assigning Event Handlers ] { winforms, C# }
1. control.EventName += HandlerMethod; ; Assigns an event using a named method.
2. control.EventName += (s, e) => { ... }; ; Assigns an inline lambda handler to the event.
3. control.EventName += delegate(object? s, EventArgs e) { ... }; ; Uses an anonymous delegate syntax (older form).
4. control.Click += (s, e) => control.Text = "Clicked!"; ; Example of inline logic using lambda.
5. control.KeyDown += new KeyEventHandler(Method); ; Explicit delegate creation (usually redundant).
6. form.KeyPreview = true; ; Ensures the form captures key events before child controls.
7. control.EventName -= HandlerMethod; ; Unsubscribes an event handler.
8. control.Invoke((MethodInvoker)(() => { ... })); ; Runs UI update logic from a non-UI thread safely.
9. control.HandleCreated += (s, e) => { HookEvents(); }; ; Ensures events are (re)attached after handle recreation.
10. Application.AddMessageFilter(new MyFilter()); ; Hooks low-level Win32 messages before WinForms events (advanced).
Common Event Names
- Click ; Raised when a control is clicked.
- DoubleClick ; Raised on double-click.
- MouseDown, MouseUp, MouseMove ; Raised on mouse interactions.
- KeyDown, KeyUp, KeyPress ; Raised on keyboard interaction.
- TextChanged ; Raised when the text value changes.
- ValueChanged ; Used by controls like NumericUpDown, DateTimePicker.
- CheckedChanged ; Used by CheckBox, RadioButton.
- SelectedIndexChanged ; Used by ListBox, ComboBox.
- Load ; Raised when a Form or UserControl is loaded.
- FormClosing, FormClosed ; Raised during or after form shutdown.
- Paint ; Raised when a control needs to be redrawn.
- Resize ; Raised when the control or form is resized.
- Validating, Validated, Enter, Leave ; Related to focus and input validation.
- Scroll ; Raised when scrollbars move. 
*/

/* Inventory [ KeyCode ] { Events, winforms, C# }
1. e.KeyCode == Keys.Enter ; Checks if Enter key was pressed.
2. e.KeyCode == Keys.Escape ; Checks if Escape key was pressed.
3. e.KeyCode == Keys.Up || e.KeyCode == Keys.Down ; Detects arrow key presses.
4. e.KeyCode == Keys.Delete ; Checks if Delete key was pressed.
5. e.KeyCode == Keys.Back ; Detects Backspace key.
6. e.KeyCode == Keys.Tab ; Checks for Tab key.
7. e.KeyCode == Keys.F1 ; Detects function key press.
8. e.KeyCode == Keys.ControlKey || e.Control ; Tests for Ctrl key usage.
9. e.Shift ; Boolean indicating Shift key is held.
10. e.Alt ; Boolean indicating Alt key is held.
11. e.KeyCode == Keys.A && e.Control ; Checks for Ctrl+A (Select All).
12. e.KeyCode == Keys.C && e.Control ; Checks for Ctrl+C (Copy).
13. e.KeyCode == Keys.V && e.Control ; Checks for Ctrl+V (Paste).
14. e.KeyCode == Keys.Z && e.Control ; Checks for Ctrl+Z (Undo).
15. e.SuppressKeyPress = true ; Prevents key from reaching control.
 */

/* Inventory [ Panel ] { winforms, C# }
1. new Panel() ; Basic container control for grouping and positioning other controls.
2. panel.Controls.Add(ctrl) ; Adds a single control to the panel.
3. panel.Controls.AddRange(ctrls) ; Adds multiple controls at once.
4. panel.Dock = DockStyle.Fill ; Makes panel fill its parent container.
5. panel.Anchor = AnchorStyles.Top | AnchorStyles.Left ; Keeps panel anchored to specified edges.
6. panel.BackColor = Color.LightGray ; Sets background color of the panel.
7. panel.BorderStyle = BorderStyle.FixedSingle ; Adds a simple border around the panel.
8. panel.AutoScroll = true ; Enables scrollbars if child controls overflow.
9. panel.AutoSize = true ; Panel resizes to fit its content (requires proper layout setup).
10. panel.Padding = new Padding(5) ; Adds inner spacing between panel edge and its contents.
11. panel.Margin = new Padding(5) ; External spacing from other controls.
12. panel.Enabled = false ; Disables interaction for all child controls.
13. panel.Visible = false ; Hides the panel and its contents.
14. panel.Size = new Size(w, h) ; Sets the explicit width and height of the panel.
15. panel.Location = new Point(x, y) ; Sets the position of the panel on its parent.
16. panel.SuspendLayout() ; Temporarily suspends layout logic while making changes.
17. panel.ResumeLayout() ; Resumes layout logic after batch updates.
18. panel.PerformLayout() ; Forces layout processing to occur.
19. panel.SetBounds(x, y, w, h) ; Sets position and size at once.
20. panel.Dock = DockStyle.Top | DockStyle.Bottom ; Aligns to specific edges of parent.
21. panel.BringToFront() / panel.SendToBack() ; Changes Z-order layering of the panel.
*/

/* Inventory [ Button ] { WinForms, C# }
1. Button btn = new Button(); ; Creates a new Button control instance.
2. btn.Text = string; ; Sets/gets the text displayed on the button.
3. btn.Size = new Size(width, height); ; Sets/gets the button’s size (width and height in pixels).
4. btn.Location = new Point(x, y); ; Sets/gets the button’s position (top-left corner coordinates).
5. btn.Enabled = bool; ; Enables/disables the button (true = clickable, false = grayed out).
6. btn.Visible = bool; ; Shows/hides the button (true = visible, false = hidden).
7. btn.Click += (s, e) => { code }; ; Event handler for when the button is clicked.
8. btn.Dock = DockStyle; ; Sets docking style (e.g., DockStyle.Fill, DockStyle.Top) to align the button within its container.
9. btn.BackColor = Color; ; Sets/gets the button’s background color (e.g., Color.Blue).
10. btn.Font = new Font(family, size); ; Sets/gets the font for the button’s text. 
*/

/* Inventory [ ToolStripMenuItem ] { winforms, C# }
1. new ToolStripMenuItem("Label") ; Creates a new menu item with the given label
2. menuItem.Text ; Gets or sets the text displayed on the menu item
3. menuItem.Click += handler ; Adds an event handler for click actions
4. menuItem.Enabled = bool ; Enables or disables the menu item
5. menuItem.Checked = bool ; Toggles the check mark on the menu item
6. menuItem.DropDownItems.Add(item) ; Adds a submenu item to the current item
7. menuItem.DropDown ; Gets the DropDown (submenu) associated with this item
8. menuItem.ShortcutKeys = Keys.Ctrl | Keys.S ; Assigns a keyboard shortcut
9. menuItem.Image = someImage ; Sets an icon image for the menu item
10. menuItem.Name ; Gets or sets the name identifier of the menu item
*/

/* Inventory [ TreeView ] { WinForms, C# }
The TreeView control in WinForms displays a hierarchical collection of labeled items, represented as nodes in a tree structure, often used for file explorers or organizational charts.
1. TreeView.Nodes ; Gets the collection of tree nodes assigned to the TreeView control, allowing addition, removal, or modification of nodes.
2. TreeView.SelectedNode ; Gets or sets the currently selected tree node, enabling interaction with the user’s selection.
3. TreeView.Nodes.Add(string text) ; Adds a new tree node with the specified text to the Nodes collection.
4. TreeView.Nodes.Remove(TreeNode node) ; Removes the specified tree node from the Nodes collection.
5. TreeView.AfterSelect ; Event triggered after a node is selected, providing access to the selected node via the TreeViewEventArgs parameter.
6. TreeView.ExpandAll() ; Expands all tree nodes in the TreeView, making all child nodes visible.
7. TreeView.CollapseAll() ; Collapses all tree nodes in the TreeView, hiding all child nodes.
8. TreeView.BeginUpdate() ; Prevents the TreeView from redrawing until EndUpdate is called, improving performance during multiple updates.
9. TreeView.EndUpdate() ; Resumes redrawing of the TreeView after BeginUpdate, refreshing the display.
10. TreeView.CheckBoxes ; Gets or sets a boolean indicating whether checkboxes are displayed next to tree nodes, enabling multi-selection.
11. TreeNode.Parent ; Gets the parent TreeNode of the current node. Returns null if the node is a root node.
12. TreeNode.Nodes ; Gets the collection of child nodes belonging to the current TreeNode.
13. TreeNode.Level ; Gets the zero-based depth level of the node within the TreeView hierarchy (0 = root).
14. TreeNode.Expand() ; Expands the current node to display its child nodes.
15. TreeNode.Collapse() ; Collapses the current node, hiding its child nodes.
*/

/* Inventory [ SplitContainer ] { WinForms, C# }
The SplitContainer control in Windows Forms is a composite control consisting of two resizable panels separated by a movable splitter. It is used to create flexible, user-adjustable layouts where one panel's content can influence the other, ideal for browsing and displaying information. It replaces the older Splitter control and supports both vertical and horizontal orientations.
1. SplitContainer.Panel1 ; Gets the left (or top) panel of the SplitContainer, allowing access to add or manage controls within it.
2. SplitContainer.Panel2 ; Gets the right (or bottom) panel of the SplitContainer, used to add or manage controls within it.
3. SplitContainer.Orientation ; Gets or sets the orientation of the splitter (Vertical or Horizontal), determining whether panels are side-by-side or stacked.
4. SplitContainer.SplitterDistance ; Gets or sets the distance between the splitter and the left (or top) edge of the control, controlling panel sizes.
5. SplitContainer.FixedPanel ; Specifies which panel (Panel1, Panel2, or None) remains fixed in size when the SplitContainer is resized.
6. SplitContainer.IsSplitterFixed ; Gets or sets a boolean indicating whether the splitter is movable by mouse or keyboard (true for fixed, false for movable).
7. SplitContainer.SplitterIncrement ; Gets or sets the increment (in pixels) the splitter moves, allowing a "snapping" effect when dragged.
8. SplitContainer.Dock ; Sets the docking style (e.g., DockStyle.Fill) to make the SplitContainer resize with its parent container, such as a Form.
9. SplitContainer.SplitterMoved ; Event triggered after the splitter is moved, useful for handling layout changes or persisting splitter position.
10. SplitContainer.Controls.Add(Control) ; Adds a control (e.g., Button, TextBox) to either Panel1 or Panel2, enabling custom content in each panel.
*/

/* Inventory [ Keys ] { winforms, keycodes, c# }
1. Keys.A ; Represents the 'A' key.
2. Keys.Enter ; Represents the Enter/Return key.
3. Keys.Escape ; Represents the Esc key.
4. Keys.Control ; Represents the Control (Ctrl) modifier key.
5. Keys.Shift ; Represents the Shift modifier key.
6. Keys.Alt ; Represents the Alt modifier key.
7. Keys.F1 to Keys.F24 ; Function keys (F1–F24).
8. Keys.D0 to Keys.D9 ; Number keys at the top of the keyboard.
9. Keys.NumPad0 to Keys.NumPad9 ; Numeric keypad number keys.
10. Keys.Space ; Represents the spacebar.
11. Keys.Back ; Represents the Backspace key.
12. Keys.Delete ; Represents the Delete key.
13. Keys.Insert ; Represents the Insert key.
14. Keys.Tab ; Represents the Tab key.
15. Keys.CapsLock ; Represents the Caps Lock key.
16. Keys.Up, Keys.Down, Keys.Left, Keys.Right ; Arrow keys.
17. Keys.Home, Keys.End ; Navigation keys.
18. Keys.PageUp, Keys.PageDown ; Paging keys.
19. Keys.PrintScreen, Keys.Scroll, Keys.Pause ; System keys.
20. Keys.LWin, Keys.RWin ; Left and right Windows keys.
21. Keys.Oem1 to Keys.OemClear ; Various punctuation and special characters.
22. Keys.Modifiers ; Gets a bitmask indicating which modifier keys (Shift, Ctrl, Alt) are currently pressed.
23. e.KeyCode == Keys.Escape ; Common check in KeyDown/KeyUp events.
24. e.Modifiers.HasFlag(Keys.Control) ; Checks if Ctrl is held during a key event.
25. (e.KeyData & Keys.KeyCode) == Keys.Enter ; Isolates the key code from modifier flags.
*/

/* Inventory [ TableLayoutPanel ] { WinForms, C# }
1. TableLayoutPanel() ; Constructor to create a new TableLayoutPanel instance.
2. ColumnCount { get; set; } ; Gets or sets the number of columns in the table layout.
3. RowCount { get; set; } ; Gets or sets the number of rows in the table layout.
4. Controls.Add(Control control, int column, int row) ; Adds a control to the specified cell (column, row) in the table.
5. ColumnStyles.Add(ColumnStyle style) ; Adds a style for a column, controlling its size behavior (e.g., Absolute, Percentage, AutoSize).
6. RowStyles.Add(RowStyle style) ; Adds a style for a row, controlling its size behavior (e.g., Absolute, Percentage, AutoSize).
7. AutoScroll { get; set; } ; Gets or sets whether the panel automatically adds scrollbars if content overflows.
8. CellBorderStyle { get; set; } ; Gets or sets the border style for cells (e.g., None, Single, Inset, Outset).
9. GetControlFromPosition(int column, int row) ; Returns the control located at the specified column and row.
10. SetColumnSpan(Control control, int value) ; Sets the number of columns a control spans.
11. SetRowSpan(Control control, int value) ; Sets the number of rows a control spans.
*/

/* Inventory [ DateTime ] { winforms, c# }
1. DateTime.Now ; Gets the current local date and time.
2. DateTime.Today ; Gets the current date with the time set to 00:00:00.
3. DateTime.UtcNow ; Gets the current date and time in UTC.
4. new DateTime(year, month, day) ; Creates a DateTime for a specific date with time defaulted to midnight.
5. new DateTime(year, month, day, hour, minute, second) ; Creates a DateTime with specified date and time.
6. DateTime.Parse(string) ; Converts a date and time string to a DateTime instance.
7. DateTime.TryParse(string, out DateTime) ; Safely attempts to parse a date string without throwing exceptions.
8. dateTime.ToString("HH:mm:ss") ; Formats the DateTime as a string showing only the time.
9. dateTime.ToString("yyyy-MM-dd") ; Formats the DateTime as a date string.
10. dateTime.AddDays(n) ; Returns a new DateTime with the specified number of days added.
11. dateTime.AddMinutes(n) ; Returns a new DateTime with the specified number of minutes added.
12. dateTime.Subtract(DateTime) ; Returns a TimeSpan representing the interval between two dates.
13. dateTime.DayOfWeek ; Gets the day of the week.
14. dateTime.Ticks ; Returns the number of 100-nanosecond intervals since 1/1/0001.
15. dateTime.ToShortDateString() ; Returns the date in short format (culture-specific).
16. dateTime.ToLongTimeString() ; Returns the time in long format (culture-specific).
17. DateTime.Compare(a, b) ; Compares two DateTime values (returns -1, 0, or 1).
18. DateTime.IsLeapYear(year) ; Returns true if the specified year is a leap year.
*/

/* Inventory [ GameWindow ] { OpenTK, C# }
The GameWindow class represents a native OS window with an OpenGL context, providing a game-style lifecycle with update and render loops.
1. new GameWindow(GameWindowSettings, NativeWindowSettings) ; Initializes a new window with specified update frequency, render settings, size, and title.
2. window.Run() ; Starts the main loop of the window, processing events and repeatedly calling UpdateFrame and RenderFrame.
3. window.Close() ; Requests the window to close, stopping the main loop.
4. window.ProcessEvents() ; Processes pending OS window events manually (used in custom loops).
5. window.SwapBuffers() ; Swaps the front and back buffers, presenting the rendered frame to the screen.
6. window.MakeCurrent() ; Makes the OpenGL context of this window current on the calling thread.
7. window.IsFocused ; Gets whether the window currently has input focus.
8. window.IsVisible ; Gets or sets whether the window is visible.
9. window.WindowBorder ; Gets or sets the window border style (Resizable, Hidden, Fixed, etc.).
10. window.WindowState ; Gets or sets the window state (Normal, Minimized, Maximized, Fullscreen).
11. window.Size ; Gets or sets the client area size of the window.
12. window.Location ; Gets or sets the screen position of the window.
13. window.Title ; Gets or sets the title of the window.
14. window.VSync ; Gets or sets vertical synchronization mode (On, Off, Adaptive).
15. window.UpdateFrequency ; Gets or sets how often UpdateFrame is called (updates per second).
16. window.RenderFrequency ; Gets or sets how often RenderFrame is called (frames per second).
17. window.CenterWindow() ; Centers the window on the primary monitor.
18. window.Dispose() ; Releases the window and OpenGL context resources.
-- Lifecycle Override Methods (Used in Derived Classes) --
19. OnLoad() ; Called once when the window and OpenGL context are created.
20. OnUnload() ; Called once before the window is destroyed.
21. OnUpdateFrame(FrameEventArgs) ; Called every update cycle (game logic).
22. OnRenderFrame(FrameEventArgs) ; Called every render cycle (drawing).
23. OnResize(ResizeEventArgs) ; Called when the window is resized.
24. OnFocusedChanged(FocusedChangedEventArgs) ; Called when window focus changes.
25. OnClosing(CancelEventArgs) ; Called when the window is about to close (can cancel).
26. OnKeyDown(KeyboardKeyEventArgs) ; Called when a key is pressed.
27. OnKeyUp(KeyboardKeyEventArgs) ; Called when a key is released.
28. OnMouseMove(MouseMoveEventArgs) ; Called when the mouse moves.
29. OnMouseDown(MouseButtonEventArgs) ; Called when a mouse button is pressed.
30. OnMouseUp(MouseButtonEventArgs) ; Called when a mouse button is released.
*/

/* Inventory [ Code Editor Control ] { C#, Scintilla5.NET }
-- for LLM: -> SYNTAX // SHORT DESCRIPTION
-- for LLM: can you complete this inventory based on https://github.com/desjarlais/Scintilla.NET/wiki keeping the comment block style ?
*/
/* 1. ==================== Project Setup 
-> dotnet add package Scintilla5.NET // install Scintilla5.NET package into the project
-> using ScintillaNET; // namespace used by the control
-> https://github.com/desjarlais/Scintilla.NET/wiki // documentation and recipes
-> Scintilla editor = new Scintilla(); // create editor control instance
-> parent.Controls.Add(editor); // add editor to a WinForms container
-> editor.Dock = DockStyle.Fill; // fill parent container with editor
*/
/* 2. ==================== Basics
-> editor.Text = "text"; // set editor text
-> string txt = editor.Text; // get editor text
-> editor.ReadOnly = true; // disable editing
-> editor.GotoPosition(int pos); // move caret to character position
-> editor.CurrentPosition // get caret position
-> editor.SelectionStart // selection start position
-> editor.SelectionEnd // selection end position
-> editor.SelectAll(); // select all text
-> editor.Clear(); // remove all text
-> editor.AppendText("text"); // append text to document
-> editor.TextLength // total document length
-> editor.Lines[index] // access a specific line object
-> editor.LineCount // number of lines in document
*/
/* 3. ==================== Language / Lexer
-> editor.Lexer = Lexer.Cpp; // set syntax highlighting language
-> editor.Lexer = Lexer.CSharp; // set C# syntax highlighting
-> editor.Lexer = Lexer.Python; // set Python syntax highlighting
-> editor.Lexer = Lexer.Null; // disable built-in lexer
-> editor.Lexer = Lexer.Container; // application handles syntax styling
-> editor.LexerName = "cpp"; // alternative way to set lexer language
-> editor.SetProperty("fold", "1"); // enable folding calculations
-> editor.SetProperty("fold.compact", "1"); // compact folding mode
-> editor.SetKeywords(0, "if else while for return class"); // keyword list for syntax highlighting
-> editor.StyleNeeded += handler; // event used for custom syntax styling
-> editor.StartStyling(int position); // begin applying style at position
-> editor.SetStyling(int length, int style); // apply style to characters :contentReference[oaicite:0]{index=0}
*/
/* 4. ==================== Theme / Style
-> editor.StyleResetDefault(); // reset default style configuration
-> editor.StyleClearAll(); // apply default style to all styles
-> editor.Styles[Style.Default].Font = "Consolas"; // set default font
-> editor.Styles[Style.Default].Size = 10; // set font size
-> editor.Styles[Style.Default].BackColor = Color.Black; // editor background color
-> editor.Styles[Style.Default].ForeColor = Color.White; // default text color
-> editor.Styles[index].ForeColor = Color.Red; // change color of specific style
-> editor.Styles[index].BackColor = Color.Black; // change background of style
-> editor.Styles[index].Bold = true; // bold text style
-> editor.Styles[index].Italic = true; // italic text style
-> editor.CaretForeColor = Color.White; // caret color
-> editor.SetSelectionBackColor(true, Color.FromArgb(...)); // selection background color
-> editor.SetSelectionForeColor(true, Color.White); // selection text color
-> editor.Indicators[index].Style = IndicatorStyle.Squiggle; // error underline indicator
-> editor.Indicators[index].ForeColor = Color.Red; // indicator color :contentReference[oaicite:1]{index=1}
*/
/* 5. ==================== Code Wrapping / Folding
-> editor.WrapMode = WrapMode.None; // disable line wrapping
-> editor.WrapMode = WrapMode.Word; // wrap at word boundaries
-> editor.WrapMode = WrapMode.Char; // wrap at character boundaries
-> editor.WrapVisualFlags = WrapVisualFlags.End; // show wrap indicator arrows
-> editor.WrapIndentMode = WrapIndentMode.Indent; // indent wrapped lines
-> editor.SetProperty("fold", "1"); // enable code folding
-> editor.SetProperty("fold.compact", "1"); // enable compact folding
-> editor.Margins[2].Type = MarginType.Symbol; // margin used for folding symbols
-> editor.Margins[2].Mask = Marker.MaskFolders; // display folding markers
-> editor.Margins[2].Sensitive = true; // allow clicking folding margin
-> editor.Margins[2].Width = 20; // margin width
-> editor.AutomaticFold = AutomaticFold.Show | AutomaticFold.Click | AutomaticFold.Change; // automatic folding behavior
-> editor.ToggleFold(line); // fold or unfold code block
-> editor.Lines[line].FoldLevel // fold level of line
-> editor.Lines[line].Expanded // check if folded block is expanded :contentReference[oaicite:2]{index=2}
*/
/* 6. ==================== Autocomplete / IntelliSense
-> editor.AutoCShow(lenEntered, "word1 word2 word3"); // show autocomplete list
-> editor.AutoCCancel(); // close autocomplete list
-> editor.AutoCActive // returns true if autocomplete list is visible
-> editor.AutoCSeparator = ' '; // separator character for autocomplete list
-> editor.AutoCIgnoreCase = true; // autocomplete ignores case
-> editor.AutoCMaxHeight = 10; // max rows in autocomplete list
-> editor.AutoCMaxWidth = 50; // max width of autocomplete list
-> editor.AutoCSelect = true; // auto select first item
-> editor.AutoCStops(" .,;()[]{}"); // characters that stop autocomplete
-> editor.CharAdded += handler; // common event used to trigger autocomplete
*/
/* 7. ==================== Call Tips
-> editor.CallTipShow(position, "function(arg1, arg2)"); // show function hint
-> editor.CallTipCancel(); // close calltip
-> editor.CallTipActive // check if calltip is visible
-> editor.CallTipSetBackColor(Color.DarkGray); // calltip background color
-> editor.CallTipSetForeColor(Color.White); // calltip text color
-> editor.CallTipSetHighlight(start, end); // highlight parameter region
-> editor.CallTipPosition // caret position where calltip appears
*/
/* 8. ==================== Markers / Breakpoints
-> editor.Markers[index].Symbol = MarkerSymbol.Circle; // define marker symbol
-> editor.Markers[index].BackColor = Color.Red; // marker background color
-> editor.Markers[index].ForeColor = Color.Black; // marker foreground color
-> editor.Lines[line].MarkerAdd(index); // add marker to line
-> editor.Lines[line].MarkerDelete(index); // remove marker from line
-> editor.MarkerDeleteAll(index); // remove all markers of a type
-> editor.Lines[line].MarkerGet(); // get marker bitmask on line
-> editor.MarkerNext(line, mask); // find next marker
-> editor.MarkerPrevious(line, mask); // find previous marker
*/
/* 9. ==================== Margins / Line Numbers
-> editor.Margins[index].Width = 40; // margin width
-> editor.Margins[index].Type = MarginType.Number; // margin for line numbers
-> editor.Margins[index].Type = MarginType.Symbol; // margin for markers
-> editor.Margins[index].Sensitive = true; // margin reacts to clicks
-> editor.Margins[index].Mask = Marker.MaskFolders; // display folding markers
-> editor.Margins[index].Cursor = MarginCursor.Arrow; // cursor style on margin
-> editor.Margins[index].Width = 0; // hide margin
-> editor.MarginClick += handler; // event when margin clicked
*/
/* 10. =================== Events
-> editor.TextChanged += handler; // triggered when document text changes
-> editor.CharAdded += handler; // triggered when character typed
-> editor.KeyDown += handler; // keyboard input event
-> editor.UpdateUI += handler; // UI update event (caret/selection changes)
-> editor.StyleNeeded += handler; // used for custom syntax highlighting
-> editor.MarginClick += handler; // triggered when margin clicked
-> editor.Modified += handler; // triggered when document modified
-> editor.DwellStart += handler; // mouse hover start
-> editor.DwellEnd += handler; // mouse hover end
-> editor.ZoomChanged += handler; // triggered when zoom level changes
-> editor.InsertCheck += handler; // intercept text insertion
-> editor.BeforeInsert += handler; // event before text inserted
-> editor.BeforeDelete += handler; // event before text deleted
*/
/* 11. =================== Search / Replace
-> editor.SearchFlags = SearchFlags.None; // set search behavior flags
-> editor.SearchFlags = SearchFlags.MatchCase; // case sensitive search
-> editor.SearchFlags = SearchFlags.WholeWord; // match whole words only
-> editor.TargetStart = 0; // search start position
-> editor.TargetEnd = editor.TextLength; // search end position
-> int pos = editor.SearchInTarget("text"); // search inside target range
-> editor.ReplaceTarget("new_text"); // replace target with new text
-> editor.ReplaceTargetRE("new_text"); // regex replace
-> editor.TargetText // get current target text
-> editor.SearchAnchor(); // set search anchor at caret
-> editor.SearchNext(SearchFlags.None, "text"); // search forward
-> editor.SearchPrev(SearchFlags.None, "text"); // search backward
-> editor.Lines[line].Text.Contains("text"); // manual line search
-> editor.GetTextRange(start, length); // extract text region
*/
/* 12. =================== Caret / Selection
-> editor.CaretLineVisible = true; // highlight current line
-> editor.CaretLineBackColor = Color.FromArgb(...); // caret line background
-> editor.CaretForeColor = Color.White; // caret color
-> editor.CaretWidth = 2; // caret thickness
-> editor.CurrentPosition // caret position index
-> editor.AnchorPosition // selection anchor position
-> editor.SelectionStart // selection start
-> editor.SelectionEnd // selection end
-> editor.SelectionEmpty // true if no selection
-> editor.SelectedText // get selected text
-> editor.ReplaceSelection("text"); // replace selected text
-> editor.SetSelection(start, end); // define selection range
-> editor.SelectAll(); // select entire document
-> editor.ClearSelections(); // remove selection
-> editor.LineFromPosition(pos); // get line number from position
-> editor.PositionFromLine(line); // get position from line
-> editor.ScrollCaret(); // ensure caret is visible
*/
/* 13. =================== Zoom / View Control
-> editor.Zoom = 0; // reset zoom level
-> editor.Zoom = 2; // increase zoom level
-> editor.ZoomIn(); // zoom in
-> editor.ZoomOut(); // zoom out
-> editor.ZoomChanged += handler; // zoom change event
-> editor.FirstVisibleLine // first visible line index
-> editor.LinesOnScreen // number of visible lines
-> editor.ScrollWidth = 1; // horizontal scroll width
-> editor.ScrollWidthTracking = true; // auto adjust scroll width
-> editor.HScrollBar = true; // show horizontal scrollbar
-> editor.VScrollBar = true; // show vertical scrollbar
-> editor.EndAtLastLine = false; // allow scrolling past last line
-> editor.ScrollRange(min, max); // control scroll limits
*/

/* Inventory [ Scintilla ] { Events, Scintilla5.NET }
1. InsertCheck       // Before text insert
2. DeleteCheck       // Before text delete
3. TextInserted      // After text insert
4. TextDeleted       // After text delete
5. UpdateUI          // UI update (folds, markers)
6. SavePointReached  // Document saved
7. SavePointLeft     // Document modified
8. MarginClick       // Margin interaction (fold/click)
9. CharAdded         // Character typed
10. KeyDown          // Key pressed
11. StyleNeeded      // Styling required
12. FoldChanged      // Fold state toggled
13. Zoom             // Zoom in/out
14. MouseDwell       // Mouse hover
15. IndicatorClick   // Indicator interaction
*/

// ================================================ Conjuration 

/* Inventory [ WebView2 ] { winforms, embedded browser, c# }
1. webView21.Source = new Uri("https://example.com"); ; Loads a webpage into the WebView2 control.
2. webView21.Navigate("https://example.com"); ; Navigates to a URL string.
3. await webView21.EnsureCoreWebView2Async(); ; Initializes the WebView2 environment before usage.
4. webView21.CoreWebView2.NavigateToString("<html>Hello</html>"); ; Loads HTML content directly.
5. webView21.CoreWebView2.ExecuteScriptAsync("alert('Hello');"); ; Executes JavaScript inside the page context.
6. webView21.CoreWebView2.Navigate("https://example.com"); ; Navigates using CoreWebView2 after initialization.
7. webView21.CoreWebView2.WebMessageReceived += EventHandler; ; Subscribes to messages sent from JavaScript.
8. webView21.CoreWebView2.PostWebMessageAsString("message"); ; Sends a string message to JavaScript.
9. webView21.CoreWebView2.Settings.IsScriptEnabled = true; ; Enables/disables JavaScript execution.
10. webView21.CoreWebView2.Settings.AreDevToolsEnabled = true; ; Enables Chrome DevTools for debugging.
11. webView21.CoreWebView2.NavigateToLocalStreamUri(uri, resolver); ; Loads local content via custom URI resolver.
12. webView21.Reload(); ; Reloads the current page.
13. webView21.GoBack(); ; Navigates back in the history.
14. webView21.GoForward(); ; Navigates forward in the history.
15. webView21.CoreWebView2.DownloadStarting += EventHandler; ; Handles file download initiation.
16. webView21.CoreWebView2.NewWindowRequested += EventHandler; ; Intercepts requests to open a new window.
17. webView21.CoreWebView2.NavigationCompleted += EventHandler; ; Raised when a navigation is finished.
18. webView21.CoreWebView2.NavigationStarting += EventHandler; ; Raised when a navigation starts.
19. webView21.CoreWebView2.HistoryChanged += EventHandler; ; Detects changes in browser navigation history.
20. webView21.CoreWebView2.DocumentTitle; ; Gets the title of the current document.
21. webView21.CoreWebView2.ContainsFullScreenElementChanged += EventHandler; ; Detects fullscreen changes.
22. webView21.CoreWebView2.OpenDevToolsWindow(); ; Opens the WebView2 Developer Tools window.
23. webView21.CoreWebView2.Settings.IsZoomControlEnabled = true; ; Enables/disables zoom UI.
24. webView21.ZoomFactor = 1.25; ; Sets the zoom factor (e.g. 1.0 = 100%).
25. webView21.CoreWebView2.CookieManager.GetCookiesAsync("https://example.com"); ; Retrieves cookies for a URI.
26. webView21.CoreWebView2.AddHostObjectToScript("bridge", new MyObject()); ; Exposes a .NET object to JS.
27. webView21.CoreWebView2.SetVirtualHostNameToFolderMapping("app", @"C:\site", VirtualHostNameToFolderMappingKind.Allow); ; Maps local folder to virtual host.
28. webView21.Dispose(); ; Disposes the WebView2 and releases resources.
29. webView21.CoreWebView2.Stop(); ; Stops the current navigation or page loading.
30. webView21.CoreWebView2.Environment.UserDataFolder; ; Gets the user data folder used by WebView2.
*/

/* Inventory [ view.CoreWebView2.NavigationStarting ] { WebView2, winforms }
1. view.CoreWebView2.NavigationStarting += (sender, e) => { ... }; ; Subscribes to the NavigationStarting event, triggered before any navigation begins.
2. e.Uri ; Gets the full URI being navigated to as a string.
3. e.Cancel = true ; Cancels the navigation if set to true, preventing the WebView from loading the target URL.
4. e.IsUserInitiated ; Indicates whether the navigation was started by a user gesture (e.g., link click).
5. e.NavigationId ; Unique ID for the navigation instance, useful for tracking or debugging.
6. string currentUrl = webView.CoreWebView2.Source;
*/

/* Inventory [ DllImport ] { C# } 
1. [DllImport("user32.dll")] ; Import functions from User32 (Windows UI handling)
2. [DllImport("kernel32.dll")] ; Import functions from Kernel32 (system-level operations)
3. [DllImport("advapi32.dll")] ; Import functions for advanced Windows API (registry, security)
4. [DllImport("gdi32.dll")] ; Import functions for Graphics Device Interface (drawing, fonts)
5. [DllImport("winmm.dll")] ; Import functions for Windows Multimedia API (sound, timers)
6. [DllImport("ws2_32.dll")] ; Import functions for Winsock (network communication)
7. [DllImport("shell32.dll")] ; Import functions for Shell operations (file associations, icons)
8. [DllImport("ole32.dll")] ; Import functions for OLE (COM object handling)
9. [DllImport("comdlg32.dll")] ; Import functions for common dialogs (file open/save)
10. [DllImport("shlwapi.dll")] ; Import functions for Shell Lightweight Utility APIs (string/path helpers)
=== examples === 
1. [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
   public static extern int MessageBox(IntPtr hWnd, string text, string caption, uint type);
   ; Displays a message box with text and caption

2. [DllImport("kernel32.dll", SetLastError = true)]
   public static extern IntPtr GetModuleHandle(string lpModuleName);
   ; Retrieves a module handle for a loaded DLL

3. [DllImport("advapi32.dll", SetLastError = true, CharSet = CharSet.Unicode)]
   public static extern int RegOpenKeyEx(IntPtr hKey, string lpSubKey, uint ulOptions, int samDesired, out IntPtr phkResult);
   ; Opens a registry key

4. [DllImport("gdi32.dll", EntryPoint = "CreateFontIndirectW", CharSet = CharSet.Unicode)]
   public static extern IntPtr CreateFontIndirect([In] ref LOGFONT lplf);
   ; Creates a logical font based on LOGFONT structure

5. [DllImport("winmm.dll", SetLastError = false)]
   public static extern bool PlaySound(string pszSound, IntPtr hmod, uint fdwSound);
   ; Plays a sound from file or resource

6. [DllImport("ws2_32.dll", SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
   public static extern int send(IntPtr s, byte[] buf, int len, int flags);
   ; Sends data over a socket

7. [DllImport("shell32.dll", CharSet = CharSet.Auto)]
   public static extern bool SHGetSpecialFolderPath(IntPtr hwndOwner, [Out] StringBuilder lpszPath, int nFolder, bool fCreate);
   ; Retrieves path of a special folder (e.g., Desktop)

8. [DllImport("ole32.dll", PreserveSig = false)]
   public static extern void CoCreateInstance(ref Guid clsid, IntPtr pUnkOuter, uint dwClsContext, ref Guid iid, out IntPtr ppv);
   ; Creates a COM object instance

9. [DllImport("comdlg32.dll", CharSet = CharSet.Auto, SetLastError = true)]
   public static extern bool GetOpenFileName([In, Out] OPENFILENAME ofn);
   ; Displays the Open File dialog

10. [DllImport("shlwapi.dll", CharSet = CharSet.Unicode, ExactSpelling = true)]
    public static extern int PathCombine([Out] StringBuilder lpszDest, string lpszDir, string lpszFile);
    ; Combines directory and file name into a full path
*/

/* Inventory [ External Libraries ] { c#, .NET 10 }
1. dotnet new classlib -n MyLib // Create standalone DLL project
2. dotnet build MyLib // Compile project → outputs .dll
3. dotnet add reference ../MyLib/MyLib.csproj // Add project reference (compile-time linking)
4. <ItemGroup>
      <Reference Include="MyLib">
        <HintPath>libs/MyLib.dll</HintPath>
      </Reference>
   </ItemGroup>
   // Reference external DLL via .csproj
5. using MyLib; // Import namespace to call functions
6. File.Exists(path) // Check DLL presence before load
7. Assembly.LoadFrom(path) // Dynamically load DLL at runtime
8. assembly.GetType("MyLib.MyClass") // Get class type via reflection
9. Activator.CreateInstance(type) // Instantiate class dynamically
10. method.Invoke(obj, args) // Call function from loaded DLL
*/

// ================================================ Divination 

/* Inventory [ ScottPlot ] { c# }
1. new FormsPlot() ; Initializes a ScottPlot plotting control for Windows Forms
2. formsPlot.Plot ; Accesses the Plot object to configure and render graphs (v5+)
3. Plot.Add.Scatter(xs, ys) ; Adds a scatter plot with connected lines
4. Plot.Add.Signal(ys) ; Plots evenly spaced data along the X-axis (faster for large datasets)
5. Plot.Add.Bar(values) ; Creates a bar chart with the given Y-values
6. Plot.Add.Pie(values) ; Displays a pie chart with proportional slices
7. Plot.Title("text") ; Sets the plot title
8. Plot.XLabel("label") ; Sets the X-axis label
9. Plot.YLabel("label") ; Sets the Y-axis label
10. Plot.Legend() ; Displays a legend using labels from added plots
11. Plot.SetAxisLimits(xMin, xMax, yMin, yMax) ; Manually sets axis limits
12. Plot.SavePng("path.png", width, height) ; Saves the chart as a PNG image
13. Plot.Clear() ; Removes all existing plots and resets the chart
14. Plot.ShowLegend = true ; Enables or disables the legend display
15. formsPlot.Refresh() ; Redraws the chart after updates
*/

/* Inventory [ Array Range Generators ] { ScottPlot, c# }
1. Enumerable.Range(start, count).Select(x => (double)x).ToArray() ; Creates a double array from an integer range
2. xs.Select(x => Math.Sin(x)).ToArray() ; Applies a mathematical function (e.g., sine) to each X-value
3. DataGen.Consecutive(count) ; Generates an array of consecutive doubles: 0, 1, 2, ..., count-1 (available in ScottPlot demo utilities)
4. DataGen.Sin(count) ; Generates Y-values as sine of consecutive X-values (available in ScottPlot demo utilities)
5. Generate.Sin(double[] xs) ; Computes sin(x) for each element in a custom X array (ScottPlot 5+ `ScottPlot.Statistics.Generate`)
6. Generate.Cos(double[] xs) ; Computes cos(x) for each element in a custom X array
7. Generate.Random(count) ; Creates an array of random doubles (0 to 1) for quick testing
8. Generate.Range(start, increment, count) ; Produces an array with evenly spaced values (e.g., 0.0, 0.1, 0.2...) — useful for non-integer spacing
9. Generate.Noise(count, seed) ; Creates random Y-values using a seed for reproducibility
10. Generate.SineWave(frequency, sampleRate, pointCount) ; Produces a sampled sine wave (used for signal plots)
11. using ScottPlot.Statistics.Generate; ; ... 
*/

/* Inventory [ Theme and Customization ] { ScottPlot, c# }
1. Plot.Style(Style.Default) ; Applies a built-in theme (Light, Dark, Gray, Blue, etc.)
2. Plot.FigureBackground.Color = Colors.White ; Sets the background color of the entire plot
3. Plot.DataBackground.Color = Colors.LightGray ; Sets the background color of the data area (plot region)
4. Plot.XAxis.Label.Text = "X Axis" ; Sets the label text for the X-axis
5. Plot.YAxis.Label.Text = "Y Axis" ; Sets the label text for the Y-axis
6. Plot.Title("My Chart") ; Sets the title of the plot
7. Plot.XAxis.TickLabelStyle(fontSize: 14, color: Colors.Red) ; Customizes the tick label appearance for the X-axis
8. Plot.YAxis.LineStyle.Width = 2 ; Changes axis line thickness
9. Plot.XAxis.MajorGrid.LineStyle = LineStyle.Dash ; Customizes grid line style for X-axis
10. Plot.Layout.OuterMargin = 50 ; Adjusts outer margins (in pixels) around the plot
11. Plot.Legend.IsVisible = true ; Shows or hides the legend
12. Plot.Legend.FontSize = 16 ; Sets font size for the legend
13. Plot.Legend.BackgroundColor = Colors.Transparent ; Makes legend background transparent
14. Plot.Style(Style.FromColors(bg, fg, grid, frame)) ; Defines a custom color theme
15. Plot.Render() ; Applies all visual customizations and redraws the plot
*/

// -- END 

		
		