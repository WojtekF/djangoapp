from django.core.urlresolvers import reverse
from django.utils.decorators import method_decorator
from django.conf import settings
from django.contrib.auth.decorators import login_required


class LoginRequiredMixin(object):
    """
    View mixin which verifies that the user has authenticated.

    NOTE:
        This should be the left-most mixin of a view.
    """

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(*args, **kwargs)

class PermissionRequiredMixin(object):
    """
    View mixin which verifies that the logged in user has the specified
    permission.

    Class Settings
    `permission_required` - the permission to check for.
    `login_url` - the login url of site
    `redirect_field_name` - defaults to "next"
    `raise_exception` - defaults to False - raise 403 if set to True

    Example Usage

        class SomeView(PermissionRequiredMixin, ListView):
            ...
            # required
            permission_required = "app.permission"

            # optional
            login_url = "/signup/"
            redirect_field_name = "hollaback"
            raise_exception = True
            ...
    """
    login_url = settings.LOGIN_URL
    permission_required = None
    raise_exception = False

    def dispatch(self, request, *args, **kwargs):
        # Verify class settings
        if self.permission_required == None or len(
            self.permission_required.split(".")) != 2:
            raise ImproperlyConfigured("'PermissionRequiredMixin' requires "
                "'permission_required' attribute to be set.")

        has_permission = request.user.has_perm(self.permission_required)

        if not has_permission:
            return HttpResponseForbidden()
        return super(PermissionRequiredMixin, self).dispatch(
            request, *args, **kwargs)

class UserFormKwargsMixin(object):
    """
    CBV mixin which puts the user from the request into the form kwargs.
    Note: Using this mixin requires you to pop the `user` kwarg
    out of the dict in the super of your form's `__init__`.
    """
    def get_form_kwargs(self, **kwargs):
        kwargs = super(UserFormKwargsMixin, self).get_form_kwargs(**kwargs)
        kwargs.update({"user": self.request.user})
        return kwargs

class FilterFormQueriesMixin(object):
    
    fields_to_filter = None
    def __init__(self,*args,**kwargs):
        super(FilterFormQueriesMixin,self).__init__(*args,**kwargs)
        if self.fields_to_filter is None:
            raise "Brak pol do przefiltrowania"

        for field in self.fields_to_filter:
            print field
            self.fields[field[0]].queryset = field[1].objects.exclude(isActive=False)
