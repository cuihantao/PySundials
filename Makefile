all:
	python setup.py build_ext --inplace

clean:
	rm -rf build
	rm -rf CySundials/*.so
