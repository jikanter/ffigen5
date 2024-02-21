CC = /usr/bin/clang
APPLE_SDKROOT = /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.0.sdk
APPLE_LIBROOT = /Library/Developer/CommandLineTools/usr/lib
CONDA_PROJECTNAME = lisp-implementation
CONDA_PREFIX = ${HOME}/micromamba/envs/${CONDA_PROJECTNAME}
PROJECT_ROOT= ${PWD}
VERBOSE = -v
# rpath is needed otherwise the
CFLAGS = ${VERBOSE} -lclang -I${PROJECT_ROOT}/include -I${CONDA_PREFIX}/include -I${CONDA_PREFIX}/lib/clang/15.0.7 -I${APPLE_SDKROOT}/usr/include \
-L/Library/Developer/CommandLineTools/usr/lib -isysroot ${APPLE_SDKROOT} -rpath ${APPLE_LIBROOT}

all:
	$(CC) $(CFLAGS) source/ffigen5.c -o ffigen/bin/ffigen
install:
	$(INSTALL) ffigen/bin/ffigen ${HOME}/Developer/Applications
