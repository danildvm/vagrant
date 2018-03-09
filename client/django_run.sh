#!/bin/bash
sleep 55
python manage.py migrate
python manage.py runserver 0.0.0.0:8000