#!/bin/bash

mkdir -p /vagrant/src/ruby;
cd /vagrant/src/ruby;
rails new interview --database=mysql;
cd interview;
rm /vagrant/src/ruby/interview/config/database.yml;
cp /vagrant/configs/ruby/database.yml /vagrant/src/ruby/interview/config/database.yml;
rm /vagrant/src/ruby/interview/Gemfile;
cp /vagrant/configs/ruby/Gemfile /vagrant/src/ruby/interview/Gemfile;
bundle install;