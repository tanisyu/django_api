# django_api
clone api from rails_api_react_todo with python django

## #1 Development

- Build and run migrate then up container

```
docker-compose build
docker-compose run web python manage.py migrate
docker-compose up
```

- Check enable to access api

```
http://localhost:8080/
```
