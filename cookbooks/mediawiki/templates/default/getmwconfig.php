<?php
################################################################################
# getmwconfig.php
################################################################################
# PHP script, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Pulls variable values from the MediaWiki LocalSettings.php file.
################################################################################
define("MEDIAWIKI", "true");
include '/var/tmp/LocalSettings.php';
$get_var = $argv[1];
echo "${$get_var}";
?>