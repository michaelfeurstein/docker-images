# docker images

**simplytcl**

a first image for learning purposes.  
docker hub: [simplytcl](https://hub.docker.com/r/michaelfeurstein/simplytcl)

`docker run -it simplytcl:latest`

or 

`docker run simplytcl:latest`

**simplynx**

An image running next-scripting framework (nx 2.4.0) and tdom 0.9.5  
dockerhub: [simplynx](https://hub.docker.com/r/michaelfeurstein/simplynx)  
  
`entrypoint.sh` is setup to take in arguments to start a tcl/nx script inside image  
`runExample.tcl` and `testFile.tcl` are not included in image  
Note that `runExample.tcl` will create an example.txt in /usr/local bind mounted directory

run `runExample.tcl` with simplynx:  
`docker run -v /path/to/host/dir/simplynx/:/usr/local/ simplynx:latest /usr/local/runExample.tcl`

run `runExample.tcl` through `testFile.tcl`:  
`docker run -v /path/to/host/dir/simplynx/:/usr/local/ simplynx:latest /usr/local/testFile.tcl /usr/local/runExample.tcl`
