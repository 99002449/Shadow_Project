#include "myclass.h"

myClass::myClass(QObject *parent) : QObject(parent)
{

}

void myClass::onDataSend()
{
  setData("Helllo");

}

QString myClass::getData() const
{
    return data;
}

void myClass::setData(const QString &value)
{
    data = value;
    emit sendResult(data);
}

