#include "include/constants.h"
#include "include/print.h"

// Never ever move this method away from the top, 
// it needs to be the first called function.
void kernelRun() {
	clear();

	char *osTitleLine = "                  ____  _                 _         ___  ____";
	println(osTitleLine, 8);
	osTitleLine = "                 / ___|(_)_ __ ___  _ __ | | ___   / _ \\/ ___|";
	println(osTitleLine, 9);
	osTitleLine = "                 \\___ \\| | '_ ` _ \\| '_ \\| |/ _ \\ | | | \\___ \\";
	println(osTitleLine, 10);
	osTitleLine = "                  ___) | | | | | | | |_) | |  __/ | |_| |___) |";
	println(osTitleLine, 11);
	osTitleLine = "                 |____/|_|_| |_| |_| .__/|_|\\___|  \\___/|____/";
	println(osTitleLine, 12);
	osTitleLine = "                                   |_|";
	println(osTitleLine, 13);

	// Run the kernel in an endless loop
	while(1) continue;
}

void println(char *string, int line) {
	// volatile?
	volatile char *pVideoMemory = (volatile char *)VIDEO_MEMORY_TEXT + 2 * sizeof(char) * 80 * line;

	while(*string != 0) {
		*pVideoMemory = *string++;

		// Add 2 bytes to the pointer, because the video memory
		// stores character and color information
		pVideoMemory += 2;
	}
}

void clear() {
	char *pVideoMemory = (char *)VIDEO_MEMORY_TEXT;

	for(int i = 0; i < 25; ++i) {
		for(int j = 0; j < 80; ++j, pVideoMemory += 2) {
			*pVideoMemory = ' ';
		}
	}
}

void sleep() {
	///////////////////////////////////////////////////////////////////////////
	// TODO: Search for a proper way to stop the cpu for a certain amount of time
	///////////////////////////////////////////////////////////////////////////
}
