from core.models import *
import datetime


class DailyReport(BaseModel):
    amount = models.DecimalField(decimal_places=2, max_digits=6)
    date = models.DateField()
    owner = models.ForeignKey('core.MyUser', related_name='Owner')


class Order(BaseModel):

    place = models.ForeignKey('contractors.SellingPlace')
    number = models.CharField(max_length=32, unique=True)
    payment = models.DecimalField(decimal_places=2, max_digits=6)
    whoMadeIt = models.ForeignKey('core.MyUser', related_name='Order')


class Invoice(Order):
    pass


class CorrectingInvoice(Order):
    corrected = models.ForeignKey('selling.Invoice')


class EuropeanInvoice(Order):
    pass


class EuropeanCorrectingInvoice(Order):
    corrected = models.ForeignKey('selling.EuropeanInvoice')


class OrderPosition(BaseModel):
    lp = models.IntegerField()
    order = models.ForeignKey('Order')
    product = models.ForeignKey('products.Product')
    amount = models.DecimalField(decimal_places=2, max_digits=6)
    nettoValue = models.DecimalField(decimal_places=2, max_digits=6)
    vatValue = models.DecimalField(decimal_places=2, max_digits=6)
    bruttoValue= models.DecimalField(decimal_places=2, max_digits=6)

