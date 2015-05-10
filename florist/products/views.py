# Create your views here.
from itertools import product
from .models import Product
from .forms import AddProductForm
from core.mixins import LoginRequiredMixin, ContextWithUrlForFormsMixin,AjaxTemplateMixin
from django.views.generic import TemplateView, ListView, CreateView, UpdateView, DeleteView
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.db.models import Q
from django.shortcuts import render_to_response
import json as json
from django.core import serializers


class AddProduct(LoginRequiredMixin, AjaxTemplateMixin, CreateView):#,PermissionRequiredMixin):
    form_class = AddProductForm
    model = Product
    template_name = 'form.html'

    def form_valid(self,form):
        product = form.save(commit=False)
        product.whoModified = self.request.user
        product.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('products_list')


class DeleteProduct(LoginRequiredMixin, DeleteView):
    model = Product
    template_name = 'confirm_delete.html'

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.isActive = False
        self.object.whoModified = request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('products_list')


class UpdateProduct(LoginRequiredMixin, AjaxTemplateMixin, UpdateView):
    form_class = AddProductForm
    model = Product
    template_name = 'form.html'

    def form_valid(self, form):
        customer = form.save(commit=False)
        customer.whoModified = self.request.user
        customer.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse('products_list')


class ProductsListView(LoginRequiredMixin, ContextWithUrlForFormsMixin, ListView):
    model = Product
    template_name = 'product_list.html'
    paginate_by = 10
    form_submit_url = 'product_add'
    modal_title = 'Dodaj nowy produkt'
    edit_title = 'Edycja produktu'


def products_list(request):
    if request.is_ajax():
        search = request.GET['search[value]']
        products = []
        prods = Product.objects.filter(isActive=True)#.filter(Q(name__contains=search)|Q(symbol__contains=search))
        for p in prods:
            products.append({'symbol': str(p.symbol), 'name': str(p.name), 'id': str(p.id), 'netto': str(p.nettoPrice), 'brutto': str(p.bruttoPrice), 'vat': str(p.vatTax.percentage)})
        to_return = {'draw': request.GET['draw'], "recordsTotal": len(prods),  "recordsFiltered": len(prods),  "data": products}
        return HttpResponse(json.dumps(to_return), content_type="application/json")
        # return render_to_response('ajaxProductsList.html', {'products' : Product.objects.filter(isActive = True)})