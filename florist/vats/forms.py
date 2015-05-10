from core.forms import BaseForm
from .models import VAT


class AddVatForm(BaseForm):
    fields_to_filter = []

    class Meta(BaseForm.Meta):
        model = VAT 
