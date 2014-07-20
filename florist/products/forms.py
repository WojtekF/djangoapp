from core.forms import  BaseForm
from .models import Product
from vats.models import VAT


class AddProductForm(BaseForm):
    fields_to_filter = [("vatTax", VAT)]

    class Meta(BaseForm.Meta):
        model=Product