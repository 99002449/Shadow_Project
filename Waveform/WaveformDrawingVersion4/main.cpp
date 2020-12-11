#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include <QQuickWindow>
#include "cppclass.h"

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
    engine.load(url);

    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *dashboard = qobject_cast<QQuickWindow *>(topLevel);

    CppClass obj;
    QObject::connect(dashboard, SIGNAL(storeAndSendUrl(QVariant)),
                    &obj, SLOT(onStoreAndSendUrl(QVariant)));

    return app.exec();
}
