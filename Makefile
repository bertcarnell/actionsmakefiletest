
ifeq ($(OS),Windows_NT) 
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

ifeq ($(detected_OS),Windows)
    CXXFLAGS += -Wl,-S
else
ifeq ($(detected_OS),Darwin)
	CXXFLAGS += -Wl,-S
else
ifeq ($(detected_OS),Linux)
	CXXFLAGS += -Wl,-S
endif
endif
endif

all: AB.so AB_stripped.so

%.o: %.cpp
	$(CXX) -g -c -fPIC -o $@ $<

AB.so: A.o B.o
	$(CXX) -shared -o $@ $^
	ls -alh AB.so

AB_stripped.so: A.o B.o
	$(CXX) -shared $(CXXFLAGS) -o $@ $^
	ls -alh AB_stripped.so
	echo $(CC) $(CXX) $(AR) $(LD)
	$(CXX) --version
