#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QQuickWindow>
#include <QApplication>
#include <QDebug>
#include "backend.h"
#include "fileitemsmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    BackEnd backend;
    FileItemsModel *fileItemModel = new FileItemsModel();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QStringLiteral("BackEnd"), &backend);
    engine.rootContext()->setContextProperty(QStringLiteral("FileItemsModel"), fileItemModel);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
