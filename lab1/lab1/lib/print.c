#include "print.h"
#include "sbi.h"

void puts(char *s) {
   int i = 0;
   while(s[i] != '\0') sbi_ecall(0x1, 0x0, (int)s[i++], 0, 0, 0 ,0, 0);
       	// unimplemented
}

void puti(int x) {
	int num;
	if (x>0) {
	num = x%10;
	puti(x/10);
	sbi_ecall(0x1, 0x0, 0x30+num, 0,0,0,0,0);
	}

    // unimplemented
}
