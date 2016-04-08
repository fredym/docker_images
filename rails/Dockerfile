FROM fedora

MAINTAINER Fredy Muñoz <fredy@munoz.im>

RUN dnf -y install \
      ruby \
      sqlite \
      rubygem-rails \
      rubygem-sqlite3 \
      rubygem-coffee-rails \
      rubygem-sass-rails \
      rubygem-uglifier \
      rubygem-jquery-rails \
      rubygem-turbolinks \
      rubygem-jbuilder \
      rubygem-therubyracer \
      rubygem-sdoc \
      rubygem-spring \
      rubygem-byebug \
      rubygem-web-console \
      && \
    dnf -y clean all

ENTRYPOINT ["rails"]


ONBUILD ENV APP_PATH /usr/src/app
ONBUILD RUN mkdir -p $APP_PATH
ONBUILD WORKDIR $APP_PATH

ONBUILD COPY Gemfile $APP_PATH
ONBUILD COPY Gemfile.lock $APP_PATH
ONBUILD RUN bundle install --local

ONBUILD COPY . $APP_PATH

ONBUILD EXPOSE 3000
ONBUILD CMD ["server", "-b", "0.0.0.0"]


# References
# ----------
#
# https://developer.fedoraproject.org/tech/languages/ruby/ror-installation.html
# https://fedoraproject.org/wiki/Changes/Ruby_on_Rails_4.2
# https://fedoraproject.org/wiki/Ruby_SIG
# https://github.com/docker-library/rails/blob/9df9b5e6b1519faf22e1565c2caaebf7cc1c665b/onbuild/Dockerfile
