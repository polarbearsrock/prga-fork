
FROM python:3.8.2-slim


WORKDIR /app


RUN apt-get update && apt-get install -y \
    git \
    gcc \
    g++ \
    make \
    wget \
    build-essential \
    libz-dev \
    libxml2-dev \
    bison \
    flex \
    tcl-dev \
    tk-dev \
    libreadline-dev \
    libffi-dev \   
    python3-venv \
    iverilog \
    yosys \
    && wget https://github.com/Kitware/CMake/releases/download/v3.26.4/cmake-3.26.4-linux-x86_64.sh \
    && chmod +x cmake-3.26.4-linux-x86_64.sh \
    && ./cmake-3.26.4-linux-x86_64.sh --skip-license --prefix=/usr/local \
    && rm cmake-3.26.4-linux-x86_64.sh


RUN apt-get install -y tcl8.6-dev tk8.6-dev



COPY . /app


RUN chmod +x ./envscr/install && ./envscr/install

CMD ["/bin/bash"]