from django.db import models
from core.models import BaseModel
from django.core.validators import MaxValueValidator, MinValueValidator

# Create your models here.

class VAT(BaseModel):
	name = models.CharField(max_length=32)
	percentage = models.IntegerField(validators=[MaxValueValidator(100),MinValueValidator(0)])

	def __unicode__(self):
		return self.name
