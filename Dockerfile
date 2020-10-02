FROM 0x01be/dosbox:build as build

FROM 0x01be/xpra

COPY --from=build /opt/dosbox/ /opt/dosbox/

USER root

RUN apk add --no-cache --virtual dosbox-runtime-dependencies \
    libstdc++ \
    sdl \
    libogg \
    libvorbis \
    libpng \
    freeglut

USER xpra

ENV PATH ${PATH}:/opt/dosbox/bin/
ENV COMMAND "dosbox"

