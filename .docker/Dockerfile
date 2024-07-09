FROM rockylinux:9
RUN dnf -y install git clang python3-devel \
    && dnf -y --enablerepo=crb install swig \
    && pip install cpplint
