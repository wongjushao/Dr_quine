# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wongj <wongj@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/06/25 03:07:46 by wongj             #+#    #+#              #
#    Updated: 2026/06/25 20:01:09 by wongj            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = rm -f

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): Colleen.c
	$(CC) $(CFLAGS) Colleen.c -o $(COLLEEN)

$(GRACE): Grace.c
	$(CC) $(CFLAGS) Grace.c -o $(GRACE)

$(SULLY): Sully.c
	$(CC) $(CFLAGS) Sully.c -o $(SULLY)

clean:
	$(RM) Grace_kid.c Sully_*.c Sully_[0-9]

fclean: clean
	$(RM) $(COLLEEN) $(GRACE) $(SULLY)

re: fclean all

.PHONY: all clean fclean re
