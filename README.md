# ch.kimhauser.qt.AmicableNumbers

Calculation of amicable numbers with C++ / QT FW


## QT Project for calculating amicable numbers
I'm about to refresh my C++ skills specifically for cross-platform compilation with the QT Framework. To do that I implemented a small project / concept which I sometimes use to tryout new stuff and systems. It calculates amicable numbers for a user specified range and displays them in a table view. The calculation runs on its own thread and does not block the UI, but it updates the UI when a number is found. The program shows a progress bar while calculation (Start / End / Current). The thread can be canceled. Check it out, the source is available on GitHub from my open source repositories and you can download the Mac OS X, Linux, Windows and Android OS binary here from my website (http://kimhauser.ch/index.php/projects/qt-c#downloadexec). 


## Wiki definition
Amicable numbers are two different numbers so related that the sum of the proper divisors of each is equal to the other number. (A proper divisor of a number is a positive factor of that number other than the number itself. For example, the proper divisors of 6 are 1, 2, and 3.) A pair of amicable numbers constitutes an aliquot sequence of period 2. A related concept is that of a perfect number, which is a number that equals the sum of its own proper divisors, in other words a number which forms an aliquot sequence of period 1. Numbers that are members of an aliquot sequence with period greater than 2 are known as sociable numbers. 

The smallest pair of amicable numbers is (220, 284). They are amicable because the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110, of which the sum is 284; and the proper divisors of 284 are 1, 2, 4, 71 and 142, of which the sum is 220. 

The first ten amicable pairs are: (220, 284), (1184, 1210), (2620, 2924), (5020, 5564), (6232, 6368), (10744, 10856), (12285, 14595), (17296, 18416), (63020, 76084), and (66928, 66992).


## Main function / code of worker thread doing the calculation

```
// --- PROCESS ---
void Worker::process() {
    int nIdx = 0;
    for(int i = this->nFrom; i <= this->nTo; i++){
        if(bAbort)
            break;

        if(!list->contains(i)){
            int nQuer = calcSum(i);
            if(nQuer != i){
                if(i == calcSum(nQuer)){
                    list->append(nQuer);
                    emit numberFound(i, nQuer);
                }
            }
        }
        emit numberProcessed(this->nFrom, this->nTo, i);
        nIdx++;
    }
    emit finished();
}

int Worker::calcSum(int nNum){
    int nSum = 1;
    for(int i = 2; i <= qSqrt(nNum); i++){
        if(nNum % i == 0){
            nSum += i + (nNum / i);
        }
    }
    return nSum;
}
```