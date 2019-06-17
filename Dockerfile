FROM nginxinc/nginx-unprivileged

COPY dist/pipelineExample/* /usr/share/nginx/html/
COPY bin/uid_entrypoint /

RUN chgrp -R 0 /usr/share/nginx/html && \
    chmod -R g=u /usr/share/nginx/html

RUN chmod g+u /etc/passwd
ENTRYPOINT [ "uid_entrypoint" ]
USER 1001