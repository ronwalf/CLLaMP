This file contains information on how to install, configure, and use
the CLLaMP API and data.  It assumes that you are running on a
Linux-like operating system (e.g., Ubuntu or MacOS).

This release of CLLaMP contains the following files:

  Makefile          - Used with GNU make for various administrative tasks
  CLLaMP.cfg       - Configuration file
  CLLaMP.docx      - Paper written about the system
  CLLaMP.html      - API documentation
  CLLaMP.ipynb     - CLLaMP code in a Jupyter notebook
  CLLaMP.py        - A pure python export of the notebook
  README.txt        - This file
  dump              - A dump of the CLLaMP database
  requirements.txt  - Python package requirements


CONFIGURATION
=============

The file CLLaMP.cfg is a standard python config file
(https://docs.python.org/3/library/configparser.html) and has sections
for the datbase and LLM.  Below you will be asked to edit those
sections as needed for your local setup.

The parameters that are configurable are documented inside
CLLaMP.cfg.


INSTALLATION
============

(1) Starting in the directory containing the files above, create and
activate a virtual environment 

> python3 -m venv cllamp
> source cllamp/bin/activate

(2) Install required python packages

> pip install -r requirements.txt

(3) Install MongoDB and start the database server

https://www.mongodb.com/docs/manual/installation/

(4) Edit the MONGO section of CLLaMP.cfg as needed for you setup.
You may beed to edit the 'host' and 'port' parameters.  The 'db' and
'collection' parameters are just names for the database and collection
and can be unchanged.  Indeed, the defaults were used when creating
the database dump so some work will b required on your part to rename
them if you want to use different names.  If the database needs to be
password protected, edit the 'username' and 'password' parameters. 

(5) Get an OpenAI API key.

https://platform.openai.com/overview

(6) Edit CLLaMP.cfg and add you API key as the value for the
'api_key' parameter in the OPENAI section.

(7) Restore the MongoDB

> mongorestore 

In any new shell where you'd like to call the API, be sure to activate
the virtual environment first.  The database dump may be available in
some location other than the code due to its large size.



API USAGE
=========

The file CLLaMP.html contains information on how to use the API based
on docstrings in the code.  It was generated with pdoc3.



ADMINISTRATION
==============

Running make at the command line shows you what you can do with the
makefile.

> make

help
   Print help message
script
   Convert the CLLaMP notebook into a python module
apidocs
   Generate HTML documentation for the CLLaMP API
release
 Create a CLLaMP release in a directory named release_DATE_TIME
clean_releases
 Remove all release_* directories

The main things you may want to do are

(1) Update the API documetation

> make apidocs

(2) Make a new release based on changes you've made in the notebook

> make release

(3) Get rid of old releases

> make clean_releases

NOTICE
==============

This software was produced for the U. S. Government under Contract No.
FA8702-19-C-0001, and is subject to the Rights in Noncommercial Computer Software
and Noncommercial Computer Software Documentation Clause DFARS 252.227-7014 (FEB 2014)

Copyright 2024 The MITRE Corporation. Licensed under the BSD 3-clause license (see LICENSE.txt)
Approved for Public Release; Distribution Unlimited. Public Release Case Number 24-1157
