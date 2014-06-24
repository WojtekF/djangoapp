from vats.models import VAT
from core.forms import BaseForm
from .models import Product

class AddProductForm(BaseForm):
    fields_to_filter = [("vatTax",VAT)]        

    class Meta(BaseForm.Meta):
        model=Product


