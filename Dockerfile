FROM nginx:alpine
COPY index.html /usr/share/nginx/index.htlm
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
