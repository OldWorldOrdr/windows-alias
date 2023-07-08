PKGNAME := alias
STRIP := llvm-strip
CC := clang

ifndef VERBOSE
Q = @
endif

CFLAGS := -Wall -Wextra -Werror -Wno-unused-command-line-argument -std=c99 -Os -fno-asynchronous-unwind-tables
LDFLAGS := -nostdlib -lkernel32 -fuse-ld=lld

all: $(PKGNAME).c
	@printf " \033[1;32mCC\033[0m %s\n" "$(PKGNAME).c"
	$(Q)$(CC) $(CFLAGS) $(PKGNAME).c -c
	@printf " \033[1;34mLD\033[0m %s\n" "$(PKGNAME).exe"
	$(Q)$(CC) $(LDFLAGS) $(PKGNAME).o -o $(PKGNAME).exe -s
	$(Q)$(STRIP) $(PKGNAME).exe

debug:
	@printf " \033[1;35mCC\033[0m %s\n" "$(PKGNAME).c"
	$(Q)$(CC) $(CFLAGS) $(PKGNAME).c -c -g
	@printf " \033[1;34mLD\033[0m %s\n" "$(PKGNAME).exe"
	$(Q)$(CC) $(LDFLAGS) $(PKGNAME).o -o $(PKGNAME).exe -g

clean:
	@printf "Cleaning...\n"
	$(Q)rm -f *.o *.exe
