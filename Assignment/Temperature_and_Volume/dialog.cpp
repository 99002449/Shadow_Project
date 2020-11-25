#include "dialog.h"

Dialog::Dialog(QWidget *parent)
    : QDialog(parent)
{
    spinBox = new QSpinBox(this);
    increaseButton = new QPushButton("Increase", this);
    decreaseButton = new QPushButton("Decrease", this);
    lcdNumber = new QLCDNumber(5,this);
    vLayout = new QVBoxLayout(this);

    gButtonLayout = new QGroupBox(this);
    hButtonLayout = new QHBoxLayout(gButtonLayout);
    hButtonLayout->addWidget(increaseButton);
    hButtonLayout->addWidget(decreaseButton);
    gButtonLayout->setLayout(hButtonLayout);

    vLayout->addWidget(spinBox);
    vLayout->addWidget(lcdNumber);
    vLayout->addWidget(gButtonLayout);

    connect(increaseButton,SIGNAL(clicked()),this,SLOT(onIncreaseButtonClicked()));
    connect(decreaseButton,SIGNAL(clicked()),this,SLOT(onDecreaseButtonClicked()));
    connect(spinBox,SIGNAL(valueChanged(int)),lcdNumber,SLOT(display(int)));
}

Dialog::~Dialog()
{
    
}

void Dialog::onIncreaseButtonClicked()
{
    int value = spinBox->value() + 1;
    spinBox->setValue(value);
    lcdNumber->display(value);
}

void Dialog::onDecreaseButtonClicked()
{
    int value = spinBox->value() - 1;
    if(spinBox->value()==0)
    {
        spinBox->setValue(0);
        lcdNumber->display(0);
    }
    else
    {
        spinBox->setValue(value);
        lcdNumber->display(value);
    }

}
