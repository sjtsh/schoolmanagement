from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from schoolmanagementapp.models import *


@api_view(['GET'])
def getEvents(request):
    events = Event.objects.all()
    returnable = []
    for i in events:
        aDict = {"title": i.title, "description": i.description,
                 "start_time": i.start_time, "end_time": i.end_time, "date": i.date}
        returnable.append(aDict)
    return Response(returnable)


@api_view(['GET'])
def getHolidays(request):
    holidays = Holiday.objects.all()
    returnable = []
    for i in holidays:
        aDict = {"title": i.title, "description": i.description, "date": i.date}
        returnable.append(aDict)
    return Response(returnable)


@api_view(['GET'])
def getAnnouncements(request):
    announcements = Announcement.objects.all()
    returnable = []
    for i in announcements:
        aDict = {"tutor_id": i.tutor.id, "tutor_name": i.tutor.name,
                 "title": i.title, "description": i.description, "created": i.created}
        returnable.append(aDict)
    return Response(returnable)
