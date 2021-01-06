# name the portage image
FROM gentoo/portage:latest as portage

# image is based on stage3-amd64
FROM gentoo/stage3-amd64:latest

# copy the entire portage volume in
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

# install repoman
RUN emerge -qv repoman

# copy ebuilds
ADD app-misc/foo /var/db/repos/gentoo/app-misc/foo
ADD app-misc/bar /var/db/repos/gentoo/app-misc/bar

# create manifests
RUN cd /var/db/repos/gentoo/app-misc/foo && \
	repoman manifest && \
	cd /var/db/repos/gentoo/app-misc/bar && \
	repoman manifest
