FROM rocker/shiny:latest

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
	libcurl4-openssl-dev \
	qpdf \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
	libxml2-dev \
	libjpeg-dev \
	default-jdk \
	openssh-server


RUN R CMD javareconf
# install R packages required
# (change it dependeing on the packages you need)
RUN R -e "install.packages('shiny')"

# copy the app to the image

COPY app.R /srv/shiny-server/

# select port
EXPOSE 3838

# allow permission
#RUN sudo chown -R shiny:shiny /srv/shiny-server
#RUN chmod -R 755 /srv/shiny-server/

# run app
#CMD ["/usr/bin/shiny-server.sh"]
