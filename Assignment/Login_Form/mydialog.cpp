#include "mydialog.h"
#include "ui_mydialog.h"

bool flag=true;
MyDialog::MyDialog(QWidget *parent) : QDialog(parent) //,ui(new Ui::MyDialog)
{
    //ui->setupUi(this);
    //Memory allocation
    labelLogin = new QLabel(" Login ",this);
    labelUser = new QLabel(" USERNAME ",this);
    labelPwd = new QLabel(" PASSWORD ",this);
    username =  new QLineEdit(this);
    password = new QLineEdit(this);
    password->setEchoMode(QLineEdit::Password);
    loginButton = new QPushButton("Login",this);
    clearButton = new QPushButton("Clear",this);
    messageBox = new QMessageBox(this);
    //signUpButton = new QPushButton("Signup",this);
    vLayout = new QVBoxLayout(this);


    userLabelAndLineEdit = new QGroupBox;  //new QGroupBox; also works fine no need to mention parent class
    hBox = new QHBoxLayout(userLabelAndLineEdit);//parent object need to be specified , writing 'this' will generate warning or it can be left blank (without constructor)
    hBox->addWidget(labelUser);
    hBox->addWidget(username);
    userLabelAndLineEdit->setLayout(hBox);


    pwdLabelAndLineEdit = new QGroupBox;
    hBox2 = new QHBoxLayout(pwdLabelAndLineEdit);
    hBox2->addWidget(labelPwd);
    hBox2->addWidget(password);
    pwdLabelAndLineEdit->setLayout(hBox2);


    submitLabelAndLineEdit = new QGroupBox;
    hBox3 = new QHBoxLayout(submitLabelAndLineEdit);
    hBox3->addWidget(loginButton);
    hBox3->addWidget(clearButton);
    //hBox3->addWidget(signUpButton);
    submitLabelAndLineEdit->setLayout(hBox3);

    vLayout->addWidget(labelLogin);
    vLayout->addWidget(userLabelAndLineEdit);
    vLayout->addWidget(pwdLabelAndLineEdit);
    vLayout->addWidget(submitLabelAndLineEdit);

    //Signals and Slots
    connect(loginButton,SIGNAL(clicked()),this,SLOT(onSubmitButtonClicked()));
    connect(clearButton,SIGNAL(clicked()),username,SLOT(clear()));
    connect(clearButton,SIGNAL(clicked()),password,SLOT(clear()));
    //connect(signUpButton,SIGNAL(clicked()),this,SLOT(onSignUpButtonClicked()));

}

MyDialog::~MyDialog()
{
    //delete ui;
}

void MyDialog::onSubmitButtonClicked()
{
    if(flag)
    {
        if(username->text() != NULL && password->text() != NULL)
        {
            if(username->text() == "shadowproject" && password->text() == "shadowproject")
            {
                 messageBox->information(this,"Login","Login Successfull!!");
                 loginButton->setText("Logout");
                 username->setEnabled(false);
                 password->setEnabled(false);
                 clearButton->setEnabled(false);
                 //signUpButton->setEnabled(false);
                 labelLogin->setText("User: ShadowProject Logged-in");
                 flag=false;
            }

            else
                messageBox->critical(this,"Login UnSuccessfull","Invaid Login Credential");
        }
        else
        {
            messageBox->warning(this,"Login UnSuccessfull","Username and Password cannot be empty");
        }
    }
    else
    {
        messageBox->information(this,"Logout","Logout Successfull!!");
        loginButton->setText("Login");
        username->setEnabled(true);
        password->setEnabled(true);
        clearButton->setEnabled(true);
        //signUpButton->setEnabled(true);
        labelLogin->setText("Login");
        username->setText("");
        password->setText("");
        flag=true;
    }


}

void MyDialog::onSignUpButtonClicked()
{
    //Method 1 using Modal approach
    //This approach disables the parent/main window (i.e., no access to the main window)
    Signup secondDialog;
    secondDialog.setWindowTitle("Signup");
    secondDialog.setModal(true);
    secondDialog.exec();

    //Method 2 creating pointer object
    //secondDialog = new Signup();
    //secondDialog->show();
}






