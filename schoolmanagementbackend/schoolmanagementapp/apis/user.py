from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from schoolmanagementapp.models import *


@api_view(['POST'])
def signIn(request):
    name = request.data["name"]
    password = request.data["password"]
    try:
        user = User.objects.get(name=name, password=password)
        return Response({"id": user.id, "name": user.name, "year": user.year, "position": user.position, "attendance": user.attendance, "contact": user.contact, "created": user.created, "password": user.password})
    except:
        return Response(False)


@api_view(['POST'])
def signInWithSession(request):
    id = int(request.data["id"])
    print(id)
    try:
        user = User.objects.get(id=id)
        return Response({"id": user.id, "name": user.name, "year": user.year, "position": user.position, "attendance": user.attendance, "contact": user.contact, "created": user.created, "password": user.password})
    except:
        return Response(False)


@api_view(['PUT'])
def updateUser(request):
    id = int(request.data["id"])
    print(id)
    try:
        user = User.objects.get(id=id)
        if "contact" in request.data:
            user.contact = request.data["contact"]
        if "password" in request.data:
            user.password = request.data["password"]
        user.save()
        return Response({"id": user.id, "name": user.name, "year": user.year, "position": user.position, "attendance": user.attendance, "contact": user.contact, "created": user.created, "password": user.password})
    except:
        return Response(False)

