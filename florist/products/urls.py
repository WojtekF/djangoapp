from django.conf.urls import patterns
from .views import *
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    (r'^$', ProductsListView.as_view(), {'page': 1}, 'products_list'),
    (r'^(?P<page>\d+)/$', ProductsListView.as_view(), {}, 'products_list'),
    (r'^add/$', AddProduct.as_view(), {}, 'product_add'),
    (r'^edit/(?P<pk>[\w-]+)$', UpdateProduct.as_view(), {}, 'product_edit'),
    (r'^del/(?P<pk>[\w-]+)$', DeleteProduct.as_view(), {}, 'product_del'),
    (r'^ajaxProducts$', products_list),
    # Examples:
    # url(r'^$', 'florist.views.home', name='home'),
    # url(r'^florist/', include('florist.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
