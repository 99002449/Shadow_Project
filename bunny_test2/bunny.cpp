#include<bits/stdc++.h>
#include"bunny.h"
using namespace std;


//Base class functions
string bunnyParent::getName(){return name;}
string bunnyParent::getGender(){return gender;}
string bunnyParent::getColor(){return color;}
int bunnyParent::getAge(){return age;}
bool bunnyParent::getRadioactive(){return radioactive;}

void bunnyParent::setName(string name)
{
   this->name=name;
}
void bunnyParent::setGender(string gender)
{
   this->gender=gender;
}
void bunnyParent::setColor(string color)
{
   this->color=color;
}
void bunnyParent::setAge(int age)
{
   this->age=age;
}
void bunnyParent::setRadioactive(bool radioactive)
{
   this->radioactive=radioactive;
}


//Inherited class fuctions
void bunny::GetRandomName()
{
    vector<string> thenames;
    readthat(thenames);

    setName(thenames[rand()%100]);
}

void bunny::GetRandomGender()
{
    int flag=rand()%2;
    if(flag==0)
        setGender("male");
    else if(flag==1)
        setGender("female");

}

void bunny::GetRandomColour()
{
    int flag=rand()%4;

    if(flag==0)
        setColor("white");
    else if(flag==1)
        setColor("black");
    else if(flag==2)
        setColor("brown");
    else if(flag==3)
        setColor("spotted");

}

void bunny::GetRadioactiveOrNot()
{
    int flag=rand()%1000;

    if(flag>0 && flag<20)
    {
        setRadioactive(true);
        cout<<"                                                   RADIO-ACTIVE is born\n";}
    else
        setRadioactive(false);

    if(getRadioactive())
        cout<<"radioactive :"<<flag<<"\n";

}
void bunny::readthat(vector<string>&bunnynames)
{
    string S;
    fstream fin;
    fin.open("Names.csv",ios::in);
    while(getline(fin,S))
    {
        bunnynames.push_back(S);

    }
    fin.close();

}



void bunny::breeding(list<bunny>&db)
{
    int tcount=0,mcount=0;
    string male="male";
    string female="female";
    int maleCount=0,femCount=0;
    list<bunny>::iterator iter;

    for(iter=db.begin(); iter!=db.end(); ++iter)
    {
        tcount++;

        if((male==iter->getGender()))
            maleCount++;
        if((female==iter->getGender()))
            femCount++;
    }
    cout<<"\t\t\t--In Previous Turn: \n";
    cout<<"\t\t\t\tmale:"<<maleCount<<"\n";
    cout<<"\t\t\tfemale:"<<femCount<<"\n";
    list<bunny>::iterator iter1;
    for(iter1=db.begin(); iter1!=db.end(); ++iter1)
    {
        mcount++;
        if(mcount>=tcount+1)
            break;
        if(iter1->getGender()==female&& iter1->getRadioactive()==false)
        {

            bunny temp(iter1->getColor());
            db.push_back(temp);
        }
    }
}

void bunny::checkRadioactivity(list<bunny>&db)
{
    int Rcount=0,remCount=0,RcountFalse=0;
    list<bunny>::iterator iter,iter1;

    for(iter=db.begin(); iter!=db.end(); ++iter)
    {
        if(iter->getRadioactive()==true)
            Rcount++;

    }
    cout<<"\t\t\t\tRADIO-ACTIVE count:"<<Rcount<<"\n";
    remCount=Rcount;
    if(Rcount>=1)
    {
        while(remCount!=0)
        {

        for(iter=db.begin(); iter!=db.end(); ++iter)
        {
            //if(remCount==Rcount)
               // break;
            RcountFalse=0;
            for(iter1=db.begin(); iter1!=db.end(); ++iter1)
            {
              if(iter1->getRadioactive()==false)
                    RcountFalse++;

            }
            //cout<<"\nRFalse: :"<<RcountFalse;
            //cout<<"\nRTrue: :"<<Rcount;
            //cout<<"\nDb size: :"<<db.size();

     //cout<<"outside if";
     //getchar();
            if(RcountFalse==0)
            {
                cout<<"All are Radio Active\n";
                remCount=0;
                break;
            }
            else
            {
                if(iter->getRadioactive()==false)
                {

                    //remCount++;
                    --remCount;
                    cout<<"\t\t\t\t"<<remCount<<"  changed to ra\n";
                    iter->setRadioactive(true);


                    break;

                }
            }

        }


        }
        cout<<remCount<<"\n";

    }
}

