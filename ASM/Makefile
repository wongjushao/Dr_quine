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

NASM = nasm
NASMFLAGS = -f elf64
LD = gcc
RM = rm -f

all: $(COLLEEN) $(GRACE) $(SULLY)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(COLLEEN): Colleen.o
	$(LD) Colleen.o -o $(COLLEEN)

$(GRACE): Grace.o
	$(LD) Grace.o -o $(GRACE)

$(SULLY): Sully.o
	$(LD) Sully.o -o $(SULLY)

clean:
	$(RM) Grace_kid.s Sully_*.s Sully_*.o Sully_[0-9] Colleen.o Grace.o Sully.o

fclean: clean
	$(RM) $(COLLEEN) $(GRACE) $(SULLY)

re: fclean all

.PHONY: all clean fclean re
