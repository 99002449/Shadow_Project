#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
#include <QVariant>
#include <QString>
class myClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString data READ getData WRITE setData NOTIFY sendResult)
public:
    explicit myClass(QObject *parent = nullptr);

    QString getData() const;
    void setData(const QString &value);

signals:
    void sendResult(QVariant);

public slots:
    void onDataSend();

private:
    QString data;


};

#endif // MYCLASS_H
