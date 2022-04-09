from django.urls import path

from .views import *
from .apis.event import *
from .apis.schedule import *
from .apis.user import *

urlpatterns = [
    path('', getRoutes),
    path('events/', getEvents),
    path('holidays/', getHolidays),
    path('announcements/', getAnnouncements),
    path('routines/<int:pk>/', getRoutines),
    path('exams/<int:pk>/', getExams),
    path('signin/', signIn),
    path('signinwithsession/', signInWithSession)
]
