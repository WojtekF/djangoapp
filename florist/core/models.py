from django.db import models
from django.contrib.auth.models import AbstractUser


class BaseModel(models.Model):
    id = models.AutoField(primary_key=True)
    isActive = models.BooleanField(default=True)
    lastModification = models.DateTimeField(auto_now=True)
    whoModified = models.ForeignKey('MyUser')

    class Meta:
        abstract = True


class MyUser(AbstractUser):
    pass
