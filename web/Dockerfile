FROM ppodgorsek/robot-framework:3.0.6

RUN dnf upgrade -y && dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y && dnf install x11vnc ffmpeg ffmpeg-devel tmux zip unzip procps -y

RUN pip install robotframework-extendedselenium2library beautifulsoup4 requests

RUN curl https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip -O
RUN unzip BrowserStackLocal-linux-x64.zip -d /opt/robotframework/bin/


RUN mv /usr/lib64/chromium-browser/chromium-browser /usr/lib64/chromium-browser/chromium-browser-original\
	&& ln -sfv /opt/robotframework/bin/chromium-browser /usr/lib64/chromium-browser/chromium-browser

COPY ./tests /opt/robotframework/tests
COPY ./resources /opt/robotframework/tests/resources
COPY ./results-parse.py /opt/robotframework/bin
COPY ./run-tests-in-virtual-screen.sh /opt/robotframework/bin
COPY ./commands.sh /opt/robotframework/bin
