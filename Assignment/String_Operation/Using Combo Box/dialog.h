#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QComboBox>
#include <QLineEdit>
#include <QPushButton>
#include <QGroupBox>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <QLabel>
#include <QMessageBox>
#include <QString>

class Dialog : public QDialog
{
    Q_OBJECT

public slots:
    void opearteClicked();
    void onClear();

private:
    QLabel *lableHead;
    QComboBox *comboBox1;
    QLabel *inputLable1;
    QLabel *inputLable2;
    QLineEdit *inputLine1;
    QLineEdit *inputLine2;
    QLineEdit *result;
    QPushButton *operate;
    QPushButton *clear;


    QVBoxLayout *vlayout;


    QHBoxLayout *hlayoutInput1;
    QHBoxLayout *hlayoutInput2;
    QHBoxLayout *hlayoutComboBox1;
    QHBoxLayout *hlayoutButtons;

    QGroupBox *glayoutInput1;
    QGroupBox *glayoutInput2;
    QGroupBox *glayoutComboBox1;
    QGroupBox *glayoutButtons;


    QMessageBox *messageBox;

    QString *string1;



public:
    Dialog(QWidget *parent = 0);
    ~Dialog();
};

#endif // DIALOG_H
