#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include "myclass.h"
#include <QQmlContext>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    myClass obj;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("myObj",&obj);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *dashboard = qobject_cast<QQuickWindow *>(topLevel);


    QObject::connect(dashboard, SIGNAL(dataSend()),
                     &obj, SLOT(onDataSend()));





    return app.exec();
}
