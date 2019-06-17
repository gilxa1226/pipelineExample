FROM nginxinc/nginx-unprivileged

COPY dist/pipelineExample/* /usr/share/nginx/html/

