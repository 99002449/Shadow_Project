#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QGridLayout>
#include <QPushButton>
#include <QLineEdit>
#include <QLabel>
#include <QMessageBox>
#include <QSignalMapper>

class Dialog : public QDialog
{
    Q_OBJECT
    
public:
    Dialog(QWidget *parent = 0);
    QString appendNumber(int);
    ~Dialog();

public slots:
    void dailNumber(int);
    void makeCall();
    void deleteNumber();
private:
    QLabel *label;
    QGridLayout *gridLayout;
    QLineEdit *lineEdit;
    QPushButton *button0;
    QPushButton *button1;
    QPushButton *button2;
    QPushButton *button3;
    QPushButton *button4;
    QPushButton *button5;
    QPushButton *button6;
    QPushButton *button7;
    QPushButton *button8;
    QPushButton *button9;
    QPushButton *clearButton;
    QPushButton *delButton;
    QPushButton *callButton;
    QMessageBox *messageBox;
    QSignalMapper *signalMapper;

};

#endif // DIALOG_H
