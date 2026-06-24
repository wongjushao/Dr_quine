#include <stdio.h>

/*
	Colleen
*/

char	*src = "#include <stdio.h>%1$c%1$c/*%1$c	Colleen%1$c*/%1$c%1$cchar	*src = %2$c%3$s%2$c;%1$c%1$cvoid	print(void)%1$c{%1$c	printf(src, 10, 34, src);%1$c}%1$c%1$cint	main(void)%1$c{%1$c	print();%1$c	/*%1$c		Colleen inside the main function%1$c	*/%1$c	return (0);%1$c}%1$c";

void	print(void)
{
	printf(src, 10, 34, src);
}

int	main(void)
{
	print();
	/*
		Colleen inside the main function
	*/
	return (0);
}
