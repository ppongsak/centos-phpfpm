# centos-phpfpm

### 1. clone poject

``` git clone https://github.com/ppongsak/centos-phpfpm.git ```

### 2. install docker

https://docs.docker.com/install 

### 3. pull centos:7 image

``` docker pull centos:7 ```

### 4. access to centos-php folder 

``` cd centos-php ```

### 5. build new image 

``` docker build -t centos-phpfpm:tag . ```

### 6. complete

wait until complete and run this command

``` docker images ```

will see centos-php image
