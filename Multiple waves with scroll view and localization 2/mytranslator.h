#ifndef MYTRANSLATOR_H
#define MYTRANSLATOR_H

#include <QObject>
#include <QGuiApplication>
#include <QQuickView>
#include <QTranslator>
#include <QDebug>
#include "mylang.h"

class MyTranslator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:
    MyTranslator(QGuiApplication* app) { mApp = app; }

    QString getEmptyString() { return ""; }

signals:
    void languageChanged();

public slots:
    void updateLanguage(int lang){
        switch(lang){
        case MyLang::JAP:
            mTranslator.load("Language_JAP", ":/translator");
            mApp->installTranslator(&mTranslator);
            break;
        case MyLang::FRE:
            mTranslator.load("Language_FRE", ":/translator");
            mApp->installTranslator(&mTranslator);
            break;
        case MyLang::KAN:
            mTranslator.load("Language_KAN", ":/translator");
            mApp->installTranslator(&mTranslator);
            break;
        case MyLang::HIN:
            mTranslator.load("Language_HIN", ":/translator");
            mApp->installTranslator(&mTranslator);
            break;
        default:
            mApp->removeTranslator(&mTranslator);
            break;
        }
        emit languageChanged();
    }

private:
    QGuiApplication* mApp;
    QTranslator mTranslator;
};
#endif // MYTRANSLATOR_H
