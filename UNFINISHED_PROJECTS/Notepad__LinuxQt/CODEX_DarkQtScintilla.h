#ifndef CODEX_DarkQtScintilla_H
#define CODEX_DarkQtScintilla_H

#include "CODEX_DarkQt.h"
#include <Qsci/qsciscintillabase.h>
#include <Qsci/qsciscintilla.h>
#include <Qsci/qscilexer.h>
#include <Qsci/qscilexercpp.h>
#include <Qsci/qscilexerpython.h>
#include <Qsci/qscilexerjava.h>
#include <Qsci/qscilexerjavascript.h>
#include <Qsci/qscilexerhtml.h>
#include <Qsci/qscilexerxml.h>
#include <Qsci/qscilexercss.h>
#include <Qsci/qscilexerjson.h>
#include <Qsci/qscilexerbash.h>
#include <Qsci/qscilexerbatch.h>
#include <Qsci/qscilexersql.h>
#include <Qsci/qscilexerruby.h>
#include <Qsci/qscilexerlua.h>
#include <Qsci/qscilexermarkdown.h>
#include <Qsci/qscilexeryaml.h>
#include <Qsci/qscilexerproperties.h>
#include <Qsci/qscilexerperl.h>

#include <QColor>
#include <QObject>
#include <QMessageBox>
#include <QSplitter>

namespace CodexIncantation {
    // functions
    QsciScintilla* newDarkScintilla(QWidget *parent = nullptr, QString fileName = "dummy.cpp");
    // void setGlobalFont(QsciScintilla *editor, const QString &family, int pointSize);
    void toggleCurrentFold(QsciScintilla *editor);
    bool setLexer(QsciScintilla* editor, QString fileName);
    bool setLexerFolding(QsciScintilla* editor, QString fileName);
    // functions || events
    void onTextChange(QsciScintilla* editor, std::function<void(QsciScintilla*)> logic);
    // -- 
    namespace TabbedSplitView {
        QsciScintilla* addLeftTab_Scintilla(QSplitter* view, QString name);
        QsciScintilla* addRightTab_Scintilla(QSplitter* view, QString name);
        QsciScintilla* addLeftTab_Scintilla(QSplitter* view, QString name, QString content);
        QsciScintilla* addRightTab_Scintilla(QSplitter* view, QString name, QString content);
        QsciScintilla* dialogScintillaTabLoad(QTabWidget* tabs);
        QsciScintilla* loadScintillaFromFilename(QTabWidget* tabs, QString fileName);
        bool isFileAlreadyOpened(QSplitter* splitter, QString absFilepath);
        bool isFileAlreadyOpened(QTabWidget* currentTabs, QString absFilepath);
    }
}


#endif // CODEX_DarkQtScintilla_H




