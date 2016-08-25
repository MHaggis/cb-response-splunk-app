APPNAME=DA-ESS-CbResponse
VERSION=1.0.0
BUNDLE=$(APPNAME)-$(VERSION)
all: $(APPNAME).spl

clean:
	rm -f build/$(APPNAME).spl
	rm -rf build/$(APPNAME)

$(APPNAME).spl:
	mkdir -p build/$(APPNAME)

	cp -r $(APPNAME)/appserver build/$(APPNAME)
	cp -r $(APPNAME)/bin build/$(APPNAME)
	cp -r $(APPNAME)/default build/$(APPNAME)
	cp -r $(APPNAME)/metadata build/$(APPNAME)
	cp -r $(APPNAME)/static build/$(APPNAME)
	cp LICENSE.md build/$(APPNAME)
	cp README.md build/$(APPNAME)
	rm -rf build/$(APPNAME)/local
	mkdir -p build/$(APPNAME)/local

	find build/$(APPNAME) -name ".*" -delete
	find build/$(APPNAME) -name "*.pyc" -delete

	(cd build && COPYFILE_DISABLE=1 tar -cvzf $(APPNAME).spl $(APPNAME))
