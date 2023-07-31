PKGNAME := alias
CC := gcc
STRIP := strip

ifndef VERBOSE
Q = @
endif

CFLAGS := -Wall -Wextra -Werror -std=c99 -Os -fno-asynchronous-unwind-tables
LDFLAGS := -nostdlib -lkernel32

all: $(PKGNAME).c
	@printf " \033[1;32mCC\033[0m %s\n" "$(PKGNAME).c"
	$(Q)$(CC) $(PKGNAME).c -c $(CFLAGS)
	@printf " \033[1;34mLD\033[0m %s\n" "$(PKGNAME).exe"
	$(Q)$(CC) $(PKGNAME).o -o $(PKGNAME).exe -s $(LDFLAGS)
	$(Q)$(STRIP) $(PKGNAME).exe

debug:
	@printf " \033[1;35mCC\033[0m %s\n" "$(PKGNAME).c"
	$(Q)$(CC) $(PKGNAME).c -c -g $(CFLAGS)
	@printf " \033[1;34mLD\033[0m %s\n" "$(PKGNAME).exe"
	$(Q)$(CC) $(PKGNAME).o -o $(PKGNAME).exe -g $(LDFLAGS)

clean:
	@printf "Cleaning...\n"
	$(Q)rm -f *.o *.exe
