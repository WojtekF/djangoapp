from django.conf.urls import patterns, include, url
from .views import *
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    (r'^$',VatListView.as_view(),{'page':1},'vat_list'),
    (r'^(?P<page>\d+)/$',VatListView.as_view(),{},'vat_list'),
    (r'^add/$',AddVAT.as_view(),{},'vat_add'),
    (r'^edit/(?P<pk>[\w-]+)$',UpdateVAT.as_view(),{},'vat_edit'),
    (r'^del/(?P<pk>[\w-]+)$',DeleteVAT.as_view(),{},'vat_del'),
)
