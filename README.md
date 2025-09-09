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

**simplySBL**

An image image providing the Storyboard Language setup.   
docker hub: TODO

Uses an input file (e.g. kv_storyboard.sbl) and two volume mounts in order to play around with the Storyboard Language  
The first volume mount provides the path to the storyboard script  
The second volume mount provides the output volume where you can finde the generated.html file  
After running the image with a storyboard file you can find the generated.html file via:

1. in your mounted output Volume via Docker Desktop -> Volumes -> output -> generated.html
2. using docker cp <imageid>:/usr/local/sbl/storyboards/output/generated.html <path to your local machine directory>

Run using KV-notation:  
`docker run -v /local/path/to/host/dir/simplySBL/kv_storyboard.sbl:/usr/local/sbl/kv_storyboard.sbl -v output:/usr/local/sbl/storyboards/output simplysbl:latest -n kv -s /usr/local/sbl/kv_storyboard.sbl`

Run using CNL-notation:  
`docker run -v /local/path/to/host/dir/simplySBL/cnl_storyboard.sbl:/usr/local/sbl/cnl_storyboard.sbl -v output:/usr/local/sbl/storyboards/output simplysbl:latest -n cnl -s /usr/local/sbl/cnl_storyboard.sbl`

