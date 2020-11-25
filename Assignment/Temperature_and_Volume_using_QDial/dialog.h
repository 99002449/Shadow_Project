#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QDial>
#include <QSpinBox>
#include <QPushButton>
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
    QDial *dial;
    QVBoxLayout *vLayout;
    QHBoxLayout *hButtonLayout;
    QGroupBox *gButtonLayout;
};

#endif // DIALOG_H
