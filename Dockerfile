# Use Fedora 38 as the base image
FROM fedora:38

# Install Java OpenJDK, python3-pip, and ansible
RUN dnf --assumeyes install iputils git java-17-openjdk python3-pip && \
    export JAVA_HOME=/usr/lib/jvm/jre-17-openjdk && \
    pip3 install ansible ansible-rulebook ansible-runner ansible-lint ansible-doc-extractor

# Set the JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/jre-17-openjdk

RUN pip install aiohttp elasticsearch python-dateutil pyyaml
RUN ansible-galaxy collection install ansible.eda cloin.eda

CMD ["ping 8.8.8.8"]

