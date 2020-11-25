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
    comboBox1=new QComboBox(this);



    gLayoutInput1 = new QGroupBox;
    gLayoutInput2 = new QGroupBox;
    gLayoutButtons = new QGroupBox;
    gLayoutCombo1 = new QGroupBox;



    hLayoutInput1 = new QHBoxLayout(gLayoutInput1);
    hLayoutInput2 = new QHBoxLayout(gLayoutInput2);
    hLayoutCombo1 = new QHBoxLayout(gLayoutCombo1);
    hLayoutButtons = new QHBoxLayout(gLayoutButtons);




    hLayoutInput1->addWidget(inputLabel1);
    hLayoutInput1->addWidget(input1);
    gLayoutInput1->setLayout(hLayoutInput1);

    hLayoutInput2->addWidget(inputLabel2);
    hLayoutInput2->addWidget(input2);
    gLayoutInput2->setLayout(hLayoutInput2);


    comboBox1->QComboBox::addItem("Add");
    comboBox1->QComboBox::addItem("Sub");
    comboBox1->QComboBox::addItem("Mul");
    comboBox1->QComboBox::addItem("Div");
    hLayoutCombo1->addWidget(comboBox1);
    gLayoutCombo1->setLayout(hLayoutCombo1);


    hLayoutButtons->addWidget(calculateButton);
    hLayoutButtons->addWidget(clearButton);
    gLayoutButtons->setLayout(hLayoutButtons);

     vLayout = new QVBoxLayout(this);
     vLayout->addWidget(labelHeading);
     vLayout->addWidget(gLayoutInput1);
     vLayout->addWidget(gLayoutInput2);
     vLayout->addWidget(gLayoutCombo1);
     vLayout->addWidget(result);
     vLayout->addWidget(gLayoutButtons);

     connect(clearButton,SIGNAL(clicked()),input1,SLOT(clear()));
     connect(clearButton,SIGNAL(clicked()),input2,SLOT(clear()));
     connect(clearButton,SIGNAL(clicked()),result,SLOT(clear()));
     connect(calculateButton,SIGNAL(clicked()),this,SLOT(onCalculateClicked()));



}

Dialog::~Dialog()
{

}

void Dialog::onCalculateClicked()
{
    if(input1->text()==NULL || input2->text()==NULL)
    {
        messageBox->critical(this,"Empty Input", "Input Fields cannot be empty!");

    }
    else if(comboBox1->currentIndex()==0)
     result->setText(  QString::number( input1->text().toInt() +  input2->text().toInt()));
    else if(comboBox1->currentIndex()==1)
     result->setText(  QString::number( input1->text().toInt() -  input2->text().toInt()));
    else if(comboBox1->currentIndex()==2)
     result->setText(  QString::number( input1->text().toInt() *  input2->text().toInt()));
    else if(comboBox1->currentIndex()==3)
     result->setText(  QString::number( input1->text().toInt() /  input2->text().toInt()));
}

