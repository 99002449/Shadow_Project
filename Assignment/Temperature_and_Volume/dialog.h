#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QSpinBox>
#include <QPushButton>
#include <QLCDNumber>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QGroupBox>

class Dialog : public QDialog
{
    Q_OBJECT
    
public:
    Dialog(QWidget *parent = 0);
    ~Dialog();

public slots:
    void onIncreaseButtonClicked();
    void onDecreaseButtonClicked();
private:
    QSpinBox *spinBox;
    QPushButton *increaseButton;
    QPushButton *decreaseButton;
    QLCDNumber *lcdNumber;
    QVBoxLayout *vLayout;
    QHBoxLayout *hButtonLayout;
    QGroupBox *gButtonLayout;

};

#endif // DIALOG_H
