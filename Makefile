NAME_SERVER = server
NAME_CLIENT = client

LIBFT_DIR = Libft/
LIBFT = $(LIBFT_DIR)libft.a

SRC_DIR = src/

SRC_FILES_SERVER = src/server.c
SRC_FILES_CLIENT = src/client.c

CFLAGS = -Wextra -Wall -Werror -g

OBJ_SERVER = $(SRC_FILES_SERVER:.c=.o)
OBJ_CLIENT = $(SRC_FILES_CLIENT:.c=.o)

MAKEFLAGS += -se

all: $(NAME_SERVER) $(NAME_CLIENT)

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

$(NAME_SERVER): $(OBJ_SERVER) $(LIBFT)
	gcc $(CFLAGS) $(OBJ_SERVER) -L$(LIBFT_DIR) -lft -o $(NAME_SERVER)

$(NAME_CLIENT): $(OBJ_CLIENT) $(LIBFT)
	gcc $(CFLAGS) $(OBJ_CLIENT) -L$(LIBFT_DIR) -lft -o $(NAME_CLIENT)

	$(MAKE) all -C $(LIBFT_DIR)

%.o: %.c
	gcc $(CFLAGS) -c $< -o $@

clean:
	@rm -rf $(OBJ_SERVER)
	@rm -rf $(OBJ_CLIENT)
	@$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	@rm -rf $(NAME_SERVER)
	@rm -rf $(NAME_CLIENT)
	@$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re