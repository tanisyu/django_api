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

## #2 How to django

- [はじめての Django アプリ作成、その 1](https://docs.djangoproject.com/ja/3.1/intro/tutorial01/)

  - project作成
  ```
  django-admin startproject django_tutorial
  ```

  - アプリの追加
  ```
  python manage.py startapp polls
  ```

  - url追加
    - polls.views
    ```
    from django.http import HttpResponse


    def index(request):
      return HttpResponse("Hello, world. You're at the polls index.")
    ```

    - polls.urls (ファイルごと追加)
    ```
    from django.urls import path

    from . import views

    urlpatterns = [
        path('', views.index, name='index'),
    ]
    ```

    - django_tutorial.urls
    ```
    from django.contrib import admin
    from django.urls import include, path

    urlpatterns = [
        path('polls/', include('polls.urls')),
        path('admin/', admin.site.urls),
    ]
    ```

  - reload then accsess `http://localhost:8080/polls/`

- [はじめての Django アプリ作成、その 2](https://docs.djangoproject.com/ja/3.1/intro/tutorial02/)

  - モデル追加
    - polls.models
    ```
    class Question(models.Model):
        question_text = models.CharField(max_length=200)
        pub_date = models.DateTimeField('date published')


    class Choice(models.Model):
        question = models.ForeignKey(Question, on_delete=models.CASCADE)
        choice_text = models.CharField(max_length=200)
        votes = models.IntegerField(default=0)
    ```

  - INSTALLED_APPSへ追加してdjangoにアプリの追加を知らせる
    - django_tutorial.settings (デフォルト部分で必要ない箇所は消してもok)
    ```
    INSTALLED_APPS = [
    'polls.apps.PollsConfig',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    ]
    ```

  - djangoにマイグレーションファイルを作成させる
    - コマンド実行
    ```
    python manage.py makemigrations polls
    ```

    - 作成されたマイグレーションファイルで発行されるSQL確認
    ```
    python manage.py sqlmigrate polls 0001
    ```

    - マイグレーション実行
    ```
    python manage.py migrate
    ```

  - モデルのクラスメソッド設定
    - \_\_str\_\_ (`python manage.py shell`でデータ取得時、表示される値を変えられる)
    ```
    >>> Question.objects.all()
    <QuerySet [<Question: Question object (1)>]>
    ↓
    >>> Question.objects.all()
    <QuerySet [<Question: What's up?>]>
    ```

  - adminサイト関連
    - adminユーザー作成
    ```
    python manage.py createsuperuser
    ```

    - adminユーザーでログイン
    ```
    http://localhost:8080/admin/
    ```

    - `polls.admin`でPollアプリをadmin上で編集できるようにする
    ```
    from django.contrib import admin

    from .models import Question

    admin.site.register(Question)
    ```    
