#include "mycalculator.h"
#include <QDebug>
MyCalculator::MyCalculator(QObject *parent) : QObject(parent)
{

}

void MyCalculator::onCalculateButtonClicked(QVariant  inp1, QVariant inp2, QVariant radio)
{
        switch(radio.toInt())
        {
            case 1: result=inp1.toInt()+ inp2.toInt();  qDebug() << "case 0 radio value in Cpp : "<<radio.toInt()<<"\n";break;
            case 2: result=inp1.toInt() - inp2.toInt();qDebug() << "case 1 radio value in Cpp : "<<radio.toInt()<<"\n";break;
            case 3: result=inp1.toInt() * inp2.toInt();qDebug() << "case 2 radio value in Cpp : "<<radio.toInt()<<"\n";break;
            case 4: result=inp1.toInt()/ inp2.toInt();qDebug() << "case 3 radio value in Cpp : "<<radio.toInt()<<"\n";break;
        }
        emit resultUpdated(result);
}

void MyCalculator::onClearButtonClicked()
{
    setInput1(0);
    emit input1Updated(input1);
    setInput2(0);
    emit input2Updated(input2);
}

int MyCalculator::getResult() const
{
    return result;
}

void MyCalculator::setResult(int value)
{
    result = value;
}

int MyCalculator::getInput2() const
{
    return input2;
}

void MyCalculator::setInput2(int value)
{
    input2 = value;
}

int MyCalculator::getInput1() const
{
    return input1;
}

void MyCalculator::setInput1(int value)
{
    input1 = value;
}




