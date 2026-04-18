// -- BEGIN 
// Qt6 Hello World 

// ! - autocompletion
// ! - find keyword
// ! - custom textmarkers 

#include <QApplication>
#include <QPushButton>
#include <QWidget>
#include <QVBoxLayout> // Layout manager
#include <QTextEdit>
#include <QLabel>
#include "CODEX_DarkQt.h"
#include "CODEX_DarkQtScintilla.h"
using namespace CodexTransmutation;
using namespace CodexIncantation;

// global variables
int index_new_tab = 1;
// functions forward declaration
void darkTabScintillaLogic(QsciScintilla* view);
QsciScintilla* addLeftTab_Scintilla(QSplitter* view, QString name);
QsciScintilla* addRightTab_Scintilla(QSplitter* view, QString name);
bool newEmptyScintillaTab(QsciScintilla* view);

// -- 
int main(int argc, char *argv[]) {
    // Components    
    QApplication app(argc, argv);
    QMainWindow* window = new QMainWindow();
    QSplitter* splitter = TabbedSplitView::tabbedSplitView(window);
    QsciScintilla* helpPage = addLeftTab_Scintilla(splitter, "?"); 
    helpPage->setText(
        "// Notepad--LinuxQt : ported version of Notepad-- using Qt6 QScintilla \n"
        "// ... lesser version of Notepad++, less language support, fixed dark theme. \n"
        "// ... it's bit different from Notepad-- ... \n"
        "// ... don't like it? use Notepadqq instead (or Nano, or Geany, or Vim ...) \n"
        "\n"
        "1. [ TabTitle ] // ReadOnly tab, use Ctrl+R to change ReadOnly flag, by default the file opens on readonly mode \n"
        "2. * TabTitle // Is the editor text modified flag \n"
        "\n"
        "// Commands \n"
        "1. Ctrl+R // change readonly flag \n"
        "2. Ctrl+N // add an empty tab \n"
        "3. Ctrl+L // load file \n"
        "4. Ctrl+S // save file \n"
        "5. Ctrl+W // close tab \n"
        "\n"
        "1. Ctrl+Tab, Ctrl+Shift+Tab // Change Selected Tab from Current Tab Set \n"
        "\n"
        "1. Alt+V // Switch view for current tab \n"
        "2. Alt+Left, Alt+Right // Focus the Left or Right current tab \n"
    );
    helpPage->setFocus();
    { // Layout 
        // load files by argument options
        if (argc>1) {
            int i;
            bool b_left_side = true;
            for (int i = 1; i < argc; ++i) {
                QString strArgument = argv[i];
                if (strArgument=="--left") {
                    b_left_side = true;
                    continue;
                } 
                if (strArgument=="--right") {
                    b_left_side = false;
                    continue;
                }
                QString absDirPath = isDir(strArgument);
                if (!absDirPath.isEmpty() && !absDirPath.isNull()) continue;
                QString absFileName = fileExists(strArgument);
                if (absFileName.isEmpty() || absFileName.isNull()) continue;
                QTabWidget* tabs = nullptr;
                if (b_left_side) {
                    tabs = TabbedSplitView::getTabsByName(splitter, "leftTabs");
                } else {
                    tabs = TabbedSplitView::getTabsByName(splitter, "rightTabs");
                }
                QsciScintilla* editor = TabbedSplitView::loadScintillaFromFilename(tabs, absFileName);
                if (!editor) continue;
                darkTabScintillaLogic(editor);
            }
        } else {
            //addLeftTab_Scintilla(splitter, QString("(%1)").arg(index_new_tab) );
            //index_new_tab++;
            //addRightTab_Scintilla(splitter, QString("(%1)").arg(index_new_tab) );
            //index_new_tab++;
        }
    }
    { // Theme
        CodexIncantation::applyDarkTheme(window);
    }
    { // Logic 
        CodexIncantation::interceptKeyboardEvents(window, [splitter](QKeyEvent* e) -> bool {
            if (e->modifiers() == Qt::ControlModifier) {
                if (e->key() == Qt::Key_N) {
                    addLeftTab_Scintilla(splitter, QString("(%1) ...").arg(index_new_tab));
                    index_new_tab++;
                    return true;
                }
            }
            return false;
        });
    }
    // -- 
    window->setCentralWidget(splitter);
    window->resize(800, 600);
    window->show();
    auto result = app.exec();
    return result;
}

