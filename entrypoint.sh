#!/bin/bash

bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec puma -p 3000
