# DevOps User Portal (Dark Theme) -- for deployment practice

Modern, Bootstrap-styled JSP/Servlet portal with Login, Register, and Dashboard.

## Build
```bash
mvn clean package
```

## Run in Tomcat via Docker
```bash
docker build -t <yourdockerhubusername>/userportal:<yourtag> .
docker run -d -p 8080:8080 <yourdockerhubusername>/userportal:<yourtag>
```

## Multi-platform build (optional)
```bash
docker buildx build --platform linux/amd64,linux/arm64 -t <yourdockerhubusername>/userportal:<yourtag> --push .
```

## Env vars for DB (defaults shown)
```
DB_HOST=mysql
DB_PORT=3306
DB_NAME=userdb
DB_USER=timi
DB_PASS=rootpass
```

> Note: Passwords are plain text for demo parity. Never use in production.

