#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QLabel>
#include <QLineEdit>
#include <QPushButton>
#include <QRadioButton>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <QGroupBox>
#include <QMessageBox>
#include <QRegExpValidator>
#include <QValidator>



class Dialog : public QDialog
{
    Q_OBJECT
    
public:
    Dialog(QWidget *parent = 0);
    ~Dialog();

public slots:
    void onCalculateClicked();
private:
    QLabel *labelHeading;
    QLabel *inputLabel1;
    QLabel *inputLabel2;
    QLineEdit *input1;
    QLineEdit *input2;
    QLineEdit *result;
    QPushButton *calculateButton;
    QPushButton *clearButton;
    QRadioButton *addRadio;
    QRadioButton *subRadio;
    QRadioButton *mulRadio;
    QRadioButton *divRadio;

    //Layouts
    QVBoxLayout *vLayout;

    QHBoxLayout *hLayoutInput1;
    QHBoxLayout *hLayoutInput2;
    QHBoxLayout *hLayoutRadio;
    QHBoxLayout *hLayoutButtons;

    QGroupBox *gLayoutInput1;
    QGroupBox *gLayoutInput2;
    QGroupBox *gLayoutRadio;
    QGroupBox *gLayoutButtons;

    QMessageBox *messageBox;
    QValidator *validator;


};

#endif // DIALOG_H
