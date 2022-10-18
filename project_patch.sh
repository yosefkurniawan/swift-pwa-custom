#!/bin/bash
cd /usr/src/app

######################### START of line patch ############################
patch -p1 --forward < patches/sampe.patch || true
######################### END of line patch ##############################