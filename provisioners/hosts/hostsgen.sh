#!/usr/bin/env bash

sh /hosts/getip.sh | sed 'N;s/\n/ /' > /hosts/hosts

