#include "dialog.h"

int numberLength=0;
Dialog::Dialog(QWidget *parent): QDialog(parent)
{
    gridLayout = new QGridLayout(this);
    label = new QLabel("DailPad",this);
    lineEdit = new QLineEdit(this);
    button0 = new QPushButton("0",this);
    button1 = new QPushButton("1",this);
    button2 = new QPushButton("2",this);
    button3 = new QPushButton("3",this);
    button4 = new QPushButton("4",this);
    button5 = new QPushButton("5",this);
    button6 = new QPushButton("6",this);
    button7 = new QPushButton("7",this);
    button8 = new QPushButton("8",this);
    button9 = new QPushButton("9",this);
    clearButton = new QPushButton("Clear",this);
    delButton = new QPushButton("Delete",this);
    callButton = new QPushButton("Make Call",this);

    gridLayout->addWidget(label,0,1);
    gridLayout->addWidget(lineEdit,1,0,1,3
                          );

    gridLayout->addWidget(button1,2,0);
    gridLayout->addWidget(button2,2,1);
    gridLayout->addWidget(button3,2,2);

    gridLayout->addWidget(button4,3,0);
    gridLayout->addWidget(button5,3,1);
    gridLayout->addWidget(button6,3,2);

    gridLayout->addWidget(button7,4,0);
    gridLayout->addWidget(button8,4,1);
    gridLayout->addWidget(button9,4,2);

    gridLayout->addWidget(clearButton,5,0);
    gridLayout->addWidget(button0,5,1);
    gridLayout->addWidget(delButton,5,2);

    gridLayout->addWidget(callButton,6,0,1,3);


    //In the SLOT if the user defined function is common for different buttons but accepts argument ,
    //then use the QSignalMapper
    //The QSignalMapper class bundles signals from identifiable senders.

    signalMapper = new QSignalMapper(this);
    connect(button0,SIGNAL(clicked()),signalMapper,SLOT(map()));
    connect(button1,SIGNAL(clicked()),signalMapper,SLOT(map()));
    connect(button2,SIGNAL(clicked()),signalMapper,SLOT(map()));
    connect(button3,SIGNAL(clicked()),signalMapper,SLOT(map()));
    connect(button4,SIGNAL(clicked()),signalMapper,SLOT(map()));
    connect(button5,SIGNAL(clicked()),signalMapper,SLOT(map()));
    connect(button6,SIGNAL(clicked()),signalMapper,SLOT(map()));
    connect(button7,SIGNAL(clicked()),signalMapper,SLOT(map()));
    connect(button8,SIGNAL(clicked()),signalMapper,SLOT(map()));
    connect(button9,SIGNAL(clicked()),signalMapper,SLOT(map()));

    signalMapper->setMapping(button0,0);
    signalMapper->setMapping(button1,1);
    signalMapper->setMapping(button2,2);
    signalMapper->setMapping(button3,3);
    signalMapper->setMapping(button4,4);
    signalMapper->setMapping(button5,5);
    signalMapper->setMapping(button6,6);
    signalMapper->setMapping(button7,7);
    signalMapper->setMapping(button8,8);
    signalMapper->setMapping(button9,9);


    connect(signalMapper,SIGNAL(mapped(int)),this, SLOT(dailNumber(int)));
    connect(clearButton,SIGNAL(clicked()),lineEdit,SLOT(clear()));
    connect(callButton,SIGNAL(clicked()),this,SLOT(makeCall()));
    connect(delButton, SIGNAL(clicked()), this, SLOT(deleteNumber()));
}

QString Dialog::appendNumber(int number)
{
    if(lineEdit->text().length() >= 10)
    {
       messageBox->information(this,"Number Length..."," Only 10 Digit Number!! ");
       return lineEdit->text();
    }
    else
         return lineEdit->text()+ QString::number(number);
}

Dialog::~Dialog()
{
    
}

void Dialog::dailNumber(int buttonClicked)
{
    switch(buttonClicked)
    {
        case 0: lineEdit->setText(appendNumber(0));break;
        case 1: lineEdit->setText(appendNumber(1));break;
        case 2: lineEdit->setText(appendNumber(2));break;
        case 3: lineEdit->setText(appendNumber(3));break;
        case 4: lineEdit->setText(appendNumber(4));break;
        case 5: lineEdit->setText(appendNumber(5));break;
        case 6: lineEdit->setText(appendNumber(6));break;
        case 7: lineEdit->setText(appendNumber(7));break;
        case 8: lineEdit->setText(appendNumber(8));break;
        case 9: lineEdit->setText(appendNumber(9));break;

    }

}

void Dialog::makeCall()
{
    if(lineEdit->text().size()==10)
        messageBox->information(this,"Calling..."," Calling "+lineEdit->text()+"...");
    else
        messageBox->critical(this,"Invalid Number"," Enter 10 Digit Number ");
}

void Dialog::deleteNumber()
{
    lineEdit->backspace();
}


