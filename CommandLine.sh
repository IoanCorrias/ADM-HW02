#!/bin/sh

pip install csvkit

clear

csvcut --tabs -c post_id,profile_id,description instagram_posts.csv | csvgrep -c description -r '.{100,}' | head --lines 11 > selected_posts.csv

csvjoin -c profile_id selected_posts.csv instagram_profiles.csv > merged.csv

csvcut -c profile_id,profile_name merged.csv | csvlook