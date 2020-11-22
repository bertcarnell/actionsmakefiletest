
%.o: %.cpp
	$(CXX) -g -c -o $@ $<
	echo $(CC)
	echo $(CXX)
	echo $(AR)
	echo $(LD)

AB.so: A.o B.o
	$(CXX) -shared -o $@ $^

AB_stripped.so: A.o B.o
	$(CXX) -shared -S -o $@ $^
