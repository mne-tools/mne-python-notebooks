URL ?= gramfort@ssh.enst.fr:~/public_html/mne/lyon2016/

IPYNB_FILES := $(wildcard *.ipynb)
HTML_FILES := $(IPYNB_FILES:.ipynb=.html)

all: $(HTML_FILES)

clean:
	rm -f *.tex *.aux *.log *.idx *.out *.html

%.html: %.ipynb
	jupyter nbconvert --to html $<

upload:
	scp *.html $(URL)
	scp *.ipynb $(URL)
	scp -r images $(URL)
