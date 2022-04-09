from django.db import models

# Create your models here.


class User(models.Model):
    name = models.TextField()
    password = models.TextField()
    year = models.IntegerField()
    position = models.IntegerField()
    attendance = models.IntegerField()
    contact = models.TextField()
    img = models.TextField()
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


class Tutor(models.Model):
    name = models.TextField()

    def __str__(self):
        return self.name


class Announcement(models.Model):
    tutor = models.ForeignKey(Tutor, on_delete=models.CASCADE)
    title = models.TextField()
    description = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.title


class Event(models.Model):
    title = models.TextField()
    description = models.TextField()
    start_time = models.TimeField()
    end_time = models.TimeField()
    date = models.DateField()

    def __str__(self):
        return self.title


class Holiday(models.Model):
    title = models.TextField()
    description = models.TextField()
    date = models.DateField()
    
    def __str__(self):
        return self.title


class Module(models.Model):
    name = models.TextField()
    
    def __str__(self):
        return self.name


class Routine(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    module = models.ForeignKey(Module, on_delete=models.CASCADE)
    day = models.IntegerField()  # should represent sunday monday tuesday, 1-7
    start_time = models.TimeField()
    end_time = models.TimeField()
    meet_link = models.TextField(blank=True, null=True)
    remarks = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.start_time


class Exam(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    module = models.ForeignKey(Module, on_delete=models.CASCADE)
    day = models.DateField()
    start_time = models.TimeField()
    end_time = models.TimeField()
    
    def __str__(self):
        return self.start_time

# class User(models.Model):
#     email = models.EmailField(blank=True, null=True)
#     bank_balance = models.FloatField()
#     is_deactivated = models.BooleanField(default=False)
#     pin_code = models.IntegerField(blank=True, null = True)
#     theme_preference = models.ForeignKey(Theme, on_delete=models.CASCADE)
#     avatar = models.ForeignKey(Avatar, on_delete=models.CASCADE)
#     name = models.TextField()
#     monthly_target_saving = models.FloatField()
#     date_time = models.DateTimeField(auto_now_add=True)

#     def __str__(self):
