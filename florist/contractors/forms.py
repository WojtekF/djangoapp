from core.forms import BaseForm 
from .models import *
#from selling.models import Discount


class AddCustomerForm(BaseForm):
    fields_to_filter = []

    class Meta(BaseForm.Meta):
        model = Customer


class AddSellingPlaceForm(BaseForm):
    fields_to_filter = []

    class Meta(BaseForm.Meta):
        exclude = ['owner', 'isActive', 'whoModified', 'lastModification']
        model = SellingPlace