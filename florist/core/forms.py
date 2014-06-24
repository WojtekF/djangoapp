from django.forms import ModelForm
from .mixins import FilterFormQueriesMixin

class BaseForm(FilterFormQueriesMixin,ModelForm):

    class Meta:
        exclude=['isActive', 'whoModified', 'lastModification'] 
