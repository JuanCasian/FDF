# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcasian <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/23 14:03:41 by jcasian           #+#    #+#              #
#    Updated: 2018/07/27 13:22:01 by jcasian          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf

SRCSDIR = srcs
LIBSDIR = libs
SRCS = $(addprefix $(SRCSDIR)/,\
	  main.c put_error.c create_boards.c fdf.c \
	  do_calculations.c draw_map.c rotations.c draw_instructions.c) 
INCLUDES = includes
OBJECTS = $(patsubst %.c, %.o, $(SRCS))
MINILIBX = -L$(LIBSDIR) -lmlx -framework OpenGL -framework AppKit

all: $(NAME)

%.o: %.c
	gcc -c -Wall -Werror -Wextra -I$(INCLUDES) -c $< -o $@

$(NAME): $(OBJECTS)
	gcc -o $(NAME) $(OBJECTS) -L$(LIBSDIR) -lft $(MINILIBX) 

clean:
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(NAME)

re: fclean all

debug:
	gcc -g -Wall -Wextra -Werror -I$(INCLUDES) srcs/*.c libft/*.c $(MINILIBX) -o debug

debugclean:
	rm -rf debug*

redebug: debugclean debug
