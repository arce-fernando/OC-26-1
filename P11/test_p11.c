#include <stdio.h>

int str_len(char *str);
void str_mid(char *str_out, char *str1_in, int start, int end);
int clrBit(int value, int nbit);

int main(){

    char str[];
    int op=0, longitud;

    puts("");
    do{
        puts("=============== MENU ===============");
        puts(" 1. Longitud de cadena.");
        puts(" 2. Copiar rango de una cadena.");
        puts(" 3. Cambiar un bit específico a 0.");
    }while(op!=4);


    printf("Ingresa una cadena: "); scanf("%s",str);
    longitud = str_len(str);
    
    /*Resultados*/
    printf("La longitud de %s es de: %d",str,longitud);

return 0;}