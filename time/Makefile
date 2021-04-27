FILES = time-archive.sh time-log.sh time-analysis.sh README Makefile
TAR_FILE = time-analysis.tar.gz

default: ${TAR_FILE}

${TAR_FILE}: ${FILES}
	mkdir time
	cp ${FILES} time
	tar cfvz ${TAR_FILE} time
	rm -rf time

clean:
	rm ${TAR_FILE}; rm -rf time
