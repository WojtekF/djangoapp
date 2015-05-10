# Create your views here
from django.views.generic import TemplateView, ListView, CreateView, UpdateView, DeleteView
from core.mixins import *
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from .forms import *
from contractors.models import Customer
from products.models import Product
from django.shortcuts import render_to_response
import json as simplejson


"""class AddDiscount(LoginRequiredMixin, CreateView):
    form_class = AddDiscountForm
    model = Discount
    template_name = 'form.html'

    def form_valid(self,form):
        discount = form.save(commit=False)
        discount.whoModified = self.request.user
        discount.save()
        return HttpResponseRedirect(self.get_success_url())
"""


def sale(request):
    prods = Product.objects.filter(isActive=True)
    return render_to_response('sale.html',{'products': prods})


def get_contractors(request):
    print 'inside request'
    if request.is_ajax():
        print 'in ajax'
        contractors = Customer.objects.filter(isActive = True)
        return render_to_response('contractors_selection.html', {'contractors': contractors})
     #user = MyUser(username='WWW', password='123456')


def create_new_order(request, id):
    if request.is_ajax():
        customer = Customer.objects.get(id=id)
        customer.sp = customer.sellingplace_set.filter(isActive=True)
        kinds = [(1, 'Paragon'), (2,'Faktura'), (3,'Faktura europejska')]
        return render_to_response('initial_selling.html',{'customer': customer, 'kinds': kinds})