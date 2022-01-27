# recfsusb2n
FROM collelog/recfsusb2n-build:epgdatacapbon-latest-alpine AS recfsusb2n-image
# libarib25
FROM collelog/libarib25-build:epgdatacapbon-latest-alpine AS libarib25-image
# arib-b25-stream-test
FROM collelog/arib-b25-stream-test-build:latest-alpine AS arib-b25-stream-test-image

# final image
FROM mirakc/mirakc:alpine

COPY --from=recfsusb2n-image /build /
COPY --from=libarib25-image /build /
COPY --from=arib-b25-stream-test-image /build /

RUN apk add --no-cache pcsc-lite-libs
