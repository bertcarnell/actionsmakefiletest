all: AB.so AB_stripped.so

%.o: %.cpp
	$(CXX) -g -c -o $@ $<
	echo $(CC) $(CXX) $(AR) $(LD)

AB.so: A.o B.o
	$(CXX) -shared -o $@ $^

AB_stripped.so: A.o B.o
	$(CXX) -shared -S -o $@ $^
