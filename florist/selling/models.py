from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from core.models import *
#from vats.models import *

class DailyReport(BaseModel):
	ammount = models.DecimalField(decimal_places=2,max_digits=6)
	date = models.DateField()
	owner = models.ForeignKey('core.MyUser',related_name='Owner')

class Product(BaseModel):
	name = models.CharField(max_length=256)
	symbol = models.CharField(max_length=32)
	vatTax=models.ForeignKey('vats.VAT')
	nettoPrice = models.DecimalField(decimal_places=2,max_digits=6)
	invoiceType = models.BooleanField(default=True) # if True Zamowienie, else Faktura

class Discount(BaseModel):
	percentage = models.IntegerField(validators=[MaxValueValidator(100),MinValueValidator(0)])

class Order(BaseModel):
	place = models.ForeignKey('contractors.SellingPlace')
	number = models.CharField(max_length=32)
	payment = models.DecimalField(decimal_places=2,max_digits=6)
	whoMadeIt = models.ForeignKey('core.MyUser',related_name='Order')

class OrderPosition(BaseModel):
	lp = models.IntegerField()
	order = models.ForeignKey('Order')
	product = models.ForeignKey('Product')
	ammount = models.DecimalField(decimal_places=2,max_digits=6)
	nettoValue = models.DecimalField(decimal_places=2,max_digits=6)
	vatValue = models.DecimalField(decimal_places=2,max_digits=6)
	bruttoValue=models.DecimalField(decimal_places=2,max_digits=6)

