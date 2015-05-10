from django.forms import ModelForm
from .mixins import FilterFormQueriesMixin
from django.contrib.auth.forms import AuthenticationForm
from crispy_forms.helper import FormHelper


class BaseForm(FilterFormQueriesMixin, ModelForm):

    @property
    def helper(self):
        helper = FormHelper()
        helper.form_tag = False # don't render form DOM element
        helper.render_unmentioned_fields = True # render all fields
        helper.label_class = 'col-md-2'
        helper.field_class = 'col-md-10'
        return helper

    class Meta:
        exclude = ['isActive', 'whoModified', 'lastModification']


class AuthForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super(AuthForm, self).__init__(*args, **kwargs)
        self.fields["username"].label = "Login"
        self.fields["password"].label = "Haslo"