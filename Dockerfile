FROM nginx
WORKDIR /usr/share/nginx/html
RUN set -x \
   && apt-get update \
   && apt-get -y install wget \
   && wget $(wget -q -O - https://api.github.com/repos/screwdriver-cd/ui/releases/latest \
       | awk '/browser_download_url/ { print $2 }' \
       | sed 's/"//g') \
   && tar -xvzf sdui.tgz \
   && rm -rf sdui.tgz
