CX:=g++
CPPFLAGS:=-O3 
APPNAME := $(shell basename `pwd`)

%: %.cpp
	$(CX) $(CPPFLAGS) -o $@ $^

all: $(APPNAME)

clean:
	rm $(APPNAME)

tarball: clean
	@cd ../ && tar -cvzf "$(APPNAME).tar.gz" $(APPNAME)

