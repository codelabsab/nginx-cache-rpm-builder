# nginx-cache-rpm-builder

Builds nginx 1.3.5 with ngx_cache_purge 2.3 a Docker container

Change versions in `rpmbuild/SPECS/nginx.spec` if you want to build other versions.

### build
Run the command `make` in this directory and your rpm will be built to the dir `output/`