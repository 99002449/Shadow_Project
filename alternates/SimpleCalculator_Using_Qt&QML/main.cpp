#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "mycalculator.h"
#include <QQmlContext>
#include <QQuickWindow>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    MyCalculator myCalObj;

    const QUrl url(QStringLiteral("qrc:/main.qml"));


engine.load(url);


    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *dashboard = qobject_cast<QQuickWindow *>(topLevel);

    QObject::connect(dashboard, SIGNAL(calculateButtonClicked(QVariant,QVariant,QVariant)),
                    &myCalObj, SLOT(onCalculateButtonClicked(QVariant,QVariant,QVariant)));

    QObject::connect(dashboard, SIGNAL(clearButtonClicked()),
                    &myCalObj, SLOT(onClearButtonClicked()));

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("calculator",&myCalObj);


    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);







    return app.exec();
}
