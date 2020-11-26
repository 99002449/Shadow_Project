#ifndef DIALOG_H
#define DIALOG_H

/*
 *Color Changer using spinbox/slides, use palette to reflect color
   * Hint:- https://wiki.qt.io/How_to_Change_the_Background_Color_of_QWidget
   * Also add support to change color using a Combo Box havin std colors
   *
   */


#include <QDialog>
#include <QSpinBox>
#include <QSlider>
#include <QPalette>
#include <QComboBox>
#include <QGridLayout>
#include <QLabel>
#include <QPushButton>
#include <QSignalMapper>
#include <QFrame>
class Dialog : public QDialog
{
    Q_OBJECT
    
public:
    Dialog(QWidget *parent = 0);
    ~Dialog();

public slots:
    void changeColorUsingComboBox();
    void changeColorUsingSpinBox();
private:
    QSpinBox *redSpinBox;
    QSpinBox *greenSpinBox;
    QSpinBox *blueSpinBox;

    QLabel *redSpinBoxLabel;
    QLabel *greenSpinBoxLabel;
    QLabel *blueSpinBoxLabel;

    QSlider *redSlider;
    QSlider *greenSlider;
    QSlider *blueSlider;

    QLabel *redSliderLabel;
    QLabel *greenSliderLabel;
    QLabel *blueSliderLabel;


    QPalette palette;
    QComboBox *comboBox;
    QLabel *comboBoxLabel;
    QGridLayout *gridLayout;
    QSignalMapper *signalMapper;

    QFrame *separator;



};

#endif // DIALOG_H
