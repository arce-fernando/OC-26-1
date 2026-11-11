#include <stdio.h>

int str_len(char *str);
void str_mid(char *str_out, char *str1_in, int start, int end);
int clrBit(int value, int nbit);

int main(){

    char str[30];
    char str_out[30];
    int op=0, longitud=0, start=0, end=0, valor=0, nbit=0, res=0;

    puts("");
    do{
        puts("=============== MENU ===============");
        puts(" 1. Longitud de cadena.");
        puts(" 2. Copiar rango de una cadena.");
        puts(" 3. Cambiar un bit específico a 0.");
        printf("Ingresa una opción: "); scanf("%d",&op);
        puts("");
        switch(op){
            case 1: printf("Ingresa una cadena: "); scanf("%s",str);
                    longitud = str_len(str);
                    printf("La longitud de %s es de: %d\n\n",str,longitud);
                    break;
            case 2: printf("Ingresa una cadena: "); scanf("%s",str);
                    printf("Ingresa el índice del inicio: "); scanf("%d",&start);
                    printf("Ingresa el índice del final: "); scanf("%d",&end);
                    str_mid(str_out, str, start, end);
                    printf("Cadena resultante: %s\n\n",str_out);
                    break;
            case 3:
            default: puts("Ingresa una opción válida"); break;
        }

    }while(op!=4);


return 0;}