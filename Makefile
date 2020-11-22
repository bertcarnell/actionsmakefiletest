all: AB.so AB_stripped.so

%.o: %.cpp
	$(CXX) -g -c -fPIC -o $@ $<
	echo $(CC) $(CXX) $(AR) $(LD)

AB.so: A.o B.o
	$(CXX) -shared -o $@ $^
	ls -alh AB.so

AB_stripped.so: A.o B.o
	$(CXX) -shared -Wl,-S -o $@ $^
	ls -alh AB_stripped.so
