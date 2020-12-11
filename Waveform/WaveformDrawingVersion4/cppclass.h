#ifndef CPPCLASS_H
#define CPPCLASS_H

#include <QObject>
#include <QVariant>
#include <bits/stdc++.h>
class CppClass : public QObject
{
    Q_OBJECT
public:
    explicit CppClass(QObject *parent = nullptr);

signals:

public slots:
   void onStoreAndSendUrl(QVariant);
};

#endif // CPPCLASS_H
