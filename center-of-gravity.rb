#!/usr/bin/env ruby 
# calculates the center of gravity from the list of locations
#
# ruby center-of-gravity.rb KML_FILE_NAME

ZOOM_LEVEL=12
MAPS_URL="https://www.google.com/maps/@%f,%f,#{ZOOM_LEVEL}z\n"
sum_longtitude=0
sum_latitude=0
count=0

ARGF.read.gsub(/<coordinates>(.*?),(.*?)</) do |m|
  sum_longtitude += $1.to_f
  sum_latitude   += $2.to_f
  count          += 1
end

printf(MAPS_URL, sum_latitude / count, 
                 sum_longtitude / count)
