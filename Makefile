PKGNAME := alias
STRIP := llvm-strip
CC := clang

OPTFLAGS += -Os -fno-asynchronous-unwind-tables
CFLAGS += -Wall -Wextra -Werror -Wno-unused-command-line-argument -std=c99
LDFLAGS += -fuse-ld=lld -nostdlib -lkernel32

all: $(PKGNAME).c
	@printf " \033[1;32mCC\033[0m %s\n" "$(PKGNAME).c"
	@$(CC) $(CFLAGS) $(LDFLAGS) $(OPTFLAGS) -o $(PKGNAME).exe $(PKGNAME).c -s
	@$(STRIP) $(PKGNAME).exe

debug:
	@printf " \033[1;33mCC\033[0m %s\n" "$(PKGNAME).c"
	@$(CC) $(CFLAGS) $(LDFLAGS) $(OPTFLAGS) -o $(PKGNAME).exe $(PKGNAME).c -g

clean:
	@printf "Cleaning...\n"
	@rm -f $(PKGNAME).exe
