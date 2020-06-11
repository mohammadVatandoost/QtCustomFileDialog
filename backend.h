#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QStorageInfo>
#include <QDebug>

class BackEnd : public QObject
{
    Q_OBJECT
public:
    explicit BackEnd(QObject *parent = nullptr);
    bool showUSBDrive();
//    QVec
signals:

};

#endif // BACKEND_H
