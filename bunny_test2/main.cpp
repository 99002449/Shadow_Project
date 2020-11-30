#include<bits/stdc++.h>
#include"bunny.h"

using namespace std;
void breeding(list<bunny>&);
void  checkRadioactivity(list<bunny>&);
void GenerateNextTurn(list<bunny>&);
void delete_extra(list<bunny>&);

int main()
{
    list<bunny> thelist;
    bunny a[5];
    for(int i=0; i<5; i++)
    {
        thelist.push_back(a[i]);
    }

    while(1)
    {
        checkRadioactivity(thelist);
        getchar();
        GenerateNextTurn(thelist);
        delete_extra(thelist);
        getchar();
        breeding(thelist);
    }
    return 0;
}


void breeding(list<bunny>&db)
{
    int tcount=0,mcount=0;
    string male="male";
    string female="female";
    int maleCount=0,femCount=0;
    list<bunny>::iterator iter;

    for(iter=db.begin(); iter!=db.end(); ++iter)
    {
        tcount++;

        if((male==iter->gender))
            maleCount++;
        if((female==iter->gender))
            femCount++;
    }
    cout<<"                                          --In Previous Turn: \n";
    cout<<"                                             male:"<<maleCount<<"\n";
    cout<<"                                             female:"<<femCount<<"\n";
    list<bunny>::iterator iter1;
    for(iter1=db.begin(); iter1!=db.end(); ++iter1)
    {
        mcount++;
        if(mcount>=tcount+1)
            break;
        if(iter1->gender==female&& iter1->radioactive==false)
        {

            bunny temp(iter1->colour);
            db.push_back(temp);
        }
    }
}

void checkRadioactivity(list<bunny>&db)
{
    int Rcount=0,remCount=0,RcountFalse=0;
    list<bunny>::iterator iter,iter1;

    for(iter=db.begin(); iter!=db.end(); ++iter)
    {
        if(iter->radioactive==true)
            Rcount++;

    }
    cout<<"                                     RADIO-ACTIVE count:"<<Rcount<<"\n";
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
              if(iter1->radioactive==false)
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
                if(iter->radioactive==false)
                {


                    //remCount++;
                    --remCount;
                    cout<<"                                                                  "<<remCount<<"  changed to ra\n";
                    iter->radioactive=true;


                    break;

                }
            }

        }


        }
        cout<<remCount<<"\n";

    }
}

void GenerateNextTurn(list<bunny> &db)
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
        cout<<"RA "<<iter->radioactive<<"  ";
        fcout<<"\n"<<++ocount;
        fcout<<"RA "<<iter->radioactive<<"  ";
        switch(iter->radioactive)
        {
        case 0:
            if(iter->age>10)
            {
                cout<<"                                      "<<iter->name<<" nor  expired\n";
                 fcout<<"                                      "<<iter->name<<" nor  expired\n";
               // iter->flag=1;
                //db.pop_front();
                break;
            }

           // cout<<"-------------------------------------------------------------------------------------------------------\n";
            cout<<"Bunny "<<iter->name<<"\t\t";
            cout<<iter->gender<<"\t";
            cout<<iter->colour<<"\t";
            cout<<iter->radioactive<<"\t";
            cout<<iter->age++<<"\n";

            fcout<<"Bunny "<<iter->name<<"\t\t";
            fcout<<iter->gender<<"\t";
            fcout<<iter->colour<<"\t";
            fcout<<iter->radioactive<<"\t";
            fcout<<iter->age++<<"\n";
           // cout<<"-------------------------------------------------------------------------------------------------------\n";


            break;

        case 1:
            if(iter->age >=5)
            {
                cout<<"                                       "<<iter->name<<" rad expired\n";
                fcout<<"                                       "<<iter->name<<" rad expired\n";
                //db.pop_front();
                break;
            }


            //cout<<"-------------------------------------------------------------------------------------------------------\n";
            cout<<"Bunny "<<iter->name<<"\t\t";
            cout<<iter->gender<<"\t";
            cout<<iter->colour<<"\t";
            cout<<iter->radioactive<<"\t";
            cout<<iter->age++<<"\n";

            fcout<<"Bunny "<<iter->name<<"\t\t";
            fcout<<iter->gender<<"\t";
            fcout<<iter->colour<<"\t";
            fcout<<iter->radioactive<<"\t";
            fcout<<iter->age++<<"\n";
             //cout<<"-------------------------------------------------------------------------------------------------------\n";


            break;

        default:
            cout<<"Bunny "<<iter->name<<"\t\t";
            cout<<iter->gender<<"\t";
            cout<<iter->colour<<"\t";
            cout<<iter->radioactive<<"\t";
            cout<<iter->age++<<"\n";
            cout<<"Default";

            fcout<<"Bunny "<<iter->name<<"\t\t";
            fcout<<iter->gender<<"\t";
            fcout<<iter->colour<<"\t";
            fcout<<iter->radioactive<<"\t";
            fcout<<iter->age++<<"\n";
            fcout<<"Default";  break;
        }



    }



fcout.close();
}
void delete_extra(list<bunny>&db)
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
