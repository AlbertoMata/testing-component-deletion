#!/bin/bash

sfdx force:source:convert --outputdir metadata-output-dir
zip -r changes-set.zip metadata-output-dir/
sfdx force:mdapi:deploy --zipfile changes-set.zip --testlevel RunSpecifiedTests --runtests TestingObjectControllerTest --wait 3
rm -rf changes-set.zip metadata-output-dir/