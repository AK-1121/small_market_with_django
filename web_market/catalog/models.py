from django.db import models


# Create your models here.
class ProductType(models.Model):
    name = models.CharField(max_length=50)
    raiting = models.DecimalField(max_digits=7, decimal_places=4)
    description = models.TextField


class SubProductType(models.Model):
    type_id = models.ForeignKey('ProductType', on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    raiting = models.DecimalField(max_digits=7, decimal_places=4)
    description = models.TextField


class Product(models.Model):
    sub_type_id = models.IntegerField
    name = models.CharField(max_length=200)
    manufacture = models.CharField(max_length=200)
    raiting = models.DecimalField(max_digits=4, decimal_places=2)
    image_url = models.ImageField(upload_to='static/', height_field=300, width_field=400)
    parameters = models.CharField(max_length=3000)


class Shop(models.Model):
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=2000)
    raiting = models.DecimalField(max_digits=7, decimal_places=4)
    self_pickup = models.BooleanField
    phones = models.CharField(max_length=200)
    delivery_conditions = models.CharField(max_length=200)
    url = models.URLField


class SaleVariant(models.Model):
    product_id = models.ForeignKey('Product', on_delete=models.CASCADE)
    shop_id = models.ForeignKey('Shop', on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=9, decimal_places=2)
    amount = models.IntegerField
    url = models.URLField
    special_parameters = models.CharField(max_length=3000)


