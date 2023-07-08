PKGNAME := alias
STRIP := llvm-strip
CC := clang

CFLAGS += -Wall -Wextra -Werror -Wno-unused-command-line-argument -std=c99 -Os -fno-asynchronous-unwind-tables
LDFLAGS += -fuse-ld=lld -nostdlib -lkernel32

all: $(PKGNAME).c
	@printf " \033[1;32mCC\033[0m %s\n" "$(PKGNAME).c"
	@$(CC) $(CFLAGS) $(PKGNAME).c -c
	@printf " \033[1;34mLD\033[0m %s\n" "$(PKGNAME).exe"
	@$(CC) $(LDFLAGS) $(PKGNAME).o -o $(PKGNAME).exe -s
	@$(STRIP) $(PKGNAME).exe

debug:
	@printf " \033[1;35mCC\033[0m %s\n" "$(PKGNAME).c"
	@$(CC) $(CFLAGS) $(PKGNAME).c -c -g
	@printf " \033[1;34mLD\033[0m %s\n" "$(PKGNAME).exe"
	@$(CC) $(LDFLAGS) $(PKGNAME).o -o $(PKGNAME).exe -g

clean:
	@printf "Cleaning...\n"
	@rm -f *.o *.exe
