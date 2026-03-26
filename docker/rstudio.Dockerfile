FROM rocker/tidyverse:4.4.2

# Set the default working directory for all RStudio sessions
RUN echo "session-default-working-dir=/home/rstudio/project" >> /etc/rstudio/rsession.conf