from django.db import models
from core.models import BaseModel

class Customer (BaseModel):
	nip = models.CharField(max_length=13)
	name = models.CharField(max_length=512)
	address = models.CharField(max_length=512)
	telNumber = models.CharField(max_length=32)
	customerDiscount = models.ForeignKey('selling.Discount')


class SellingPlace(BaseModel):
	owner = models.ForeignKey('Customer')
	address = models.CharField(max_length=512)
	telNumber = models.CharField(max_length=32)
