# Create your views here.
from django.views.generic import TemplateView, ListView, CreateView, UpdateView, DeleteView, FormView
from django.shortcuts import render_to_response, render
from core.mixins import *
from core.forms import *
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from .models import VAT
from .forms import *


class UpdateVAT(LoginRequiredMixin, AjaxTemplateMixin, UpdateView):
    form_class = AddVatForm
    model = VAT
    template_name = 'form.html'
    form_submit_url = 'vat_edit'

    def form_valid(self, form):
        vat = form.save(commit=False)
        vat.whoModified = self.request.user
        vat.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('vat_list')


class DeleteVAT(LoginRequiredMixin, DeleteView):
    template_name = 'confirm_delete.html'
    model = VAT

    def delete(self, request,*args,**kwargs):
        self.object = self.get_object()
        self.object.isActive = False
        self.object.whoModified=request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('vat_list')


class AddVAT(LoginRequiredMixin, AjaxTemplateMixin, FormView):#,PermissionRequiredMixin):
    form_class = AddVatForm
    model = VAT
    template_name = 'form.html'

    def form_valid(self, form):
        vat = form.save(commit=False)
        vat.whoModified = self.request.user
        vat.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('vat_list')


class VatListView(LoginRequiredMixin, ContextWithUrlForFormsMixin, ListView):
    model = VAT
    template_name = 'vat_list.html'
    paginate_by = 10
    form_submit_url = 'vat_add'
    modal_title = 'Dodaj nowa stawke VAT'
    edit_title = 'Edytuj stawke VAT'
