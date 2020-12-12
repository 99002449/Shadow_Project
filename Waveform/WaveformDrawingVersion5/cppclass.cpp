#include "cppclass.h"
#include <QDebug>
CppClass::CppClass(QObject *parent) : QObject(parent)
{

}

void CppClass::onStoreAndSendUrl(QVariant Tempurl)
{
    QString s=Tempurl.toString();
    std::string url=s.toLocal8Bit().constData();
   url.erase (0,8);

      qDebug()<< "in temp cpp:  "<< Tempurl.toString();
       std::cout<< "\n in url  cpp:  "<< url;
}
