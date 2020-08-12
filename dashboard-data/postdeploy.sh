#!/bin/bash

sudo -Hiu postgres psql -U postgres -d postgres -c "alter user postgres with password 'password';"
sudo service postgresql restart
sudo -Hiu postgres createdb brave_data