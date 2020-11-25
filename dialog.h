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
#include <QComboBox>
#include <QMessageBox>





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
    QComboBox *comboBox1;



    //Layouts
    QVBoxLayout *vLayout;

    QHBoxLayout *hLayoutInput1;
    QHBoxLayout *hLayoutInput2;
    QHBoxLayout *hLayoutButtons;
    QHBoxLayout *hLayoutCombo1;

    QGroupBox *gLayoutInput1;
    QGroupBox *gLayoutInput2;
    QGroupBox *gLayoutButtons;
    QGroupBox *gLayoutCombo1;

     QMessageBox *messageBox;



};

#endif // DIALOG_H
