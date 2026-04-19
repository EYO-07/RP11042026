// {TextMarker|cyan:>>>,<<<,TODO|red:ISSUE|yellow:INCOMPLETE,DEPRECATED}
// -- BEGIN 
// CODEX_DarkQtScintilla.cpp
#include "CODEX_DarkQtScintilla.h"
#include <Qsci/qscicommandset.h>
#include <Qsci/qscicommand.h>
#include <QShortcut>      
#include <QKeySequence>   
#include <QSet>
using namespace CodexTransmutation;
using namespace CodexIncantation;

// variables
QColor bgColor(0, 0, 0, 120); 
QColor fgColor("white"); 
QColor caretColor("#528bff");
QColor selectionColor("#3e4451");
QColor stringColor(255,100,100);
QColor stringPaperColor(50,0,0);
QColor commentColor(0, 204, 153);
QColor commentPaperColor(0, 50, 0);
QColor numberColor(0,255,255);
QColor numberPaperColor(0,0,100);
QColor braceMatchColor("cyan");
QColor braceMatchBackgroundColor(0,0,0);
QColor operatorColor(230,230,0);
QColor preprocessorColor(153, 153, 102);
QColor keyword1("silver");
QColor keyword2("lightblue");
QFont FONT("Monospace",8,QFont::Bold);
QFont MARGIN_FONT("Monospace",8);
QSet<QString> FILE_EXT_LEXER_CPP = {"h", "hpp", "hxx", "hh","c", "cpp", "cxx", "cc"};
QSet<QString> FILE_EXT_LEXER_PYTHON = {"py", "pyw"};
QSet<QString> FILE_EXT_LEXER_JAVA = {"java"};
QSet<QString> FILE_EXT_LEXER_JS = {"js", "mjs", "cjs"};
QSet<QString> FILE_EXT_LEXER_TS = {"ts", "tsx"};
QSet<QString> FILE_EXT_LEXER_HTML = {"html", "htm", "xhtml"};
QSet<QString> FILE_EXT_LEXER_XML = {"xml", "xsd", "xslt", "svg"};
QSet<QString> FILE_EXT_LEXER_CSS = {"css", "scss", "sass", "less"};
QSet<QString> FILE_EXT_LEXER_JSON = {"json"};
QSet<QString> FILE_EXT_LEXER_SHELL = {"sh", "bash", "zsh", "ksh"};
QSet<QString> FILE_EXT_LEXER_BATCH = {"bat", "cmd"};
QSet<QString> FILE_EXT_LEXER_SQL = {"sql"};
QSet<QString> FILE_EXT_LEXER_PHP = {"php", "phtml", "php3", "php4", "php5", "php7", "php8"};
QSet<QString> FILE_EXT_LEXER_RUBY = {"rb", "erb", "rake"};
QSet<QString> FILE_EXT_LEXER_PERL = {"pl", "pm", "t"};
QSet<QString> FILE_EXT_LEXER_LUA = {"lua"};
QSet<QString> FILE_EXT_LEXER_MARKDOWN = {"md", "markdown"};
QSet<QString> FILE_EXT_LEXER_YAML = {"yaml", "yml"};
QSet<QString> FILE_EXT_LEXER_INI = {"ini", "cfg", "conf"};
QHash<QsciScintilla*, QHash<QString, QVariant>> SCINTILLA_DATA;
QRegularExpression directiveRegex(R"(\{TextMarker\|([^}]+)\})");

// ===================================================================================

// Incantation 

