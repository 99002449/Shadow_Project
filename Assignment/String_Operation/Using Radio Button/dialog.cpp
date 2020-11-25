#include "dialog.h"

Dialog::Dialog(QWidget *parent)
    : QDialog(parent)
{
    lableHead = new QLabel("STRING OPERATIONS", this);
    length = new QRadioButton("Length", this);
    copy = new QRadioButton("Copy", this);
    concat = new QRadioButton("Concat", this);
    compare = new QRadioButton("Compare", this);
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
    glayoutRadio = new QGroupBox;
    glayoutButtons = new QGroupBox;


    hlayoutInput1 = new QHBoxLayout(glayoutInput1);
    hlayoutInput2 = new QHBoxLayout(glayoutInput2);
    hlayoutRadio = new QHBoxLayout(glayoutRadio);
    hlayoutButtons = new QHBoxLayout(glayoutButtons);


    hlayoutInput1->addWidget(inputLable1);
    hlayoutInput1->addWidget(inputLine1);
    glayoutInput1->setLayout(hlayoutInput1);

    hlayoutInput2->addWidget(inputLable2);
    hlayoutInput2->addWidget(inputLine2);
    glayoutInput2->setLayout(hlayoutInput2);

    hlayoutRadio->addWidget(length);
    hlayoutRadio->addWidget(copy);
    hlayoutRadio->addWidget(concat);
    hlayoutRadio->addWidget(compare);
    glayoutRadio->setLayout(hlayoutRadio);

    hlayoutButtons->addWidget(operate);
    hlayoutButtons->addWidget(clear);
    glayoutButtons->setLayout(hlayoutButtons);





    vlayout->addWidget(lableHead);
    vlayout->addWidget(glayoutInput1);
    vlayout->addWidget(glayoutInput2);
    vlayout->addWidget(result);
    vlayout->addWidget(glayoutRadio);
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
    else if(length->isChecked()==false && copy->isChecked()==false && concat->isChecked()==false && compare->isChecked()==false){
        messageBox->warning(this, "not selected", "Operation not selected");
    }
    else {

        if(length->isChecked())
        {
            inputLine2->setEnabled(false);
            result->setText(QString::number(inputLine1->text().length()));
            inputLine2->text().clear();
        }
        else if(copy->isChecked())
        {
            inputLine2->setEnabled(false);
            result->setText(inputLine1->text());
        }
        else if(concat->isChecked())
        {

            result->setText(inputLine1->text()+inputLine2->text());
        }
        else if(compare->isChecked())
        {

            if(inputLine1->text()==inputLine2->text()){
                 result->setText("TRUE");
            }
            else{
                 result->setText("FALSE");
            }
        }



    }


    //    }
}

void Dialog::onClear()
{
    inputLine1->setText("");
    inputLine2->setEnabled(true);
    inputLine2->setText("");
    result->setText("");
}
