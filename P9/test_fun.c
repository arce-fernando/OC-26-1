#include <stdio.h>

int suma(int num1, int num2);
int mystrcmp(char *str1, char *str2);
int mystrlen (char *str);
int getBit(int value, int numbit);
int setBit(int value, int numbit);

int main(){
    printf("Suma: %d\n",suma(5,3));
    printf("Comparar: %d\n",mystrcmp("hola","hola"));
    printf("Longitud: %d\n",mystrlen("hola"));
    printf("Bit: %d\n",getBit(4,2));
    printf("Set bit: %d\n",setBit(0,2));
    return 0;
}