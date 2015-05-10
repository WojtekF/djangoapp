from django.conf.urls import patterns, include, url
from .views import *
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    (r'^$', CustomerListView.as_view(), {'page': 1}, 'customers_list'),
    (r'^(?P<page>\d+)/$', CustomerListView.as_view(), {}, 'customers_list'),
    (r'^add/$', AddCustomer.as_view(), {}, 'customer_add'),
    (r'^edit/(?P<pk>[\w-]+)$', UpdateCustomer.as_view(), {}, 'customer_edit'),
    (r'^del/(?P<pk>[\w-]+)$', DeleteCustomer.as_view(), {}, 'customer_del'),
    (r'^details/(?P<pk>\d+)/add$', AddSP.as_view(), {}, 'sp_add'),
    (r'^details/(?P<customer>\d+)/edit/(?P<pk>\d+)$', UpdateSP.as_view(), {}, 'sp_edit'),
    (r'^details/(?P<customer>\d+)/del/(?P<pk>\d+)$', DeleteSP.as_view(), {}, 'sp_del'),
    (r'^details/(?P<pk>\d+)$', CustomerDetails.as_view(), {'page': 1}, 'customer_details'),
    (r'^details/(?P<pk>\d+)/(?P<page>\d+)$', CustomerDetails.as_view(), {}, 'customer_details'),
) 
