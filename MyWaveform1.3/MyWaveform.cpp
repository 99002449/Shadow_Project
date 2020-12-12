#include"MyWaveform.h"

MyWaveform::MyWaveform(QObject *parent) : QObject(parent)
{

}

int MyWaveform::ymax()
{
    int MaxValue=0;
    vector<double>::iterator iter;
    for(iter=Yvec.begin();iter!=Yvec.end();++iter)
        if(*iter > MaxValue)
            MaxValue=(int)*iter;
    return MaxValue;
}


int MyWaveform::ymin()
{
    int MinValue=0;
    vector<double>::iterator iter;
    for(iter=Yvec.begin();iter!=Yvec.end();++iter)
        if(*iter < MinValue)
            MinValue=(int)*iter;
  return MinValue;

}

int MyWaveform::xmax()
{
    int MaxValue=0;
    vector<double>::iterator iter;
    for(iter=Xvec.begin();iter!=Xvec.end();++iter)
        if(*iter > MaxValue)
            MaxValue=(int)*iter;
    return MaxValue;
}


int MyWaveform::xmin()
{
    int MinValue=0;
    vector<double>::iterator iter;
    for(iter=Xvec.begin();iter!=Xvec.end();++iter)
        if(*iter < MinValue)
            MinValue=(int)*iter;
  return MinValue;

}

int MyWaveform::numberOfSamples()
{
    return Xvec.size();
}

double MyWaveform::getX(int index)
{
    return Xvec_dup[index];
}

double MyWaveform::getY(int index)
{
    return Yvec_dup[index];
}

void MyWaveform::read_data(vector<double> &avec, vector<double> &bvec)
{
    std::string line,A,B;
    std::fstream fin;
    avec.clear();
    bvec.clear();
    fin.open("C:/Users/99002641/Documents/LineChart/dataset1.csv", std::ios::in);
    if(!fin.is_open())
    {
        cout<<"UNABLE to open file";
        return;
    }
    while( getline(fin, line))
    { std::stringstream X(line);
        getline(X, A,',');
        getline(X, B,',');
        avec.push_back(std::stod(A));
        bvec.push_back(std::stod(B));
    }
    fin.close();
}


void MyWaveform::Browsefile(string &value)
{
    filename=value;
    read_data(Xvec,Yvec);
}

void MyWaveform::update_that()
{
    Xvec_dup.clear();
    Yvec_dup.clear();
    vector<double>::iterator iter;
    for(iter=Xvec.begin();iter!=Xvec.end();++iter)
    Xvec_dup.push_back(*iter);
    for(iter=Yvec.begin();iter!=Yvec.end();++iter)
    Yvec_dup.push_back(*iter);
}

void MyWaveform::resizeFile_name(QVariant str)
{

       std::string url=str.toString().toStdString();
      url.erase (0,8);

      Browsefile(url);
}
