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
            name='VAT',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('isActive', models.BooleanField(default=True)),
                ('lastModification', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=32)),
                ('percentage', models.IntegerField(validators=[django.core.validators.MaxValueValidator(100), django.core.validators.MinValueValidator(0)])),
                ('whoModified', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
    ]
