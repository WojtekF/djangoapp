from core.forms import BaseForm 
from .models import *
from selling.models import Discount

class AddCustomerForm(BaseForm):
    fields_to_filter = ['customerDiscount' : Discount ]

    class Meta(BaseForm.Meta):
        model = Cutomer
