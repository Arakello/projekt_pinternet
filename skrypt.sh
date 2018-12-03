#!/bin/bash
convert $1 -colorspace gray \
  \( +clone -tile data/pencil_tile.gif -draw "color 0,0 reset" \
	+clone +swap -compose color_dodge -composite \) \
	 -fx 'u*.2+v*.8' $1
