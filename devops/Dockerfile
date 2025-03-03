FROM debian:12.9

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y which sed binutils build-essential diffutils gcc g++ \
    bash patch gzip bzip2 perl tar cpio unzip rsync file bc findutils wget  \
    python3 libncurses5-dev libncursesw5-dev libncurses5 libncursesw5 git   \
    curl cvs mercurial openssh-client subversion && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/buildroot-2024.11.1

RUN wget https://buildroot.org/downloads/buildroot-2024.11.1.tar.gz && \
    tar zxvf buildroot-2024.11.1.tar.gz --strip-components=1 && \
    rm buildroot-2024.11.1.tar.gz

WORKDIR /var/buildroot 
RUN chmod g+w /var/buildroot

RUN useradd -m -s /bin/bash devops && \
    usermod -aG root devops 

USER devops

WORKDIR /home/devops 

CMD ["/bin/bash"]
