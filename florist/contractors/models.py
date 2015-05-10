from django.db import models
from core.models import BaseModel
from django.core.validators import MaxValueValidator, MinValueValidator


class Customer (BaseModel):
    nip = models.CharField(max_length=13)
    name = models.CharField(max_length=512)
    address = models.CharField(max_length=512)
    telNumber = models.CharField(max_length=32)
    discount = models.IntegerField(validators=[MaxValueValidator(100), MinValueValidator(0)])
    isForeigner = models.BooleanField(default=False)


class SellingPlace(BaseModel):
    owner = models.ForeignKey('Customer')
    address = models.CharField(max_length=512)
    telNumber = models.CharField(max_length=32)
