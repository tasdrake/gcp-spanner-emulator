FROM gcr.io/cloud-spanner-emulator/emulator AS builder
LABEL stage=builder
# RUN gcloud components install cloud-spanner-emulator

FROM openjdk:jre-alpine

COPY --from=builder . /spanner-emulator

RUN apk --update --no-cache add tini bash
ENTRYPOINT ["/sbin/tini", "--"]
CMD /spanner-emulator/bin/cloud-spanner-emulator --host=0.0.0.0 --port=9010
EXPOSE 9010