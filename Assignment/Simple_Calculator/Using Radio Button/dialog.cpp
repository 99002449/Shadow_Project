#include "dialog.h"

Dialog::Dialog(QWidget *parent): QDialog(parent)
{
    labelHeading = new QLabel("Simple Calculator",this);
    inputLabel1 = new QLabel("Input 1: ", this);
    inputLabel2 = new QLabel("Input 2: ", this);
    input1 = new QLineEdit(this);
    input2 = new QLineEdit(this);
    result = new QLineEdit(this);
    calculateButton = new QPushButton("Calculate",this);
    clearButton = new QPushButton("Clear", this);
    addRadio = new QRadioButton("Add", this);
    subRadio = new QRadioButton("Subtract", this);
    mulRadio = new QRadioButton("Multiply", this);
    divRadio = new QRadioButton("Divide", this);


 /*   QRegExp expression("^[0-9]*.[0-9]*$");
    validator = new QRegExpValidator(expression,this);
    input1->setValidator(validator );
    input2->setValidator(validator);*/

    gLayoutInput1 = new QGroupBox;
    gLayoutInput2 = new QGroupBox;
    gLayoutRadio = new QGroupBox;
    gLayoutButtons = new QGroupBox;


    hLayoutInput1 = new QHBoxLayout(gLayoutInput1);
    hLayoutInput2 = new QHBoxLayout(gLayoutInput2);
    hLayoutRadio = new QHBoxLayout(gLayoutRadio);
    hLayoutButtons = new QHBoxLayout(gLayoutButtons);


    hLayoutInput1->addWidget(inputLabel1);
    hLayoutInput1->addWidget(input1);
    gLayoutInput1->setLayout(hLayoutInput1);

    hLayoutInput2->addWidget(inputLabel2);
    hLayoutInput2->addWidget(input2);
    gLayoutInput2->setLayout(hLayoutInput2);

    hLayoutRadio->addWidget(addRadio);
    hLayoutRadio->addWidget(subRadio);
    hLayoutRadio->addWidget(mulRadio);
    hLayoutRadio->addWidget(divRadio);
    gLayoutRadio->setLayout(hLayoutRadio);

    hLayoutButtons->addWidget(calculateButton);
    hLayoutButtons->addWidget(clearButton);
    gLayoutButtons->setLayout(hLayoutButtons);


    vLayout = new QVBoxLayout(this);
    vLayout->addWidget(labelHeading);
    vLayout->addWidget(gLayoutInput1);
    vLayout->addWidget(gLayoutInput2);
    vLayout->addWidget(gLayoutRadio);
    vLayout->addWidget(result);
    vLayout->addWidget(gLayoutButtons);

    //connect
    connect(clearButton,SIGNAL(clicked()),input1,SLOT(clear()));
    connect(clearButton,SIGNAL(clicked()),input2,SLOT(clear()));
    connect(clearButton,SIGNAL(clicked()),result,SLOT(clear()));
    connect(calculateButton,SIGNAL(clicked()),this,SLOT(onCalculateClicked()));
    //When an action/Signal is performed on the Pushbutton then 'this' should be included in the signal/handler.



}

Dialog::~Dialog()
{
    
}

void Dialog::onCalculateClicked()
{
    //check for empty input
    if(input1->text()==NULL || input2->text()==NULL)
    {
        messageBox->critical(this,"Empty Input", "Input Fields cannot be empty!");
    }
     //check for empty operation select
    else if(addRadio->isChecked()==false && subRadio->isChecked()==false && mulRadio->isChecked()==false && divRadio->isChecked()==false  )
        messageBox->critical(this,"Invalid Operation", "Select an operation to be performed!");

    else
    {
        if(addRadio->isChecked())
            result->setText(  QString::number( input1->text().toInt() +  input2->text().toInt() )   );
        else if(subRadio->isChecked())
            result->setText(  QString::number( input1->text().toInt() -  input2->text().toInt() )   );
        else if(mulRadio->isChecked())
            result->setText(  QString::number( input1->text().toInt() *  input2->text().toInt() )   );
        else if(divRadio->isChecked())
        {
            if(input1->text().toInt()==0 && input2->text().toInt()==0 )
                 messageBox->critical(this,"Zero by Zero Error", "Numerator and Denominator cannot be zero!");

            if( input2->text().toInt()!=0)
             result->setText(  QString::number( input1->text().toInt() /  input2->text().toInt() )   );
            else
                messageBox->critical(this,"Divide by zero Error", "Denominator cannot be zero!");
        }

    }

}
