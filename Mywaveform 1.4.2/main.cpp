#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include <QQuickWindow>
#include <QQmlContext>
#include "mywaveform.h"
#include "mylang.h"
#include "mytranslator.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    app.setOrganizationName("Some Company");
    app.setOrganizationDomain("somecompany.com");
    app.setApplicationName("Amazing Application");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    MyWaveform waveform;
    MyTranslator mTrans(&app);
    qmlRegisterType<MyLang>("MyLang",1,0,"MyLang");

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("mywaveform",&waveform);
    context->setContextProperty("mytrans", &mTrans);

    engine.load(url);

    return app.exec();
}
