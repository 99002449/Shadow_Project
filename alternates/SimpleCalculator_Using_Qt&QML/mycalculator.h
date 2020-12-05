#ifndef MYCALCULATOR_H
#define MYCALCULATOR_H
#include <QtDebug>
#include <QObject>
#include <QVariant>
#include <QString>

class MyCalculator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int result READ getResult WRITE setResult NOTIFY resultUpdated)
    Q_PROPERTY(int input1 READ getInput1 WRITE setInput1 NOTIFY input1Updated)
    Q_PROPERTY(int input2 READ getInput2 WRITE setInput2 NOTIFY input2Updated)

public:
    explicit MyCalculator(QObject *parent = nullptr);


    int getInput1() const;
    void setInput1(int value);

    int getInput2() const;
    void setInput2(int value);

    int getResult() const;
    void setResult(int value);

signals:
    void resultUpdated(int);
    void input1Updated(int);
    void input2Updated(int);

public slots:
    void onCalculateButtonClicked(QVariant,QVariant,QVariant);
    void onClearButtonClicked();

private:
    int input1,input2,result;
};

#endif // MYCALCULATOR_H
