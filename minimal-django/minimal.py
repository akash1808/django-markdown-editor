import sys

from django.conf import settings
from django.conf.urls import url
from django.core.management import execute_from_command_line
from django.http import HttpResponse

settings.configure(
    DEBUG=True,
    ROOT_URLCONF=sys.modules[__name__],
    ALLOWED_HOSTS=["bla-bla.com", "localhost", "127.0.0.1","35.231.62.135","34.73.18.75"],
)


def index(request):
    return HttpResponse('<h1>A minimal Django response!</h1>')

urlpatterns = [
    url(r'^$', index),
]

if __name__ == '__main__':
    execute_from_command_line(sys.argv)
