#!/bin/bash

mkdir -p /vagrant/src/python;
cd /vagrant/src/python;
django-admin.py startproject interview;
rm interview/interview/settings.py
cp /vagrant/configs/python/settings.py interview/interview/settings.py
cd interview;
python manage.py syncdb