#ifndef MYDIALOG_H
#define MYDIALOG_H
#include "signup.h"
#include <QLabel>
#include<QLineEdit>
#include<QPushButton>
#include <QDialog>
#include <QGridLayout>
#include<QMessageBox>
#include<QGroupBox>
/*namespace Ui {
class MyDialog;
}*/

class MyDialog : public QDialog
{
    Q_OBJECT
    
public:
    explicit MyDialog(QWidget *parent = 0);
    ~MyDialog();

public slots:
    void onSubmitButtonClicked();
    void onSignUpButtonClicked();
private:
    //Ui::MyDialog *ui;

    QLabel *labelLogin;
    QLabel *labelUser;
    QLabel *labelPwd;
    QLineEdit *username;
    QLineEdit *password;
    QPushButton *loginButton;
    QPushButton *clearButton;
    //QPushButton *signUpButton;
    QGridLayout *gridLayout;
    QMessageBox *messageBox;

    QGroupBox *userLabelAndLineEdit;
    QGroupBox *pwdLabelAndLineEdit;
    QGroupBox *submitLabelAndLineEdit;
    QHBoxLayout *hBox;
    QHBoxLayout *hBox2;
    QHBoxLayout *hBox3;
    QVBoxLayout *vLayout;
    Signup *secondDialog;


};

#endif // MYDIALOG_H
