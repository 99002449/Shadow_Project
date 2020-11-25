#include "dialog.h"

Dialog::Dialog(QWidget *parent)
    : QDialog(parent)
{
    spinBox = new QSpinBox(this);
    increaseButton = new QPushButton("Increase", this);
    decreaseButton = new QPushButton("Decrease", this);
    dial = new QDial(this);
    vLayout = new QVBoxLayout(this);

    gButtonLayout = new QGroupBox(this);
    hButtonLayout = new QHBoxLayout(gButtonLayout);
    hButtonLayout->addWidget(increaseButton);
    hButtonLayout->addWidget(decreaseButton);
    gButtonLayout->setLayout(hButtonLayout);

    vLayout->addWidget(spinBox);
    vLayout->addWidget(dial);
    vLayout->addWidget(gButtonLayout);

    connect(increaseButton,SIGNAL(clicked()),this,SLOT(onIncreaseButtonClicked()));
    connect(decreaseButton,SIGNAL(clicked()),this,SLOT(onDecreaseButtonClicked()));
    connect(spinBox,SIGNAL(valueChanged(int)),dial,SLOT(setValue(int)));
    connect(dial,SIGNAL(valueChanged(int)),spinBox,SLOT(setValue(int)));
}

Dialog::~Dialog()
{

}

void Dialog::onIncreaseButtonClicked()
{
    int value = spinBox->value() + 1;
    if(spinBox->value()==99)
    {
        spinBox->setValue(0);
        dial->setValue(0);
    }
    else
    {
        spinBox->setValue(value);
        dial->setValue(value);
    }

}

void Dialog::onDecreaseButtonClicked()
{
    int value = spinBox->value() - 1;
    if(spinBox->value()==0)
    {
        spinBox->setValue(0);
        dial->setValue(0);
    }
    else
    {
        spinBox->setValue(value);
        dial->setValue(value);
    }

}
