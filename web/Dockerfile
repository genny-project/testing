FROM rohitcs/rohit-robot

# Install necessary packages
RUN set -x \
    && apt-get update --quiet \
    && apt-get install --quiet --yes --no-install-recommends jq  iputils-ping vim  \
    && apt-get clean


COPY ./tests /home/robot-framework/tests
COPY ./resources /home/robot-framework/resources


