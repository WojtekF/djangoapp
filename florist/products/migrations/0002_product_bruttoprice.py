# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='bruttoPrice',
            field=models.DecimalField(default=0, max_digits=6, decimal_places=2),
            preserve_default=True,
        ),
    ]