void bunny::GenerateNextTurn(list<bunny> &db)
{
    int ocount=0;
    list<bunny>::iterator iter;
    fstream fcout;
    fcout.open("OUTPUT_LOG.txt",ios::out|ios::app);


    cout<<"Count\tName\t\t\tGender\tCOlor\tRadio\tAge\n";
    cout<<"-------------------------------------------------------------------------------------------------------\n";


    fcout<<"Count\tName\t\t\tGender\tCOlor\tRadio\tAge\n";
    fcout<<"-------------------------------------------------------------------------------------------------------\n";

    for(iter=db.begin(); iter!=db.end(); ++iter)
    {
        //cout<<"\nObject count:"<<++ocount<<"\n";

        cout<<"\n"<<++ocount;
        cout<<"RA "<<iter->getRadioactive()<<"  ";
        fcout<<"\n"<<++ocount;
        fcout<<"RA "<<iter->getRadioactive()<<"  ";
        switch(iter->getRadioactive())
        {
        case 0:
            if(iter->getAge()>10)
            {
                cout<<"\t\t\t"<<iter->getName()<<" nor  expired\n";
                 fcout<<"\t\t\t"<<iter->getName()<<" nor  expired\n";
               // iter->flag=1;
                //db.pop_front();
                break;
            }

           // cout<<"-------------------------------------------------------------------------------------------------------\n";
            cout<<"Bunny "<<iter->getName()<<"\t\t";
            cout<<iter->getGender()<<"\t";
            cout<<iter->getColor()<<"\t";
            cout<<iter->getRadioactive()<<"\t";
            cout<<iter->getAge()<<"\n";

            fcout<<"Bunny "<<iter->getName()<<"\t\t";
            fcout<<iter->getGender()<<"\t";
            fcout<<iter->getColor()<<"\t";
            fcout<<iter->getRadioactive()<<"\t";
            fcout<<iter->getAge()<<"\n";
            iter->setAge(iter->getAge() + 1);
           // cout<<"-------------------------------------------------------------------------------------------------------\n";


            break;

        case 1:
            if(iter->getAge() >=5)
            {
                cout<<"                                       "<<iter->getName()<<" rad expired\n";
                fcout<<"                                       "<<iter->getName()<<" rad expired\n";
                //db.pop_front();
                break;
            }


            //cout<<"-------------------------------------------------------------------------------------------------------\n";
            cout<<"Bunny "<<iter->getName()<<"\t\t";
            cout<<iter->getGender()<<"\t";
            cout<<iter->getColor()<<"\t";
            cout<<iter->getRadioactive()<<"\t";
            cout<<iter->getAge()<<"\n";



            fcout<<"Bunny "<<iter->getName()<<"\t\t";
            fcout<<iter->getGender()<<"\t";
            fcout<<iter->getColor()<<"\t";
            fcout<<iter->getRadioactive()<<"\t";
            fcout<<iter->getAge()<<"\n";
            iter->setAge(iter->getAge() + 1);
             //cout<<"-------------------------------------------------------------------------------------------------------\n";


            break;

        default:
            cout<<"Bunny "<<iter->getName()<<"\t\t";
            cout<<iter->getGender()<<"\t";
            cout<<iter->getColor()<<"\t";
            cout<<iter->getRadioactive()<<"\t";
            cout<<iter->getAge()<<"\n";

            fcout<<"Bunny "<<iter->getName()<<"\t\t";
            fcout<<iter->getGender()<<"\t";
            fcout<<iter->getColor()<<"\t";
            fcout<<iter->getRadioactive()<<"\t";
            fcout<<iter->getAge()<<"\n";
            fcout<<"Default";  break;
            iter->setAge(iter->getAge() + 1);
        }



    }



fcout.close();
}
void bunny::delete_extra(list<bunny>&db)
{int ocount=0;

 list<bunny>::iterator iter;
 for(iter=db.begin(); iter!=db.end(); ++iter)
 {
     ocount++;
 }
     if(ocount>1000)
        {
            list<bunny>::iterator it1,it;
            it=db.begin();
            advance(it,ocount/2);
            db.erase(it1,it);
        }
}
