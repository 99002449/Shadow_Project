#ifndef BUNNY_H_INCLUDED
#define BUNNY_H_INCLUDED

#include<bits/stdc++.h>

using namespace std;

//Base class
class bunnyParent
{
    private:
        string name;
        string gender;
        string color;
        int age;
        bool radioactive;
    public:
        //virtual functions
        virtual void readthat(vector<string>&)=0;
        virtual void GetRandomName()=0;
        virtual void GetRandomGender()=0;
        virtual void GetRandomColour()=0;
        virtual void GetRadioactiveOrNot()=0;

        //getters
        string getName();
        string getGender();
        string getColor();
        int getAge();
        bool getRadioactive();

        //setters
        void setName(string);
        void setGender(string);
        void setColor(string);
        void setAge(int);
        void setRadioactive(bool);


};


//Inherited class
class bunny: public bunnyParent
{
    public:
    //Default Constructor
        bunny()
        {
            GetRandomName();
            cout<<"\t\t\t\tBunny  "<<getName()<<" was born \n";
            GetRandomGender();
            GetRandomColour();
            GetRadioactiveOrNot();
            setAge(0);

        }
    //Parameterized Constructors
        bunny(string parentcolour)
        {
            GetRandomName();
            cout<<"t\t\t\tBunny "<<getName()<<" was born \n";
            GetRandomGender();
            setColor(parentcolour);
            GetRadioactiveOrNot();
            setAge(0);

        }
    //overriden functions
    void readthat(vector<string>&) override;
    void GetRandomName() override;
    void GetRandomGender() override;
    void GetRandomColour()override;
    void GetRadioactiveOrNot() override;

    //Other functions
    void breeding(list<bunny>&);
    void  checkRadioactivity(list<bunny>&);
    void GenerateNextTurn(list<bunny>&);
    void delete_extra(list<bunny>&);

};

#endif // BUNNY_H_INCLUDED
