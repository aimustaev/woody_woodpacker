NAME 		= Famine
SRCS 		= famine.c \
				parse_utils.c read_file_utils.c g_decryptor.c \
				encrypt_func.c cron_bonus.c

BSRCS 		= famine_bonus.c \
				parse_utils.c read_file_utils_bonus.c g_decryptor.c \
				encrypt_func.c cron_bonus.c

OBJS		= $(SRCS:.c=.o)
BOBJS		= $(BSRCS:.c=.o)
LIBFT		= ./libft/libft.a
LIBFT_SOURCES := $(shell find libft -name "*.c")
LIBFT_OBJECTS := $(LIBFT_SOURCES:.c=.o)
# CFLAGS		= -Wall -Werror -Wextra -I$(dir $(LIBFT)) -MMD
CFLAGS		= -Werror -I$(dir $(LIBFT)) -MMD
CC			= gcc

all:		$(NAME)

$(NAME):	$(OBJS) $(LIBFT)
			nasm -f bin inject.s -o g_decryptor
			xxd -i -c8 g_decryptor g_decryptor.c
			gcc  -o $(NAME) -L$(dir $(LIBFT)) -lft $(OBJS) $(LIBFT_OBJECTS)
			@echo ""
			@echo "▂▃▅▇█▓▒░ DONE ░▒▓█▇▅▃▂"
			@echo ""

$(LIBFT):	FORCE
			make bonus -C $(dir $(LIBFT))

FORCE:

-include	$(SRCS:.c=.d)

bonus:		$(BOBJS) $(LIBFT)
			nasm -f bin inject_bonus.s -o g_decryptor
			xxd -i -c8 g_decryptor g_decryptor.c
			gcc  -o Famine_bonus -L$(dir $(LIBFT)) -lft $(BOBJS) $(LIBFT_OBJECTS)
			@echo ""
			@echo "▂▃▅▇█▓▒░ DONE ░▒▓█▇▅▃▂"
			@echo ""

clean:
			make clean -C $(dir $(LIBFT))
			$(RM) $(OBJS) $(SRCS:.c=.d)

fclean:		clean
			$(RM) $(LIBFT)
			$(RM) $(NAME)
			$(RM) $(BOBJS)
			$(RM) Famine_bonus

re:			fclean all

run:		$(NAME)
			./$(NAME)

.PHONY: 	all clean fclean re run norm