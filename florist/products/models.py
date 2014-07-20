from django.db import models
from core.models import BaseModel

class Product(BaseModel):
	name = models.CharField(max_length=256)
	symbol = models.CharField(max_length=32)
	vatTax=models.ForeignKey('vats.VAT')
	nettoPrice = models.DecimalField(decimal_places=2,max_digits=6)
