# Automatic version control mechanism.

Install in your project's `sources` directory
`git subtree add --prefix=sources/version https://github.com/yuriimouse/version.git master --squash`

Add the line to your `Makefile`
`VERSION=$(shell ./version/version.sh | head -n 1 )`

You can use 
`#ifndef VERSION`
`#include "version/version.h"` 
`#endif // VERSION`
in your code
```h
#define VERSION_MAJOR 3
#define VERSION_MINOR 21
#define VERSION_BUILD 13
#define VERSION_COMMIT "1bee6c2"
#define VERSION "3.21.13"
```


## MAJOR - manually set the number in the last line.

## MINOR - add a free description to create the next minor version and restart the build version.

## BUILD - changes automatically.

Just delete the `version` file to create a new one.