// -- local functions 
void lexerPostSettings(QsciScintilla* editor) {
    editor->setAutoIndent(true);
    editor->setIndentationsUseTabs(false);
    editor->setTabWidth(4);
    editor->setIndentationGuides(true);
    editor->setCaretLineVisible(true);        
    editor->setWrapMode(QsciScintilla::WrapWord);
    editor->setBraceMatching(QsciScintilla::StrictBraceMatch);
    editor->setCaretLineBackgroundColor(QColor("#2c313c"));
    editor->setCaretForegroundColor(caretColor);
    editor->setMarginType(1, QsciScintilla::NumberMargin);
    editor->setMarginLineNumbers(1, true);
    editor->setMarginWidth(1, "0000");
    editor->setMarginsFont(MARGIN_FONT);
    editor->setMarginsBackgroundColor(QColor(10,10,10));
    editor->setMarginsForegroundColor(fgColor);
    editor->setMatchedBraceForegroundColor(braceMatchColor);
    editor->setMatchedBraceBackgroundColor(braceMatchBackgroundColor);
    editor->setUnmatchedBraceBackgroundColor(bgColor);
    editor->setUnmatchedBraceForegroundColor(operatorColor);
    editor->setSelectionBackgroundColor(selectionColor);
    editor->setUtf8(true);
    editor->lexer()->setFont(FONT);
    editor->setFont(FONT);
    editor->SendScintilla(QsciScintilla::SCI_SETEXTRAASCENT, 0);
    editor->SendScintilla(QsciScintilla::SCI_SETEXTRADESCENT, 0);
    // 1. Set the selection background color (e.g., a nice blue)
    //QColor selBack("#264f78"); 
    //editor->SendScintilla(QsciScintilla::SCI_SETLISTSELBACK, selBack.rgb());
    // 2. Set the selection foreground color (e.g., white text)
    //QColor selFore("#ffffff");
    //editor->SendScintilla(QsciScintilla::SCI_SETLISTSELFORE, selFore.rgb());
}
void registerEditor(QsciScintilla* editor) {
    if (!editor) return;
    if ( SCINTILLA_DATA.contains(editor) ) return;
    // SCINTILLA_DATA[editor] = QHash<QString, QVariant>(); // not necessary
    QObject::connect(editor, &QObject::destroyed, [editor]() {
        SCINTILLA_DATA.remove(editor);
    });
}
void clearIndicators(QsciScintilla* editor) {
    for (int id = 8; id <= 20; ++id) {
        editor->clearIndicatorRange(0, 0, editor->lines() - 1, editor->lineLength(editor->lines() - 1), id);
    }
}
void setIndicator(QsciScintilla* editor, int indicatorId, QColor color) { // ISSUE full box missing bottom line 
    editor->indicatorDefine(QsciScintilla::StraightBoxIndicator, indicatorId);
    editor->setIndicatorForegroundColor(color, indicatorId);
    editor->SendScintilla(QsciScintilla::SCI_SETINDICATORCURRENT, indicatorId);
    editor->SendScintilla(QsciScintilla::SCI_INDICSETALPHA, indicatorId, 60);
    editor->SendScintilla(QsciScintilla::SCI_INDICSETOUTLINEALPHA, indicatorId, 255);
    editor->SendScintilla(QsciScintilla::SCI_INDICSETUNDER, indicatorId, true);
}

