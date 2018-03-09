#!/bin/bash
sleep 15
flask dropdb
flask initdb
flask insertdata
flask download_and_extract_images
flask run --host=0.0.0.0