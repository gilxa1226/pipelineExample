FROM nginxinc/nginx-unprivileged

COPY dist/pipelineExample/* /usr/share/nginx/html/
COPY bin/uid_entrypoint /

RUN chmod g+u /etc/passwd
ENTRYPOINT [ "uid_entrypoint" ]
USER 1001