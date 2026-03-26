FROM rocker/tidyverse:4.4.2

#RUN R -e "install.packages(c('testthat', 'dplyr', 'usethis', 'devtools'), repos='https://cloud.r-project.org')"

# Set the default working directory for all RStudio sessions
RUN echo "session-default-working-dir=/home/rstudio/project" >> /etc/rstudio/rsession.conf