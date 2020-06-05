
python2:
	docker build -t python2fire src/python2/
clean :
	docker image rm python2fire