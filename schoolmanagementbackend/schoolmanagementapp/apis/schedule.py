from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from schoolmanagementapp.models import *
from datetime import datetime, timedelta


@api_view(['GET'])
def getRoutines(request, pk):
    routines = Routine.objects.all().filter(user=User.objects.get(id=pk))
    returnable = []
    for i in routines:
        aDict = {"module": i.module.name, "day": i.day,
                 "start_time": i.start_time, "end_time": i.end_time, "remarks": i.remarks, "meet_link": i.meet_link}
        returnable.append(aDict)
    return Response(returnable)


# class Exam(models.Model):
#     user = models.ForeignKey(User, on_delete=models.CASCADE)
#     module = models.ForeignKey(Module, on_delete=models.CASCADE)
#     day = models.DateField()
#     start_time = models.TimeField()
#     end_time = models.TimeField()

#     def __str__(self):
#         return self.start_time
@api_view(['GET'])
def getExams(request, pk):
    a = datetime.now()
    b = a + timedelta(days=364)
    exams = Exam.objects.all().filter(user=User.objects.get(
        id=pk), day__range=[str(str(a.year) + "-" + str(a.month) + "-" + str(a.day)), str(str(b.year) + "-" + str(b.month) + "-" + str(b.day))])
    returnable = []
    for i in exams:
        aDict = {"module": i.module.name, "day": i.day,
                 "start_time": i.start_time, "end_time": i.end_time}
        returnable.append(aDict)
    return Response(returnable)
