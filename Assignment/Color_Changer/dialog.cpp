#include "dialog.h"



Dialog::Dialog(QWidget *parent)
    : QDialog(parent)
{
    redSpinBoxLabel = new QLabel("Red",this);
    greenSpinBoxLabel = new QLabel("Green",this);
    blueSpinBoxLabel = new QLabel("Blue",this);

    redSpinBox = new QSpinBox(this);
    redSpinBox->setRange(0,255);
    greenSpinBox = new QSpinBox(this);
    greenSpinBox->setRange(0,255);
    blueSpinBox = new QSpinBox(this);
    blueSpinBox->setRange(0,255);

    redSliderLabel = new QLabel("Red", this);
    greenSliderLabel = new QLabel("Green", this);
    blueSliderLabel = new QLabel("Blue", this);

    redSlider = new QSlider(Qt::Horizontal, this);
    blueSlider = new QSlider(Qt::Horizontal, this);
    greenSlider = new QSlider(Qt::Horizontal, this);

    redSlider->setRange(0,255);
    greenSlider->setRange(0,255);
    blueSlider->setRange(0,255);

    comboBox = new QComboBox(this);
    comboBoxLabel = new QLabel("Standard Color",this);
    gridLayout = new QGridLayout(this);
    signalMapper = new QSignalMapper(this);


    comboBox->addItem("Select");
    comboBox->addItem("Black");
    comboBox->addItem("Red");
    comboBox->addItem("Blue");
    comboBox->addItem("Green");
    comboBox->addItem("Yellow");


    separator = new QFrame(this);
    separator->setLineWidth(1);
    separator->setFrameShape(QFrame::HLine);
    separator->setPalette(QPalette(QColor(0, 0, 0)));

    palette.setColor(QPalette::Background,QColor(216,182,246));// or (QPalette::Source, QColor(r,g,b,a) /  Qt::white/black...)
    setPalette(palette);

    gridLayout->addWidget(redSpinBoxLabel,0,0);
    gridLayout->addWidget(greenSpinBoxLabel,0,1);
    gridLayout->addWidget(blueSpinBoxLabel,0,2);

    gridLayout->addWidget(redSpinBox,1,0);
    gridLayout->addWidget(greenSpinBox,1,1);
    gridLayout->addWidget(blueSpinBox,1,2);

    gridLayout->addWidget(separator,2,0,1,3);//separator

    gridLayout->addWidget(redSliderLabel,3,0,1,3);
    gridLayout->addWidget(redSlider,4,0,1,3);

    gridLayout->addWidget(greenSliderLabel,5,0,1,3);
    gridLayout->addWidget(greenSlider,6,0,1,3);

    gridLayout->addWidget(blueSliderLabel,7,0,1,3);
    gridLayout->addWidget(blueSlider,8,0,1,3);

    gridLayout->addWidget(separator,9,0,1,3);//separator


    gridLayout->addWidget(comboBoxLabel,10,0,1,3);
    gridLayout->addWidget(comboBox,11,0,1,3);

    connect(comboBox,SIGNAL(activated(int)),this,SLOT(changeColorUsingComboBox()));

    connect(redSpinBox,SIGNAL(valueChanged(int)),this,SLOT(changeColorUsingSpinBox()));
    connect(greenSpinBox,SIGNAL(valueChanged(int)),this,SLOT(changeColorUsingSpinBox()));
    connect(blueSpinBox,SIGNAL(valueChanged(int)),this,SLOT(changeColorUsingSpinBox()));

    connect(redSpinBox,SIGNAL(valueChanged(int)),redSlider,SLOT(setValue(int)));
    connect(blueSpinBox,SIGNAL(valueChanged(int)),blueSlider,SLOT(setValue(int)));
    connect(greenSpinBox,SIGNAL(valueChanged(int)),greenSlider,SLOT(setValue(int)));

    connect(redSlider,SIGNAL(valueChanged(int)),redSpinBox,SLOT(setValue(int)));
    connect(blueSlider,SIGNAL(valueChanged(int)),blueSpinBox,SLOT(setValue(int)));
    connect(greenSlider,SIGNAL(valueChanged(int)),greenSpinBox,SLOT(setValue(int)));




}

Dialog::~Dialog()
{
    
}

void Dialog::changeColorUsingComboBox()
{
    switch (comboBox->currentIndex())
    {
        case 1: palette.setColor(QPalette::Background,Qt::black);
                setPalette(palette);
                redSpinBox->setValue(0);
                greenSpinBox->setValue(0);
                blueSpinBox->setValue(0);
                break;
        case 2: palette.setColor(QPalette::Background,Qt::red);
                setPalette(palette);
                redSpinBox->setValue(255);
                greenSpinBox->setValue(0);
                blueSpinBox->setValue(0);
                break;
        case 3: palette.setColor(QPalette::Background,Qt::blue);
                setPalette(palette);
                redSpinBox->setValue(0);
                greenSpinBox->setValue(255);
                blueSpinBox->setValue(0);
                break;
        case 4: palette.setColor(QPalette::Background,Qt::green);
                setPalette(palette);
                redSpinBox->setValue(0);
                greenSpinBox->setValue(0);
                blueSpinBox->setValue(255);
                break;
        case 5: palette.setColor(QPalette::Background,Qt::yellow);
                setPalette(palette);
                redSpinBox->setValue(255);
                greenSpinBox->setValue(255);
                blueSpinBox->setValue(0);
                break;
        default:break;
    }
}


void Dialog::changeColorUsingSpinBox()
{
    palette.setColor(QPalette::Background,QColor(redSpinBox->value(),greenSpinBox->value(),blueSpinBox->value()));
    setPalette(palette);
}
