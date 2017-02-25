#!/bin/bash

# Some variables
workspace=`pwd`
timestamp=`date +'%Y%m%d'`

#create the folder to store the wallpapers
mkdir -p ${workspace}"/wallpapers"

#retrieve the image url form the API
image=`curl -s -X GET https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY | sed '/hdurl/!d' | sed s/\"hdurl\":\ //g | sed s/\"//g | sed s/,//g`
wget ${image} -O ${workspace}"/wallpapers/"${timestamp}".jpg"

#if ubuntu
gsettings set org.gnome.desktop.background picture-uri "file://${workspace}"/wallpapers/"${timestamp}".jpg""
