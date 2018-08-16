#!/usr/bin/env bash

vagrant plugin install vagrant-vbguest
vagrant destroy && vagrant up
