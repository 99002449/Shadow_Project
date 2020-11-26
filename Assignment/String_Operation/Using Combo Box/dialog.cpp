#include "dialog.h"

Dialog::Dialog(QWidget *parent)
    : QDialog(parent)
{
    lableHead = new QLabel("STRING OPERATIONS", this);
    comboBox1 = new QComboBox(this);
    inputLable1 = new QLabel("String 1: ", this);
    inputLable2 = new QLabel("String 2: ", this);
    inputLine1 = new QLineEdit(this);
    inputLine2 = new QLineEdit(this);
    result = new QLineEdit(this);
    operate = new QPushButton("Operate", this);
    clear = new QPushButton("Clear", this);


    vlayout = new QVBoxLayout(this);


    glayoutInput1 = new QGroupBox;
    glayoutInput2 = new QGroupBox;
    glayoutComboBox1 = new QGroupBox;
    glayoutButtons = new QGroupBox;


    hlayoutInput1 = new QHBoxLayout(glayoutInput1);
    hlayoutInput2 = new QHBoxLayout(glayoutInput2);
    hlayoutComboBox1 = new QHBoxLayout(glayoutComboBox1);
    hlayoutButtons = new QHBoxLayout(glayoutButtons);


    hlayoutInput1->addWidget(inputLable1);
    hlayoutInput1->addWidget(inputLine1);
    glayoutInput1->setLayout(hlayoutInput1);

    hlayoutInput2->addWidget(inputLable2);
    hlayoutInput2->addWidget(inputLine2);
    glayoutInput2->setLayout(hlayoutInput2);



    hlayoutButtons->addWidget(operate);
    hlayoutButtons->addWidget(clear);
    glayoutButtons->setLayout(hlayoutButtons);


    comboBox1->QComboBox::addItem("Length");
    comboBox1->QComboBox::addItem("Copy");
    comboBox1->QComboBox::addItem("Concate");
    comboBox1->QComboBox::addItem("Compare");
    hlayoutComboBox1->addWidget(comboBox1);
    glayoutComboBox1->setLayout( hlayoutComboBox1);


    vlayout->addWidget(lableHead);
    vlayout->addWidget(glayoutInput1);
    vlayout->addWidget(glayoutInput2);
    vlayout->addWidget(result);
    vlayout->addWidget(glayoutComboBox1);
    vlayout->addWidget(glayoutButtons);

    string1 = new QString;


    connect(operate, SIGNAL(clicked()), this, SLOT(opearteClicked()));
    connect(clear,SIGNAL(clicked()),this,SLOT(onClear()));
    connect(clear,SIGNAL(clicked()),this,SLOT(onClear()));
    connect(clear,SIGNAL(clicked()),result,SLOT(clear()));



}

Dialog::~Dialog()
{

}


void Dialog::opearteClicked()
{
    if(inputLine1->text()== NULL && inputLine2->text()== NULL)
    {
        messageBox->critical(this,"Invalid inputs", "Input filds are empty");
    }

    else{

       if(comboBox1->currentIndex()==0)
        {
            inputLine2->setEnabled(false);
            result->setText(QString::number(inputLine1->text().length()));
            inputLine2->text().clear();
        }
        else if(comboBox1->currentIndex()==1)
        {
            inputLine2->setEnabled(false);
            result->setText(inputLine1->text());
        }
        else if(comboBox1->currentIndex()==2)
        {

            result->setText(inputLine1->text()+inputLine2->text());
        }
        else if(comboBox1->currentIndex()==3)
        {

            if(inputLine1->text()==inputLine2->text()){
                 result->setText("TRUE");
            }
            else{
                 result->setText("FALSE");
            }
        }



    }



}

void Dialog::onClear()
{
    inputLine1->setText("");
    inputLine2->setEnabled(true);
    inputLine2->setText("");
    result->setText("");
}
