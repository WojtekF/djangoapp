from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator

# Create your models here.

#the only class which do not inherit from BaseModel
#it's been created for extending custom Django User
class CustomUser(models.Model):
	DUser=models.OneToOneField(User)
	Rights = models.ManyToManyField('Right')


class BaseModel(models.Model):
	Id= models.AutoField(primary_key=True)
	IsActive = models.BooleanField(default=True)
	LastModification = models.DateTimeField(auto_now=True)
	WhoMofified=models.ForeignKey('CustomUser')
	class Meta:
		abstract=True

class Customer (BaseModel):
	NIP = models.CharField(max_length=13)
	Name = models.CharField(max_length=512)
	Address = models.CharField(max_length=512)
	TelNumber = models.CharField(max_length=32)
	CustomerDiscount = models.ForeignKey('Discount')

class Product(BaseModel):
	Name = models.CharField(max_length=256)
	Symbol = models.CharField(max_length=32)
	VATTax=models.ForeignKey('VAT')
	NettoPrice = models.DecimalField(decimal_places=2,max_digits=6)
	InvoiceType = models.BooleanField(default=True) # if True Zamowienie, else Faktura

class VAT(BaseModel):
	Name = models.CharField(max_length=32)
	Percentage = models.IntegerField(validators=[MaxValueValidator(100),MinValueValidator(0)])

class Discount(BaseModel):
	Percentage = models.IntegerField(validators=[MaxValueValidator(100),MinValueValidator(0)])

class Right(BaseModel):
	Name = models.CharField(max_length=16)

class SellingPlace(BaseModel):
	Owner = models.ForeignKey('Customer')
	Address = models.CharField(max_length=512)
	TelNumber = models.CharField(max_length=32)

class Order(BaseModel):
	Place = models.ForeignKey('SellingPlace')
	Number = models.CharField(max_length=32)
	Payment = models.DecimalField(decimal_places=2,max_digits=6)
	WhoMadeIt = models.ForeignKey('CustomUser',related_name='Order')

class OrderPosition(BaseModel):
	LP = models.IntegerField()
	Order = models.ForeignKey('Order')
	Product = models.ForeignKey('Product')
	Ammount = models.DecimalField(decimal_places=2,max_digits=6)
	NettoValue = models.DecimalField(decimal_places=2,max_digits=6)
	VatValue = models.DecimalField(decimal_places=2,max_digits=6)
	BruttoValue=models.DecimalField(decimal_places=2,max_digits=6)