// -- implementations
QsciScintilla* CodexIncantation::newDarkScintilla(QWidget *parent, QString fileName) {
    QsciScintilla *editor = new QsciScintilla(parent);
    editor->viewport()->setAutoFillBackground(false);
    editor->setAutoFillBackground(false);
    editor->setAttribute(Qt::WA_TranslucentBackground);
    editor->setAttribute(Qt::WA_OpaquePaintEvent, false);
    editor->setUtf8(true);
    editor->setFont(FONT);
    //editor->setStyleSheet("border: none; background-color: rgba(0,0,0,120);");
    // CRITICAL: Some lexers need this property set via Scintilla's internal API
    editor->SendScintilla(QsciScintilla::SCI_SETPROPERTY, "fold", "1");
    editor->SendScintilla(QsciScintilla::SCI_SETPROPERTY, "fold.compact", "0");
    editor->SendScintilla(QsciScintilla::SCI_SETBUFFEREDDRAW, true);
    //
    CodexIncantation::setLexer(editor, fileName);
    CodexIncantation::setLexerFolding(editor, fileName);
    lexerPostSettings(editor);
    CodexIncantation::setAutocompletion(editor);
    return editor;
}
void CodexIncantation::onTextChange(QsciScintilla* editor, std::function<void(QsciScintilla*)> logic) {
    if (!editor) return;
    QObject::connect(editor, &QsciScintilla::textChanged, editor, [editor, logic]() {
        if (logic) {
            logic(editor);
        }
    });
}
void CodexIncantation::toggleCurrentFold(QsciScintilla *editor) {
    int line = editor->SendScintilla(QsciScintilla::SCI_LINEFROMPOSITION, editor->SendScintilla(QsciScintilla::SCI_GETCURRENTPOS));
    editor->SendScintilla(QsciScintilla::SCI_TOGGLEFOLD, line);
}
bool CodexIncantation::setLexer(QsciScintilla* editor, QString fileName) { 
    if (!editor) return false;
    // Logic [ setLexer ] -> setLexer() || $ext | %% choose lexer 
    // setLexer() || $ext
    QString ext = getExtension(fileName);
    // setLexer() || $ext | %% choose lexer 
    // } else if ( .contains(ext) ) {
    if ( FILE_EXT_LEXER_CPP.contains(ext) ) {
        QsciLexerCPP* lexer = new QsciLexerCPP(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        lexer->setFoldPreprocessor(true);
        lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        // -- cpp style 
        lexer->setHighlightTripleQuotedStrings(true);
        lexer->setHighlightHashQuotedStrings(true);
        lexer->setHighlightBackQuotedStrings(true);
        lexer->setColor(fgColor, QsciLexerCPP::Default);
        lexer->setPaper(bgColor, QsciLexerCPP::Default);
        lexer->setColor(commentColor, QsciLexerCPP::Comment); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::Comment);
        lexer->setColor(commentColor, QsciLexerCPP::CommentLine);
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentLine);
        lexer->setColor(commentColor, QsciLexerCPP::CommentDoc); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentDoc);
        lexer->setColor(numberColor, QsciLexerCPP::Number); 
        lexer->setPaper(numberPaperColor, QsciLexerCPP::Number);
        lexer->setColor(keyword1, QsciLexerCPP::Keyword);      
        lexer->setColor(stringColor, QsciLexerCPP::DoubleQuotedString); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::DoubleQuotedString); 
        lexer->setColor(stringColor, QsciLexerCPP::SingleQuotedString); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::SingleQuotedString); 
        lexer->setColor(preprocessorColor, QsciLexerCPP::PreProcessor); 
        lexer->setColor(operatorColor, QsciLexerCPP::Operator); 
        lexer->setColor(fgColor, QsciLexerCPP::Identifier); 
        lexer->setColor(stringColor, QsciLexerCPP::UnclosedString); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::UnclosedString); 
        lexer->setColor(stringColor, QsciLexerCPP::VerbatimString); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::VerbatimString); 
        lexer->setColor(stringColor, QsciLexerCPP::Regex); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::Regex); 
        lexer->setColor(commentColor, QsciLexerCPP::CommentLineDoc); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentLineDoc);
        lexer->setColor(keyword2, QsciLexerCPP::KeywordSet2);   
        lexer->setColor(commentColor, QsciLexerCPP::CommentDocKeyword); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentDocKeyword);
        lexer->setColor(commentColor, QsciLexerCPP::CommentDocKeywordError); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentDocKeywordError);
        lexer->setColor(stringColor, QsciLexerCPP::RawString);
        lexer->setPaper(stringPaperColor, QsciLexerCPP::RawString); 
        lexer->setColor(stringColor, QsciLexerCPP::TripleQuotedVerbatimString);
        lexer->setPaper(stringPaperColor, QsciLexerCPP::TripleQuotedVerbatimString);
        // -- 
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_PYTHON.contains(ext) ) {
        QsciLexerPython* lexer = new QsciLexerPython(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        // -- Python style 
        lexer->setColor(fgColor, QsciLexerPython::Default);
        lexer->setPaper(bgColor, QsciLexerPython::Default);
        lexer->setColor(commentColor, QsciLexerPython::Comment); 
        lexer->setPaper(commentPaperColor, QsciLexerPython::Comment);
        lexer->setColor(numberColor, QsciLexerPython::Number); 
        lexer->setPaper(numberPaperColor, QsciLexerPython::Number);
        lexer->setColor(keyword1, QsciLexerPython::Keyword); 
        lexer->setColor(stringColor, QsciLexerPython::DoubleQuotedString); 
        lexer->setPaper(stringPaperColor, QsciLexerPython::DoubleQuotedString); 
        lexer->setColor(stringColor, QsciLexerPython::SingleQuotedString); 
        lexer->setPaper(stringPaperColor, QsciLexerPython::SingleQuotedString); 
        lexer->setColor(operatorColor, QsciLexerPython::Operator); 
        lexer->setColor(fgColor, QsciLexerPython::Identifier); 
        lexer->setColor(stringColor, QsciLexerPython::UnclosedString); 
        lexer->setPaper(stringPaperColor, QsciLexerPython::UnclosedString); 
        lexer->setColor(preprocessorColor, QsciLexerPython::Decorator);
        lexer->setColor(stringColor, QsciLexerPython::DoubleQuotedFString);
        lexer->setPaper(stringPaperColor, QsciLexerPython::DoubleQuotedFString);
        lexer->setColor(stringColor, QsciLexerPython::SingleQuotedFString);
        lexer->setPaper(stringPaperColor, QsciLexerPython::SingleQuotedFString);
        lexer->setColor(keyword2, QsciLexerPython::ClassName);
        lexer->setColor(keyword2, QsciLexerPython::FunctionMethodName);
        //
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_JAVA.contains(ext) ) {
        QsciLexerJava* lexer = new QsciLexerJava(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        lexer->setFoldPreprocessor(true);
        lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_JS.contains(ext) ) {
        QsciLexerJavaScript* lexer = new QsciLexerJavaScript(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        lexer->setFoldPreprocessor(true);
        lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_TS.contains(ext) ) {
        QsciLexerJavaScript* lexer = new QsciLexerJavaScript(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        lexer->setFoldPreprocessor(true);
        lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_HTML.contains(ext) ) {
        QsciLexerHTML* lexer = new QsciLexerHTML(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        //lexer->setFoldComments(true);
        lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_XML.contains(ext) ) {
        QsciLexerXML* lexer = new QsciLexerXML(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        //lexer->setFoldComments(true);
        lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_CSS.contains(ext) ) {
        QsciLexerCSS* lexer = new QsciLexerCSS(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_JSON.contains(ext) ) {
        QsciLexerJSON* lexer = new QsciLexerJSON(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        //lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_SHELL.contains(ext) ) {
        QsciLexerBash* lexer = new QsciLexerBash(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        // -- Bash style
        // Base colors
        lexer->setColor(fgColor, QsciLexerBash::Default);
        lexer->setPaper(bgColor, QsciLexerBash::Default);
        // Comments
        lexer->setColor(commentColor, QsciLexerBash::Comment);
        lexer->setPaper(commentPaperColor, QsciLexerBash::Comment);
        // Numbers and Keywords
        lexer->setColor(numberColor, QsciLexerBash::Number);
        lexer->setColor(keyword1, QsciLexerBash::Keyword);
        // Strings
        lexer->setColor(stringColor, QsciLexerBash::DoubleQuotedString);
        lexer->setPaper(stringPaperColor, QsciLexerBash::DoubleQuotedString);
        lexer->setColor(stringColor, QsciLexerBash::SingleQuotedString);
        lexer->setPaper(stringPaperColor, QsciLexerBash::SingleQuotedString);
        // Operators
        lexer->setColor(operatorColor, QsciLexerBash::Operator);
        // Variables (mapped to Identifier/Scalar)
        // In Bash, variables like $VAR are "Scalars"
        lexer->setColor(fgColor, QsciLexerBash::Identifier);
        lexer->setColor(preprocessorColor, QsciLexerBash::Scalar); 
        // Special Bash Features
        lexer->setColor(stringColor, QsciLexerBash::Backticks); // `command`
        lexer->setColor(keyword2, QsciLexerBash::ParameterExpansion); // ${VAR}
        // Errors
        lexer->setColor(stringColor, QsciLexerBash::Error);
        // 
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_BATCH.contains(ext) ) {
        QsciLexerBatch* lexer = new QsciLexerBatch(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        //lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        //lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_SQL.contains(ext) ) {
        QsciLexerSQL* lexer = new QsciLexerSQL(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_PHP.contains(ext) ) {
        QsciLexerHTML* lexer = new QsciLexerHTML(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        //lexer->setFoldComments(true);
        lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_RUBY.contains(ext) ) {
        QsciLexerRuby* lexer = new QsciLexerRuby(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_PERL.contains(ext) ) {
        QsciLexerPerl* lexer = new QsciLexerPerl(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_LUA.contains(ext) ) {
        QsciLexerLua* lexer = new QsciLexerLua(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        //lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_MARKDOWN.contains(ext) ) {
        QsciLexerMarkdown* lexer = new QsciLexerMarkdown(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        //lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        //lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_YAML.contains(ext) ) {
        QsciLexerYAML* lexer = new QsciLexerYAML(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        //lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else if ( FILE_EXT_LEXER_INI.contains(ext) ) {
        QsciLexerProperties* lexer = new QsciLexerProperties(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        //lexer->setFoldComments(true);
        //lexer->setFoldPreprocessor(true);
        //lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        editor->setLexer(lexer);
        return true;
    } else { // Default Lexer 
        QsciLexerCPP* lexer = new QsciLexerCPP(editor);
        lexer->setDefaultPaper(bgColor);
        lexer->setDefaultColor(fgColor);
        lexer->setFoldComments(true);
        lexer->setFoldPreprocessor(true);
        lexer->setFoldAtElse(true);
        lexer->setFoldCompact(false);
        // -- cpp style 
        lexer->setHighlightTripleQuotedStrings(true);
        lexer->setHighlightHashQuotedStrings(true);
        lexer->setHighlightBackQuotedStrings(true);
        lexer->setColor(fgColor, QsciLexerCPP::Default);
        lexer->setPaper(bgColor, QsciLexerCPP::Default);
        lexer->setColor(commentColor, QsciLexerCPP::Comment); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::Comment);
        lexer->setColor(commentColor, QsciLexerCPP::CommentLine);
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentLine);
        lexer->setColor(commentColor, QsciLexerCPP::CommentDoc); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentDoc);
        lexer->setColor(numberColor, QsciLexerCPP::Number); 
        lexer->setPaper(numberPaperColor, QsciLexerCPP::Number);
        lexer->setColor(keyword1, QsciLexerCPP::Keyword);      
        lexer->setColor(stringColor, QsciLexerCPP::DoubleQuotedString); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::DoubleQuotedString); 
        lexer->setColor(stringColor, QsciLexerCPP::SingleQuotedString); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::SingleQuotedString); 
        lexer->setColor(preprocessorColor, QsciLexerCPP::PreProcessor); 
        lexer->setColor(operatorColor, QsciLexerCPP::Operator); 
        lexer->setColor(fgColor, QsciLexerCPP::Identifier); 
        lexer->setColor(stringColor, QsciLexerCPP::UnclosedString); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::UnclosedString); 
        lexer->setColor(stringColor, QsciLexerCPP::VerbatimString); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::VerbatimString); 
        lexer->setColor(stringColor, QsciLexerCPP::Regex); 
        lexer->setPaper(stringPaperColor, QsciLexerCPP::Regex); 
        lexer->setColor(commentColor, QsciLexerCPP::CommentLineDoc); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentLineDoc);
        lexer->setColor(keyword2, QsciLexerCPP::KeywordSet2);   
        lexer->setColor(commentColor, QsciLexerCPP::CommentDocKeyword); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentDocKeyword);
        lexer->setColor(commentColor, QsciLexerCPP::CommentDocKeywordError); 
        lexer->setPaper(commentPaperColor, QsciLexerCPP::CommentDocKeywordError);
        lexer->setColor(stringColor, QsciLexerCPP::RawString);
        lexer->setPaper(stringPaperColor, QsciLexerCPP::RawString); 
        lexer->setColor(stringColor, QsciLexerCPP::TripleQuotedVerbatimString);
        lexer->setPaper(stringPaperColor, QsciLexerCPP::TripleQuotedVerbatimString);
        // -- 
        editor->setLexer(lexer);
        return true;
    }
    
}
bool CodexIncantation::setLexerFolding(QsciScintilla* editor, QString fileName) {
    if(!editor) return false;
    QString ext = getExtension(fileName);
    // -- 
    editor->setFolding(QsciScintilla::BoxedTreeFoldStyle);
    editor->setFoldMarginColors(QColor("#21252b"), QColor("#21252b"));
    editor->setMarkerForegroundColor(fgColor);
    auto toBGR = [](QColor c) -> long { return (c.blue() << 16) | (c.green() << 8) | c.red(); };
    long bgrBack = toBGR(bgColor);
    long bgrFore = toBGR(fgColor);
    
    for (int i = 25; i <= 31; ++i) { // Range 25-31 covers all standard folding/outlining symbols
        editor->SendScintilla(QsciScintilla::SCI_MARKERSETBACK, i, bgrBack);
        editor->SendScintilla(QsciScintilla::SCI_MARKERSETFORE, i, bgrFore);
        // OPTIONAL: If using BoxedTree, you can also set the 'plus' sign color specifically
        // by making sure the marker is actually drawn as a box
        editor->SendScintilla(QsciScintilla::SCI_MARKERSETBACKSELECTED, i, bgrFore);
    }  
    return true;
}
void CodexIncantation::setAutocompletion(QsciScintilla* editor) {
    if (!editor || !editor->lexer()) return;
    if (editor->lexer()->apis()) return;
    // Link APIs to the existing lexer
    QsciAPIs* apis = new QsciAPIs(editor->lexer());
    // Configure Scintilla behavior
    editor->setAutoCompletionSource(QsciScintilla::AcsAPIs);
    editor->setAutoCompletionThreshold(3);
    editor->setAutoCompletionCaseSensitivity(false);
    editor->setAutoCompletionReplaceWord(false);
}
void CodexIncantation::updateAutocompletion_Range(QsciScintilla* editor) {
    int range = 50;
    QsciLexer* lexer = editor->lexer();
    if (!lexer || !editor) return;      
    QsciAPIs* apis = dynamic_cast<QsciAPIs*>(lexer->apis());
    if (!apis) return;
    // 1. Calculate line range
    int currentLine, index;
    editor->getCursorPosition(&currentLine, &index);
    int startLine = std::max(0, currentLine - range);
    int endLine = std::min(editor->lines() - 1, currentLine + range);
    // 2. Extract text (using Scintilla range is faster than editor->text().mid)
    int startPos = editor->SendScintilla(QsciScintilla::SCI_POSITIONFROMLINE, startLine);
    int endPos = editor->SendScintilla(QsciScintilla::SCI_GETLINEENDPOSITION, endLine);
    QString rangeText = editor->text(startPos, endPos); // Qt-native way to get range
    // 3. Get the existing word set from cache
    QHash<QString, QVariant>& data = SCINTILLA_DATA[editor]; 
    QSet<QString> knownWords = data.value("knownWords").value<QSet<QString>>();
    // 4. Tokenize and Add
    QRegularExpression re("\\b[A-Za-z_]\\w{2,}\\b");
    QRegularExpressionMatchIterator i = re.globalMatch(rangeText);
    QString currentWord = CodexIncantation::getCurrentTypingWord(editor);
    bool addedAny = false;
    while (i.hasNext()) {
        QString word = i.next().captured();
        if (knownWords.contains(word)) continue;
        if (word==currentWord) continue;
        knownWords.insert(word);
        apis->add(word);
        addedAny = true;
    }
    // 5. Finalize
    if (addedAny) {
        // Save the updated set back to the QVariant hash
        data.insert("knownWords", QVariant::fromValue(knownWords));
        apis->prepare();
    }
}
void CodexIncantation::updateAutocompletion_Full(QsciScintilla* editor) {
    QsciLexer* lexer = editor->lexer();
    if (!lexer || !editor) return;      
    QsciAPIs* apis = dynamic_cast<QsciAPIs*>(lexer->apis());
    if (!apis) return;

    // 1. Get current cache
    QHash<QString, QVariant>& data = SCINTILLA_DATA[editor]; 
    QSet<QString> knownWords = data.value("knownWords").value<QSet<QString>>();

    // 2. Scan text
    // Optimization: If file is huge, consider scanning in chunks 
    // but for now, we use the full text.
    QString fullText = editor->text();
    QRegularExpression re("\\b[A-Za-z_]\\w{2,}\\b");
    QRegularExpressionMatchIterator i = re.globalMatch(fullText);

    bool addedAny = false;
    while (i.hasNext()) {
        QString word = i.next().captured();
        if (!knownWords.contains(word)) {
            knownWords.insert(word);
            apis->add(word); // Only adding genuinely NEW words
            addedAny = true;
        }
    }

    // 3. Finalize
    if (addedAny) {
        // DO NOT call apis->clear() here or you lose the work above!
        data.insert("knownWords", QVariant::fromValue(knownWords));
        apis->prepare();
    }
}
QString CodexIncantation::getCurrentTypingWord(QsciScintilla* editor) {
    int line, index;
    editor->getCursorPosition(&line, &index);
    return editor->wordAtLineIndex(line, index);
}
void CodexIncantation::applyIndicatorsFromTextDirectives(QsciScintilla* editor) {
    if (!editor) return;
    clearIndicators(editor);
    int maxLine = std::min(100, editor->lines());
    int indicatorId = 8; 
    for (int i = 0; i < maxLine; ++i) {
        QString lineText = editor->text(i);
        QRegularExpressionMatch match = directiveRegex.match(lineText);
        if (match.hasMatch()) {
            QStringList groups = match.captured(1).split('|', Qt::SkipEmptyParts);
            for (const QString& group : groups) {
                QStringList parts = group.split(':');
                if (parts.size() < 2 || indicatorId > 31) continue;
                QColor color(parts[0].trimmed());
                QStringList tokens = parts[1].split(',', Qt::SkipEmptyParts);
                // Setup Indicator
                setIndicator(editor, indicatorId, color);
                for (const QString& token : tokens) {
                    QString cleanToken = token.trimmed();
                    if (cleanToken.isEmpty()) continue;
                    // --- TARGET SEARCH LOGIC (The Fix) ---
                    QByteArray bytes = cleanToken.toUtf8();
                    int docLength = editor->SendScintilla(QsciScintilla::SCI_GETLENGTH);
                    // Reset search range to full document for every new token
                    editor->SendScintilla(QsciScintilla::SCI_SETTARGETSTART, 0);
                    editor->SendScintilla(QsciScintilla::SCI_SETTARGETEND, docLength);
                    // Match whole words only (2) | Case sensitive (0 or 4)
                    editor->SendScintilla(QsciScintilla::SCI_SETSEARCHFLAGS, 2); 
                    while (editor->SendScintilla(QsciScintilla::SCI_SEARCHINTARGET, bytes.length(), bytes.constData()) != -1) {
                        int mStart = editor->SendScintilla(QsciScintilla::SCI_GETTARGETSTART);
                        int mEnd = editor->SendScintilla(QsciScintilla::SCI_GETTARGETEND);
                        // Apply indicator using raw positions
                        editor->SendScintilla(QsciScintilla::SCI_INDICATORFILLRANGE, mStart, mEnd - mStart);
                        // Move search target past the current match
                        editor->SendScintilla(QsciScintilla::SCI_SETTARGETSTART, mEnd);
                        editor->SendScintilla(QsciScintilla::SCI_SETTARGETEND, docLength);
                    }
                }
                indicatorId++; 
            }
        }
    }
}

// Incantation || namespace TabbedSplitView 
QsciScintilla* TabbedSplitView::addLeftTab_Scintilla(QSplitter* view, QString name) {
    QsciScintilla* result = CodexIncantation::newDarkScintilla(view);
    TabbedSplitView::addLeftTab(view, name, *result);
    return result;
}
QsciScintilla* TabbedSplitView::addRightTab_Scintilla(QSplitter* view, QString name) {
    QsciScintilla* result = CodexIncantation::newDarkScintilla(view);
    TabbedSplitView::addRightTab(view, name, *result);
    return result;
}
QsciScintilla* TabbedSplitView::dialogScintillaTabLoad(QTabWidget* tabs) {
    if (!tabs) return nullptr;
    QSplitter* splitter = findClosestParent<QSplitter>(tabs);
    if (!splitter) return nullptr;
    QString fileName = QFileDialog::getOpenFileName(tabs);
    if ( fileName.isNull() || fileName.isEmpty() ) return nullptr;
    if (TabbedSplitView::isFileAlreadyOpened(tabs,fileName)) { 
        QMessageBox::warning(tabs, "Aborted", "File is Already Opened");
        return nullptr; 
    }
    QString new_tab_text = getShortFileName(fileName);
    if (new_tab_text.isNull() || new_tab_text.isEmpty()) return nullptr;
    QsciScintilla* editor = CodexIncantation::newDarkScintilla(splitter, fileName); // work-around
    if (!editor) return nullptr;
    int tabIndex = tabs->addTab(editor, QString("[ ")+new_tab_text+QString(" ]"));
    if (tabIndex == -1) return nullptr;    
    tabs->setTabText(tabIndex, QString("[ ")+new_tab_text+QString(" ]"));
    tabs->tabBar()->setTabData(tabIndex, QVariant(fileName));
    QString content = loadFile(fileName);
    editor->blockSignals(true);
    editor->setText(content);
    editor->blockSignals(false);
    CodexIncantation::updateAutocompletion_Full(editor);
    editor->setReadOnly(true);
    editor->foldAll(true);
    editor->setFocus();
    return editor;
}
QsciScintilla* TabbedSplitView::loadScintillaFromFilename(QTabWidget* tabs, QString fileName) {
    if (!tabs) return nullptr;
    QSplitter* splitter = findClosestParent<QSplitter>(tabs);
    if (!splitter) return nullptr;
    fileName = fileExists(fileName);
    if (fileName.isEmpty() || fileName.isNull()) return nullptr;
    if (TabbedSplitView::isFileAlreadyOpened(tabs,fileName)) { 
        QMessageBox::warning(tabs, "Aborted", "File is Already Opened");
        return nullptr; 
    }
    QString new_tab_text = getShortFileName(fileName);
    if (new_tab_text.isNull() || new_tab_text.isEmpty()) return nullptr;
    QsciScintilla* editor = CodexIncantation::newDarkScintilla(splitter, fileName); // work-around
    if (!editor) return nullptr;
    int tabIndex = tabs->addTab(editor, QString("[ ")+new_tab_text+QString(" ]"));
    if (tabIndex == -1) return nullptr;    
    tabs->tabBar()->setTabData(tabIndex, QVariant(fileName));
    QString content = loadFile(fileName);
    editor->blockSignals(true);
    editor->setText(content);
    editor->blockSignals(false); 
    CodexIncantation::updateAutocompletion_Full(editor);
    editor->setReadOnly(true);
    editor->foldAll(true);
    return editor;
}
bool TabbedSplitView::isFileAlreadyOpened(QSplitter* splitter, QString absFilepath) {
    if (absFilepath.isNull() || absFilepath.isEmpty()) return false;
    QTabWidget* ltabs = TabbedSplitView::getTabsByName(splitter,"leftTabs");
    QTabWidget* rtabs = TabbedSplitView::getTabsByName(splitter,"rightTabs");
    if(!ltabs || !rtabs) return false; 
    // QMessageBox::warning(nullptr, "Debug", "here");
    int fresult = -1;
    fresult = TabbedSplitView::foreachTab(ltabs, 
        [absFilepath](int tabIndex, QWidget* widget, QTabWidget* tabs)->int {
            if (!widget) return 0;
            QVariant data = tabs->tabBar()->tabData(tabIndex);
            if (!data.isValid() || data.isNull()) return 0;
            QString data_stored_path = data.value<QString>();
            if (data_stored_path == absFilepath) return 1;
            return 0;
        }
    );
    if (fresult == 1) return true;
    fresult = TabbedSplitView::foreachTab(rtabs, 
        [absFilepath](int tabIndex, QWidget* widget, QTabWidget* tabs)->int {
            if (!widget) return 0;
            QVariant data = tabs->tabBar()->tabData(tabIndex);
            if (!data.isValid() || data.isNull()) return 0;
            QString data_stored_path = data.value<QString>();
            if (data_stored_path == absFilepath) return 1;
            return 0;
        }
    );
    if (fresult == 1) return true;
    return false;
}
bool TabbedSplitView::isFileAlreadyOpened(QTabWidget* currentTabs, QString absFilepath) {
    QSplitter* splitter = CodexIncantation::findClosestParent<QSplitter>(currentTabs);
    if (!splitter) return false; 
    return TabbedSplitView::isFileAlreadyOpened(splitter,absFilepath);
}



// -- END 

