# Create your views here
from django.views.generic import TemplateView, ListView, CreateView, UpdateView, DeleteView
from django.shortcuts import render_to_response, render
from .models import  Product
from core.mixins import *
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from .forms import *
from core.models import *

class AddProduct(LoginRequiredMixin,CreateView):#,PermissionRequiredMixin):
    form_class=AddProductForm
    model=Product
    template_name = 'productsAdd.html'

    def form_valid(self,form):
        product=form.save(commit=False)
        product.whoModified = self.request.user
        product.save()
        return HttpResponseRedirect(self.get_success_url())

def AddDiscount(LoginRequiredMixin,CreateView):
	form_class = AddDiscountForm
    model = Discount
    template_name = 'discountAdd.html'

    def form_valid(self,form):
        discount = form.save(commit=False)
        discount.whoModified = self.request.user
        discount.save()
        return HttpResponseRedirect(self.get_success_url())

#user = MyUser(username='WWW', password='123456')
