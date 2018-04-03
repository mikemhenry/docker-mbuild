default: docker_build

REPO = cmelab
NAME = mbuild

docker_build:
	@docker build \
	-t $(NAME)/$(REPO):`cat VERSION` \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg VERSION=`cat VERSION` \
	--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` .
