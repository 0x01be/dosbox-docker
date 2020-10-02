FROM alpine

RUN apk add --no-cache --virtual dosbox-build-dependencies \
    subversion \
    build-base \
    autoconf \
    automake \
    sdl-dev \
    libogg-dev \
    libvorbis-dev \
    libpng-dev \
    freeglut-dev \
    libx11-dev

RUN svn co svn://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk /dosbox

WORKDIR /dosbox

ENV LDFLAGS "${LDFLAGS} -s"

RUN ./autogen.sh
RUN ./configure --prefix=/opt/dosbox
RUN make
RUN make install

