#   Print help message
help:
	@python makehelp.py


#   Convert the CLLaMP notebook into a python module 
script: 
	jupyter nbconvert --to python CLLaMP.ipynb


#   Generate HTML documentation for the CLLaMP API
apidocs: script  
	pdoc3 --force --html CLLaMP.py


# Create a CLLaMP release in a directory named release_DATE_TIME
release: apidocs
	$(eval RDIR := $(shell date "+release_%Y-%m-%d_%H_%M_%S"))
	echo Creating release in $(RDIR)
	mkdir $(RDIR)
	cp Makefile CLLaMP.ipynb CLLaMP.py README.txt html/CLLaMP.html $(RDIR)
	cp CLLaMP.cfg makehelp.py CLLaMP.docx $(RDIR)
	python -m pip freeze > $(RDIR)/requirements.txt
	echo Exporting database, this may take a while
	mongodump -d cllamp -o $(RDIR)/dump


# Remove all release_* directories
clean_releases:
	rm -rf release_*
