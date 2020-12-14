#ifndef MYWAVEFORM_H
#define MYWAVEFORM_H

#include <QObject>
#include<QVector>
#include<bits/stdc++.h>
#include<QRandomGenerator>
#include<QtMath>
#include<bits/stdc++.h>
#include<QString>
#include<QVariant>
using namespace std;

class MyWaveform : public QObject
{Q_OBJECT

    std::string filename;
    vector<double> Xvec;
    vector<double> Yvec;
    vector<double> Xvec_dup;
    vector<double> Yvec_dup;

public:
    explicit MyWaveform(QObject *parent = nullptr);

    Q_INVOKABLE int ymin();
    Q_INVOKABLE int ymax();
    Q_INVOKABLE int xmin();
    Q_INVOKABLE int xmax();
    Q_INVOKABLE int numberOfSamples();
    Q_INVOKABLE double getX(int );
    Q_INVOKABLE double getY(int );
    void read_data(vector<double>&,vector<double>&);
    Q_INVOKABLE void update_that();
    Q_INVOKABLE void Browsefile(string &);
    Q_INVOKABLE void resizeFile_name(QVariant );

};

#endif // MYWAVEFORM_H
