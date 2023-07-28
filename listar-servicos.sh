#!/bin/bash
echo listando serviços na máquina local

sudo systemctl list-unit-files --type service --all

