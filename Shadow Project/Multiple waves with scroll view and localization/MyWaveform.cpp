#include "mywaveform.h"

MyWaveform::MyWaveform(QObject *parent) : QObject(parent)
{log.open("log_file.txt", std::ios::out);
    log<<"\n----------------------------  Waveform object has been created ";
    log.close();

}

int MyWaveform::ymax()
{
    int MaxValue=0;
    vector<double>::iterator iter;
    for(iter=Yvec.begin();iter!=Yvec.end();++iter)
        if(*iter > MaxValue)
            MaxValue=(int)*iter;
    log.open("log_file.txt", std::ios::out|std::ios::app);
        log<<"\n\n** Peak amplitude value="<<MaxValue<<"has been sent to qml file";
        log.close();

    return MaxValue;
}


int MyWaveform::ymin()
{
    int MinValue=0;
    vector<double>::iterator iter;
    for(iter=Yvec.begin();iter!=Yvec.end();++iter)
        if(*iter < MinValue)
            MinValue=(int)*iter;
    log.open("log_file.txt", std::ios::out|std::ios::app);
        log<<"\n\n## Lowest amplitude value="<<MinValue<<"has been sent to qml file";
        log.close();
  return MinValue;

}

int MyWaveform::xmax()
{
    int MaxValue=0;
    vector<double>::iterator iter;
    for(iter=Xvec.begin();iter!=Xvec.end();++iter)
        if(*iter > MaxValue)
            MaxValue=(int)*iter;
    log.open("log_file.txt", std::ios::out|std::ios::app);
        log<<"\n\n--> Peak X-axis value="<<MaxValue<<"has been sent to qml file";
        log.close();
    return MaxValue;
}


int MyWaveform::xmin()
{
    int MinValue=0;
    vector<double>::iterator iter;
    for(iter=Xvec.begin();iter!=Xvec.end();++iter)
        if(*iter < MinValue)
            MinValue=(int)*iter;
    log.open("log_file.txt", std::ios::out|std::ios::app);
        log<<"\n\n<-- lowest amplitude value="<<MinValue<<"has been sent to qml file";
        log.close();
  return MinValue;

}

int MyWaveform::numberOfSamples()
{
    log.open("log_file.txt", std::ios::out|std::ios::app);
        log<<"\n\n^^ Number of samples present in data file="<< Xvec.size()<<"has been sent to qml file";
        log.close();
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
    fin.open(filename, std::ios::in);
    if(!fin.is_open())
    {
        cout<<"UNABLE to open file";
        cout<<"\n";
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
    log.open("log_file.txt", std::ios::out|std::ios::app);
        log<<"\n\n******************************** The input file named"<<filename<<"hasd been read successfully";
        log.close();

}


void MyWaveform::Browsefile(string &value)
{
    filename=value;
    read_data(Xvec,Yvec);
    log.open("log_file.txt", std::ios::out|std::ios::app);
        log<<"\n\n file named="<< filename<<"has been browsed successfully";
        log.close();
}

void MyWaveform::update_that()
{
    Xvec_dup.clear();
    Yvec_dup.clear();
    vector<double>::iterator iter;
    for(iter=Xvec.begin();iter!=Xvec.end();++iter)
    Xvec_dup.push_back(*iter);//+0.5*(QRandomGenerator::global()->generateDouble())
    for(iter=Yvec.begin();iter!=Yvec.end();++iter)
    Yvec_dup.push_back(*iter);//+0.5*(QRandomGenerator::global()->generateDouble())
    log.open("log_file.txt", std::ios::out|std::ios::app);
        log<<"\n\n***file="<< filename <<"has been updated successfully";
        log.close();
}

void MyWaveform::resizeFile_name(QVariant str)
{

       std::string url=str.toString().toStdString();
      url.erase (0,8);

      Browsefile(url);
}
