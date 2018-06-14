# centos-phpfpm

### 1. clone poject

``` git clone https://github.com/ppongsak/centos-phpfpm.git ```

### 2. install docker

https://docs.docker.com/install

when finished install docker try command

``` docker --help ```

will see all docker command on screen

### 3. pull centos:7 image

we need to pull docker image from hub

``` docker pull centos:7 ```

### 4. access to centos-php folder 

``` cd centos-php ```

### 5. build new image 

``` docker build -t centos-phpfpm:tag . ```

Ex. ``` docker build -t centos-phpfpm:1.0 . ```

### 6. complete

wait until complete and run this command

``` docker images ```

will see centos-php image
