FROM ppodgorsek/robot-framework:3.0.6

# Install necessary packages
#RUN set -x \
#    && apt-get update --quiet \
#    && apt-get install --quiet --yes --no-install-recommends jq  iputils-ping vim \
#    && apt-get clean

RUN dnf upgrade -y

RUN pip install robotframework-extendedselenium2library
RUN pip install beautifulsoup4

COPY ./tests /opt/robotframework/tests
COPY ./resources /opt/robotframework/tests/resources

RUN mv /usr/lib64/chromium-browser/chromium-browser /usr/lib64/chromium-browser/chromium-browser-original\
	&& ln -sfv /opt/robotframework/bin/chromium-browser /usr/lib64/chromium-browser/chromium-browser