# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('contractors', '0001_initial'),
        ('products', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='DailyReport',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('isActive', models.BooleanField(default=True)),
                ('lastModification', models.DateTimeField(auto_now=True)),
                ('amount', models.DecimalField(max_digits=6, decimal_places=2)),
                ('date', models.DateField()),
                ('owner', models.ForeignKey(related_name='Owner', to=settings.AUTH_USER_MODEL)),
                ('whoModified', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('isActive', models.BooleanField(default=True)),
                ('lastModification', models.DateTimeField(auto_now=True)),
                ('number', models.CharField(unique=True, max_length=32)),
                ('payment', models.DecimalField(max_digits=6, decimal_places=2)),
                ('place', models.ForeignKey(to='contractors.SellingPlace')),
                ('whoMadeIt', models.ForeignKey(related_name='Order', to=settings.AUTH_USER_MODEL)),
                ('whoModified', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='OrderPosition',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('isActive', models.BooleanField(default=True)),
                ('lastModification', models.DateTimeField(auto_now=True)),
                ('lp', models.IntegerField()),
                ('amount', models.DecimalField(max_digits=6, decimal_places=2)),
                ('nettoValue', models.DecimalField(max_digits=6, decimal_places=2)),
                ('vatValue', models.DecimalField(max_digits=6, decimal_places=2)),
                ('bruttoValue', models.DecimalField(max_digits=6, decimal_places=2)),
                ('order', models.ForeignKey(to='selling.Order')),
                ('product', models.ForeignKey(to='products.Product')),
                ('whoModified', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
    ]
