NAME=rodjek-scripts
BINARY=$(HOME)/.bin/$(NAME)
SCRIPT=$(PWD)/$(NAME)
LISP=cl-launch
INSTALL=install
LN=ln

.PHONY: all $(NAME) clean

all: $(NAME)

$(NAME):
	@CL_SOURCE_REGISTRY=$(PWD)/: $(LISP) --output $(NAME) --dump ! --lisp sbcl --quicklisp --dispatch-system $(NAME)/main --system $(NAME)

install: $(NAME)
	@$(INSTALL) $(SCRIPT) $(BINARY)
	@$(BINARY) make-script-symlinks $(NAME)

clean:
	@rm -f $(NAME)
