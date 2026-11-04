#include <stdio.h>

void pBin8b(int dato);
void pBin16b(int dato);
void pBin32b(int dato);
void pBin64b(long long dato);

int main(){
    int dato;

    printf("Ingresa un dato entero: ");
    scanf("%d",&dato);

    printf("Formato de 8 bits:\n"); pBin8b(dato);
    printf("\nFormato de 16 bits:\n"); pBin16b(dato);
    printf("\nFormato de 32 bits:\n"); pBin32b(dato);
    printf("\nFormato de 64 bits:\n"); pBin64b(dato);
    printf("\n");

    return 0;
}