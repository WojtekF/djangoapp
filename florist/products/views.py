# Create your views here.
from .models import Product
from .forms import  AddProductForm
from core.mixins import LoginRequiredMixin
from django.views.generic import TemplateView, ListView, CreateView, UpdateView, DeleteView
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse

class AddProduct(LoginRequiredMixin, CreateView):#,PermissionRequiredMixin):
    form_class=AddProductForm
    model=Product
    template_name = 'form.html'

    def form_valid(self,form):
        product=form.save(commit=False)
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


class UpdateProduct(LoginRequiredMixin, UpdateView):
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


class ProductsListView(LoginRequiredMixin, ListView):
    model = Product
    template_name = 'product_list.html'
    paginate_by = 10