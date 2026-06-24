#include <stdio.h>

/*
	Grace is here
*/

# define NAME "Grace_kid.c"
# define SRC "#include <stdio.h>%1$c%1$c/*%1$c	Grace is here%1$c*/%1$c%1$c# define NAME %2$cGrace_kid.c%2$c%1$c# define SRC %2$c%3$s%2$c%1$c# define Grace() int main() { FILE *file = fopen(NAME, %2$cw%2$c); if (!file) {return (1);} fprintf(file, SRC, 10, 34, SRC); fclose(file); return (0); }%1$c%1$cGrace();"
# define Grace() int main() { FILE *file = fopen(NAME, "w"); if (!file) {return (1);} fprintf(file, SRC, 10, 34, SRC); fclose(file); return (0); }

Grace();