// function implementation
void darkTabScintillaLogic(QsciScintilla* view) {
    CodexIncantation::interceptKeyboardEvents(view, [view](QKeyEvent* e) -> bool {
        QTabWidget* tabs = CodexIncantation::findClosestParent<QTabWidget>(view);
        if (!tabs) return true;
        int currentTab = tabs->currentIndex();
        if (currentTab == -1) return true;
        QString prev_tab_text = tabs->tabText(currentTab);
        // -- key processing 
        if (e->modifiers() == Qt::AltModifier) {
            if (e->key() == Qt::Key_O) {
                int line, col;
                view->getCursorPosition(&line, &col);
                view->SendScintilla(QsciScintilla::SCI_TOGGLEFOLD, line);
                return true; // "Eat" the event: Scintilla won't see it
            }
            if (e->key() == Qt::Key_0) {
                view->foldAll(true);
                return true; // Stop event propagation
            }
            if (e->key() == Qt::Key_A) {}
            if (e->key() == Qt::Key_S) {}
            if (e->key() == Qt::Key_D) {}
            if (e->key() == Qt::Key_Up) {}
            if (e->key() == Qt::Key_Down) {}
            if (e->key() == Qt::Key_Left) {
                if ( tabs->objectName() == "leftTabs" ) return true;
                QSplitter* splitter = CodexIncantation::findClosestParent<QSplitter>(tabs);
                if (!splitter) return true;
                QTabWidget* left_tabs = splitter->findChild<QTabWidget*>("leftTabs");
                if (!left_tabs) return true;
                int l_currentTab = left_tabs->currentIndex();
                if (l_currentTab==-1) return true;
                QWidget* lwdg = left_tabs->widget(l_currentTab);
                if (!lwdg) return true;
                lwdg->setFocus();
                return true;
            }
            if (e->key() == Qt::Key_Right) {
                if ( tabs->objectName() == "rightTabs" ) return true;
                QSplitter* splitter = CodexIncantation::findClosestParent<QSplitter>(tabs);
                if (!splitter) return true;
                QTabWidget* right_tabs = splitter->findChild<QTabWidget*>("rightTabs");
                if (!right_tabs) return true;
                int r_currentTab = right_tabs->currentIndex();
                if (r_currentTab==-1) return true;
                QWidget* rwdg = right_tabs->widget(r_currentTab);
                if (!rwdg) return true;
                rwdg->setFocus();
                return true;
            }
            if (e->key() == Qt::Key_V) {
                QTabWidget* source = CodexIncantation::findClosestParent<QTabWidget>(view);
                QTabWidget* dest = nullptr;
                if (!source) return true;
                QSplitter* splitter = CodexIncantation::findClosestParent<QSplitter>(source);
                if (!splitter) return true;
                QString source_name = source->objectName();
                if (source_name == "leftTabs") {
                    dest = splitter->findChild<QTabWidget*>("rightTabs");
                } else if (source_name == "rightTabs") {
                    dest = splitter->findChild<QTabWidget*>("leftTabs");
                }
                if (!dest) return true;
                TabbedSplitView::switchTabs(currentTab,source,dest);
                return true;
            }
        } else if (e->modifiers() == Qt::ControlModifier) {
            if (e->key() == Qt::Key_L) {
                QsciScintilla* newEditor = TabbedSplitView::dialogScintillaTabLoad(tabs);
                if (!newEditor) return true;
                darkTabScintillaLogic(newEditor);
                return true;
            }
            if (e->key() == Qt::Key_S) {
                if (!tabs) return true;
                QVariant data = tabs->tabBar()->tabData(currentTab);
                if(data.isNull() || !data.isValid()) return true;
                QString absPath = data.value<QString>();
                if ( !fileExists(absPath).isNull() && !fileExists(absPath).isEmpty() ) {
                    if ( view->isReadOnly() ) {
                        QMessageBox::warning(view, "Aborted", "The editor for "+absPath+" is read only");
                        return true;
                    }
                    saveFile(absPath, view->text());
                    QMessageBox::information(view, "File Saved", "File Saved on: "+absPath);
                    if ( prev_tab_text.startsWith("* ") ) {
                        tabs->setTabText(currentTab,prev_tab_text.slice(2));
                    }
                } else {}
                return true;
            }
            if (e->key() == Qt::Key_N) {
                return true; // DEPRECATED
                if (!tabs) return true;
                QString tabs_name = tabs->objectName();
                QSplitter* splitter = CodexIncantation::findClosestParent<QSplitter>(tabs);
                if (!splitter) return true;
                if (tabs_name == "leftTabs") {
                    addLeftTab_Scintilla(splitter, QString("(%1)").arg(index_new_tab));
                    index_new_tab++;
                } else if (tabs_name == "rightTabs") {
                    addRightTab_Scintilla(splitter, QString("(%1)").arg(index_new_tab));
                    index_new_tab++;
                }
                return true;
            }
            if (e->key() == Qt::Key_R) {
                if (!tabs) return true;
                QVariant data = tabs->tabBar()->tabData(currentTab);
                if(data.isNull() || !data.isValid()) return true;
                view->setReadOnly(!view->isReadOnly());
                QString absPath = data.value<QString>();
                QString fileName = getShortFileName(absPath);
                if (view->isReadOnly()) {
                    if ( isEnclosedBy(prev_tab_text, "[ ", " ]") ) return true;
                    tabs->setTabText(currentTab, QString("[ ")+prev_tab_text+QString(" ]"));
                } else {
                    if ( !isEnclosedBy(prev_tab_text, "[ ", " ]") ) return true;
                    int len = prev_tab_text.length();
                    tabs->setTabText(currentTab, prev_tab_text.slice(2,len-4));
                }
                return true;
            }
            if (e->key() == Qt::Key_M) {
                CodexIncantation::createEmptyFileDialog();
                return true;
            }
            if (e->key() == Qt::Key_W) {
                TabbedSplitView::removeAndDestroyTab(tabs, currentTab);
                return true;
            }
        } 
        return false; // Let all other keys (letters, arrows, etc.) pass to Scintilla
    });
    CodexIncantation::onTextChange(view, [](QsciScintilla* view) -> void {
        if ( !view ) return;
        if ( view->isReadOnly() ) return;
        QTabWidget* tabs = CodexIncantation::findClosestParent<QTabWidget>(view);
        if (!tabs) return;
        int currentTab = tabs->currentIndex();
        if (currentTab == -1) return;
        QVariant data = tabs->tabBar()->tabData(currentTab);
        if(data.isNull() || !data.isValid()) return;
        QString prev_tab_text = tabs->tabText(currentTab);
        if ( prev_tab_text.startsWith("* ") ) return;
        tabs->setTabText(currentTab,"* "+prev_tab_text);
    });
}
QsciScintilla* addLeftTab_Scintilla(QSplitter* view, QString name) {
    QsciScintilla* result = TabbedSplitView::addLeftTab_Scintilla(view,name);
    darkTabScintillaLogic(result);
    return result;
}
QsciScintilla* addRightTab_Scintilla(QSplitter* view, QString name) {
    QsciScintilla* result = TabbedSplitView::addRightTab_Scintilla(view,name);
    darkTabScintillaLogic(result);
    return result;
}

// -- END 
