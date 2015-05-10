# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('isActive', models.BooleanField(default=True)),
                ('lastModification', models.DateTimeField(auto_now=True)),
                ('nip', models.CharField(max_length=13)),
                ('name', models.CharField(max_length=512)),
                ('address', models.CharField(max_length=512)),
                ('telNumber', models.CharField(max_length=32)),
                ('discount', models.IntegerField(validators=[django.core.validators.MaxValueValidator(100), django.core.validators.MinValueValidator(0)])),
                ('whoModified', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SellingPlace',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('isActive', models.BooleanField(default=True)),
                ('lastModification', models.DateTimeField(auto_now=True)),
                ('address', models.CharField(max_length=512)),
                ('telNumber', models.CharField(max_length=32)),
                ('owner', models.ForeignKey(to='contractors.Customer')),
                ('whoModified', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
    ]
