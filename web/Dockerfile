FROM ppodgorsek/robot-framework:3.0.6

RUN dnf upgrade -y

RUN pip install robotframework-extendedselenium2library beautifulsoup4 requests

COPY ./tests /opt/robotframework/tests
COPY ./resources /opt/robotframework/tests/resources
COPY ./results-parse.py /opt/robotframework/bin
COPY ./run-tests-in-virtual-screen.sh /opt/robotframework/bin

RUN mv /usr/lib64/chromium-browser/chromium-browser /usr/lib64/chromium-browser/chromium-browser-original\
	&& ln -sfv /opt/robotframework/bin/chromium-browser /usr/lib64/chromium-browser/chromium-browser
