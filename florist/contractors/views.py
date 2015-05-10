# Create your views here.

from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.views.generic.detail import SingleObjectMixin
from core.mixins import *
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from .models import *
from .forms import AddCustomerForm, AddSellingPlaceForm


class AddCustomer(LoginRequiredMixin, AjaxTemplateMixin, CreateView):
    form_class = AddCustomerForm
    model = Customer
    template_name = 'form.html'
    
    def form_valid(self, form):
        customer = form.save(commit=False)
        customer.whoModified = self.request.user
        customer.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('customers_list')


class DeleteCustomer(LoginRequiredMixin, DeleteView):
    model = Customer
    template_name ='confirm_delete.html'
    
    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.isActive = False
        self.object.whoModified = request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('customers_list')


class UpdateCustomer(LoginRequiredMixin, AjaxTemplateMixin, UpdateView):
    form_class = AddCustomerForm
    model = Customer
    template_name = 'form.html'
    
    def form_valid(self, form):
        customer = form.save(commit=False)
        customer.whoModified = self.request.user
        customer.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('customers_list')


class CustomerListView(LoginRequiredMixin, ContextWithUrlForFormsMixin, ListView):
    model = Customer
    form_submit_url = 'customer_add'
    template_name = 'customer_list.html'
    paginate_by = 10
    modal_title = 'Dodaj nowego kontrahenta'
    edit_title = 'Edycja kontrahenta'


class CustomerDetails(LoginRequiredMixin, SingleObjectMixin, ContextWithUrlForFormsMixin, ListView):
    paginate_by = 1
    template_name = 'customer_details.html'
    form_submit_url = 'customer_add' #hack to go further
    modal_title = 'Dodaj nowy punkt sprzedazy'
    edit_title = 'Edycja punktu sprzedazy'

    def get(self, request, *args, **kwargs):
        self.object = self.get_object(queryset=Customer.objects.all())
        return super(CustomerDetails, self).get(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(CustomerDetails, self).get_context_data(**kwargs)
        context['customer'] = self.object
        return context

    def get_queryset(self):
        return self.object.sellingplace_set.all()


class AddSP(LoginRequiredMixin, AjaxTemplateMixin, CreateView):
    form_class = AddSellingPlaceForm
    model = SellingPlace
    template_name = 'form.html'

    def form_valid(self, form):
        place = form.save(commit=False)
        place.whoModified = self.request.user
        place.owner = Customer.objects.get(pk=self.kwargs['pk'])
        place.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('customer_details', args=(self.kwargs['pk'],))


class DeleteSP(LoginRequiredMixin, DeleteView):
    model = SellingPlace
    template_name = 'confirm_delete.html'

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.isActive = False
        self.object.whoModified = request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('customer_details', args=(self.kwargs['customer'],))


class UpdateSP(LoginRequiredMixin, AjaxTemplateMixin, UpdateView):
    form_class = AddSellingPlaceForm
    model = SellingPlace
    template_name = 'form.html'

    def form_valid(self, form):
        customer = form.save(commit=False)
        customer.whoModified = self.request.user
        customer.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('customer_details', args=(self.kwargs['customer'],))