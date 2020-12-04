#include <QApplication>

#include <QQmlContext>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Creating the view and manually setting the QML file it should display
    QQuickView view;
    view.setSource(QStringLiteral("main.qml"));

    // Retrieving the QML context. This context allows us to expose data to the QML components
    QQmlContext* rootContext = view.rootContext();

    // Creating 2 new properties: the width and height of the view
    rootContext->setContextProperty("WINDOW_WIDTH", 640);
    rootContext->setContextProperty("WINDOW_HEIGHT", 360);

    // Let's display the view
    view.show();

    return app.exec();
}
