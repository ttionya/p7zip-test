FROM alpine:3.16

COPY p7zip /app/

WORKDIR /app/

RUN apk add --no-cache gcc g++ make \
  && ln -sf "makefile.linux_any_cpu_gcc_4.X" "makefile.machine" \
  && make all3 OPTFLAGS="$CXXFLAGS -O2" \
  && make test
