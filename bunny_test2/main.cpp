#include<bits/stdc++.h>
#include "bunny.h"

using namespace std;

int main()
{
    list<bunny> thelist;
    bunny a[5];
    for(int i=0; i<5; i++)
    {
        thelist.push_back(a[i]);
    }
    bunny obj;
    while(1)
    {
        obj.checkRadioactivity(thelist);
        getchar();
        obj.GenerateNextTurn(thelist);
        obj.delete_extra(thelist);
        getchar();
        obj.breeding(thelist);
    }
    return 0;
}



