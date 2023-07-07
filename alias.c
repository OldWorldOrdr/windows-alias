// Well-behaved command line aliases
// Unlike batch script aliases, this program will not produce an annoying and useless "Terminate batch job (Y/N)" prompt.

#include <windows.h>

#define EXE L"C:\\Users\\Joey\\AppData\\Local\\BusyBox\\busybox.exe"
#define CMD L"ash -l"

_Static_assert(sizeof(EXE) <= MAX_PATH, "EXE length exceeds MAX_PATH");

int mainCRTStartup(void) {
    STARTUPINFOW si;
    PROCESS_INFORMATION pi;

    if (!CreateProcessW(EXE, CMD, 0, 0, 1, 0, 0, 0, &si, &pi)) {
        return -4;
    }

    unsigned long ret;
    WaitForSingleObject(pi.hProcess, -1);
    GetExitCodeProcess(pi.hProcess, &ret);
    return ret;
}