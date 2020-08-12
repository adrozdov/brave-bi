This repository containes scripts and configuration files to install BI system on Mac OS, Ubuntu, or in the cloud using Bravetools.

Folder Bravetools containes Bravetools executables compiled for Mac OS and Ubuntu. To run Bravetools on Mac OS or Windows installation of Canonical Multipass required.

config.yml is a sample configuration for Bravetools.

To install all units run `bash install.sh` from project root.

To install individual units run `bash install.sh` from each project folder.

Running Jupyter Notebooks requires token. Token appears in terminal window during **mlbase** unit installation. It also can be obtained by executing `pyton notebook list` directly inside **mlbase** unit.

Connection string to the database from Dashboard `postgresql://postgres:password@10.0.0.200/brave_data`

Save resulting dataframe as a table in Postgresql database

```Python
from sqlalchemy import create_engine
engine = create_engine('postgresql://postgres:password@10.0.0.200/brave_data')
dataframe.to_sql('result', engine)
```